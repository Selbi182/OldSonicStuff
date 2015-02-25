; ===========================================================================
; ---------------------------------------------------------------------------
; Start of ROM data
; ---------------------------------------------------------------------------

		dc.l	$00000000,SetupGame,ErrorTrap,ErrorTrap
		dc.l	ErrorTrap,ErrorTrap,ErrorTrap,ErrorTrap
		dc.l	ErrorTrap,ErrorTrap,ErrorTrap,ErrorTrap
		dc.l	ErrorTrap,ErrorTrap,ErrorTrap,ErrorTrap
		dc.l	ErrorTrap,ErrorTrap,ErrorTrap,ErrorTrap
		dc.l	ErrorTrap,ErrorTrap,ErrorTrap,ErrorTrap
		dc.l	ErrorTrap,ErrorTrap,ErrorTrap,ErrorTrap
		dc.l	HBlankInt,$00000000,VBlankInt,$00000000
SetupData:	dc.w	$8000|%00000100			; 00LH 01CD - Leftover SMS bar (0N|1Y) | H-Interrupt (0N|1Y) | H,V Counter (0N|1Y) | Disable video signal (0N|1Y)
		dc.w	$8100|%00010100			; SDVM P100 - SMS mode (0N|1Y) | Display (0N|1Y) | V-Interrupt (0N|1Y) | DMA (0N|1Y) | V-resolution (0-1C|1-1E)
		dc.w	$8200|((($C000)>>$0A)&$FF)	; 00FE DCBA - Scroll Plane A Map Table VRam address
		dc.w	$8300|((($D000)>>$0A)&$FF)	; 00FE DCB0 / 00FE DC00 (20 Resolution) - Window Plane A Map Table VRam address
		dc.w	$8400|((($E000)>>$0D)&$FF)	; 0000 0FED - Scroll Plane B Map Table VRam address
		dc.w	$8500|((($FC00)>>$09)&$FF)	; 0FED CBA9 / 0FED CBA0 (20 Resolution) - Sprite Plane Map Table VRam address
		dc.w	$8600				; 0000 0000 - Unknown/Unused Register
		dc.w	$8700				; 00PP CCCC - Backdrop Colour: Palette Line 0/Colour ID 0
		dc.w	$8800				; 0000 0000 - Unknown/Unused Register
		dc.w	$8900				; 0000 0000 - Unknown/Unused Register
		dc.w	$8ADF				; 7654 3210 - H-Interrupt Register
		dc.w	$8B00|%00000000			; 0000 EVHH - External Interrupt (0N|1Y) | V-Scroll: (0-Full|1-2Celled) | H-Scroll: (00-Full|10-Celled|11-Sliced)
		dc.w	$8C00|%10000001			; APHE SNNB - H-resol (0N|1Y) | Pixel int (0N|1Y) | H-sync (0N|1Y) | Extern-pix (0N|1Y) | S/H (0N|1Y) | Interlace (00N|01Y|11-Split) | H-resol (0-20|1-28)
		dc.w	$8D00|((($F800)>>$0A)&$FF)	; 00FE DCBA - Horizontal Scroll Table VRam address
		dc.w	$8E00				; 0000 0000 - Unknown/Unused Register
		dc.w	$8F02				; 7654 3210 - Auto Increament: By 2
		dc.w	$9000|%00000001			; 00VV 00HH - Plane Y Size (00-20|01-40|11-80) | Plane X size (00-20|01-40|11-80)
		dc.w	$9100				; 7654 3210 - Window Horizontal Position
		dc.w	$9200				; 7654 3210 - Window Vertical Position
		dc.w	$93FF				; 7654 3210 - DMA Fill Size (FFFF bytes)
		dc.w	$94FF				; FEDC BA98 - ''
		dc.w	$9500				; 7654 3210 - DMA Fill Source (800000 Fill mode)
		dc.w	$9600				; FEDC BA98 - ''
		dc.w	$9780				; D654 3210 - '' D = DMA
		dc.l	$40000080			; DMA Fill destination
		dc.l	$C0000000			; CRAM write mode
		dc.l	$40000010			; VSRAM write mode
		dc.l	$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000

ConsoleName:	dc.b	'SEGA MEGA DRIVE '
ProductDate:	dc.b	'(C)???? YYYY.MMM'
TitleLocal:	dc.b	'Engine Test                                     '
TitleInter:	dc.b	'Engine Test                                     '
SerialNumber:	dc.b	'GM XXXXXXXXXXX'
Checksum:	dc.w	$0000
IOSupport:	dc.b	'J               '
ROMStart:	dc.l	$00000000
ROMFinish:	dc.l	$003FFFFF
RAMStart:	dc.l	$00FF0000
RAMFinish:	dc.l	$00FFFFFF
SupportRAM:	dc.b	'RA',%11111000,%00100000
SRAMStart:	dc.l	$00200000
SRAMFinish:	dc.l	$00203FFF
ProductNotes:	dc.b	'To improve performance, sometimes we must backtrack.'
ProductRegion:	dc.b	'JUE             '

; ===========================================================================
; ---------------------------------------------------------------------------
; Z80 ROM address
; ---------------------------------------------------------------------------

Z80ROM:		dc.b	$F3					; di
		dc.b	$18,$FE					; jr	$
Z80ROM_End:	even

; ===========================================================================
; ---------------------------------------------------------------------------
; Start of Setup data
; ---------------------------------------------------------------------------

SetupGame:
		move.b	($A10001).l,d0				; load hardware I/O data
		andi.b	#$0F,d0					; get only the hardware version number
		beq.s	SM_NoHardware				; if it's null, then the machine is not official
		move.l	(ConsoleName).w,($A14000).l		; set the official security code "SEGA" (required for hardware)

SM_NoHardware:
		lea	($C00000).l,a5				; load VDP data port
		lea	$04(a5),a6				; load VDP control port to a6
		tst.w	(a6)					; reset 2nd destination write flag
		moveq	#$00,d0					; clear d0

	; --- VDP Register Setup & VRAM Clear ---

		lea	(SetupData).w,a4			; load VDP register data to write
		moveq	#($18/$08)-$01,d1			; set repeat times

SM_SetupVDP:
		move.l	(a4)+,(a6)				; save data to VDP registers
		move.l	(a4)+,(a6)				; ''
		move.l	(a4)+,(a6)				; ''
		move.l	(a4)+,(a6)				; ''
		dbf	d1,SM_SetupVDP				; repeat for all VDP registers
		move.w	#$8F01,(a6)				; set auto increment to byte
		move.l	(a4)+,(a6)				; finish the DMA fill, with the destination (VRAM 0000)
		move.w	d0,(a5)					; set DMA fill value (0000)

	; --- 68k RAM Clear ---

SkipVDPREG:
		movea.l	(RAMStart).w,a1				; load 68k RAM
		move.w	#(($10000/$04)/$04)-$01,d1		; set repeat times

SM_Setup68KRAM:
		move.l	d0,(a1)+				; clear 68k RAM
		move.l	d0,(a1)+				; ''
		move.l	d0,(a1)+				; ''
		move.l	d0,(a1)+				; ''
		dbf	d1,SM_Setup68KRAM			; repeat until RAM is cleared (VDP should be finished with DMA fill by now)
		move.w	#$8F02,(a6)				; set auto increment to word

	; --- CRAM Clear ---

		move.l	(a4)+,(a6)				; set VDP to CRAM write mode
		moveq	#(($80/$04)/$04)-$01,d1			; set repeat times

SM_SetupCRAM:
		move.l	d0,(a5)					; clear CRAM
		move.l	d0,(a5)					; ''
		move.l	d0,(a5)					; ''
		move.l	d0,(a5)					; ''
		dbf	d1,SM_SetupCRAM				; repeat until CRAM is cleared

	; --- VSRAM Clear ---

		move.l	(a4)+,(a6)				; set VDP to VSRAM write mode
		moveq	#(($50/$04)/$04)-$01,d1			; set repeat times

SM_SetupVSRAM:
		move.l	d0,(a5)					; clear VSRAM
		move.l	d0,(a5)					; ''
		move.l	d0,(a5)					; ''
		move.l	d0,(a5)					; ''
		dbf	d1,SM_SetupVSRAM			; repeat until VSRAM is cleared

	; --- I/O port initialisation ---

		moveq	#$40,d1					; prepare initialisation value
		move.b	d1,($A10009).l				; initialise port 1
		move.b	d1,($A1000B).l				; initialise port 2
		move.b	d1,($A1000D).l				; initialise port 3

	; --- Z80 Setup & YM2612 Reset ---

		lea	(Z80ROM).w,a0				; load Z80 ROM data
		lea	($A00000).l,a1				; load Z80 RAM space address
		move.w	#(Z80ROM_End-Z80ROM)-$01,d1		; set repeat times
		move.w	#$2000,d2				; prepare total Z80 size
		sub.w	d1,d2					; subtract repeat times from total size
		subq.w	#$02,d2					; decrease by 2 (for dbf)
		move.w	#$0100,($A11100).l			; request Z80 stop (ON)
		move.w	#$0100,($A11200).l			; request Z80 reset (OFF)
		btst.b	#$00,($A11100).l			; has the Z80 stopped yet?
		bne.s	*-$08					; if not, branch

SM_LoadZ80:
		move.b	(a0)+,(a1)+				; dump Z80 data to Z80 space
		dbf	d1,SM_LoadZ80				; repeat til done

SM_ClearZ80:
		move.b	d0,(a1)+				; clear remaining Z80 space
		dbf	d2,SM_ClearZ80				; repeat til done
		move.w	#$0000,($A11200).l			; request Z80 reset (ON)
		moveq	#$7F,d1					; set repeat times
		dbf	d1,*					; there's no way of checking for reset, so a manual delay is necessary
		move.w	#$0000,($A11100).l			; request Z80 stop (OFF)
		move.w	#$0100,($A11200).l			; request Z80 reset (OFF)

	; --- PSG Reset ---

		lea	$0D(a6),a1				; load PSG port address
		move.b	#$9F,(a1)				; set the PSG volumes to null (No sound)
		move.b	#$BF,(a1)				; ''
		move.b	#$DF,(a1)				; ''
		move.b	#$FF,(a1)				; ''

; ---------------------------------------------------------------------------
; Instruction test routine
; ---------------------------------------------------------------------------

		move.w	#$8100|%01100100,($C00004).l	; SDVM P100 - SMS mode (0N|1Y) | Display (0N|1Y) | V-Interrupt (0N|1Y) | DMA (0N|1Y) | V-resolution (0-1C|1-1E)

NextFrame:
		sf.b	($FFFF8000).w
		move	#$2300,sr

WaitVBlank:
		tst.b	($FFFF8000).w
		beq.s	WaitVBlank

	; --- Setup ---



	; --- Loop test area ---

	rept	$2000

		nop

	endr

	; --- --- --- ---

		move.l	#$C0000000,($C00004).l
		move.w	#$00E0,($C00000).l
		jmp	NextFrame

; ===========================================================================
; ---------------------------------------------------------------------------
; H-blank
; ---------------------------------------------------------------------------

HBlankInt:
		rte

; ===========================================================================
; ---------------------------------------------------------------------------
; V-blank
; ---------------------------------------------------------------------------

VBlankInt:
		move.l	#$C0000000,($C00004).l
		move.w	#$000E,($C00000).l
		st.b	($FFFF8000).w

VB_WaitDisplay:
		move.w	($C00004).l,d0
		btst.l	#$03,d0
		bne.s	VB_WaitDisplay
		rte

; ===========================================================================
; ---------------------------------------------------------------------------
; Trap routine
; ---------------------------------------------------------------------------

ErrorTrap:
		bra.s	ErrorTrap


; ===========================================================================

EndOfROM:


