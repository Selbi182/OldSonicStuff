; ===========================================================================
; ---------------------------------------------------------------------------
; Hello World
; ---------------------------------------------------------------------------

		dc.l	$00000000,StartGame,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	HBlankInt,$00000000,VBlankInt,$00000000

		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000
		dc.l	$00000000,$00000000,$00000000,$00000000

ConsoleName:	dc.b	'SEGA MEGA DRIVE '
ProductData:	dc.b	'(C)???? YYYY.MMM'
LocalTitle:	dc.b	'Hello World                                     '
InterTitle:	dc.b	'Hello World                                     '
SerialNumber:	dc.b	'GM XXXXXXXX-XX'
Checksum:	dc.w	$0000
IOSupport:	dc.b	'J               '
RomStart:	dc.l	$00000000
RomFinish:	dc.l	$001FFFFF
RamStart:	dc.l	$00FF0000
RamFinish:	dc.l	$00FFFFFF
SRamSupport:	dc.l	$20202020
SRamStart:	dc.l	$20202020
SRamFinish:	dc.l	$20202020
ProductNotes:	dc.b	'                                                    '
ProductRegions:	dc.b	'JUE             '

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; Startup machine
; ---------------------------------------------------------------------------

StartGame:
		move	#$2700,sr				; disable interrupts V and H

		move.b	($A10001).l,d0				; load hardware I/O data
		andi.b	#$0F,d0					; get only the hardware version number
		beq	Setup_NoHardware			; if it's null, then the machine is not official
		move.l	#'SEGA',($A14000).l			; set the official security code (required for hardware)

Setup_NoHardware:
		move.w	#$8014,($C00004).l			;[H-Interrupt On];[H,V Counter On];
		move.w	#$8174,($C00004).l			;[Display On];[V-Interrupt On];[DMA On];[V 28 Cell PAL/NTSC Mode];
		move.w	#$8200|((($C000)>>$0A)&$FF),($C00004).l	;[Scroll Plane A Map Table VRam address];  (V-Ram C000)
		move.w	#$8300|((($F000)>>$0A)&$FF),($C00004).l	;[Window Plane A Map Table VRam address];  (V-Ram F000)
		move.w	#$8400|((($E000)>>$0D)&$FF),($C00004).l	;[Scroll Plane B Map Table VRam address];  (V-Ram E000)
		move.w	#$8500|((($D000)>>$09)&$FF),($C00004).l	;[Sprite Plane Map Table VRam address];  (V-Ram D000)
		move.w	#$8600,($C00004).l			;[Unknown/Unused Register];
		move.w	#$8700,($C00004).l			;[Backdrop Colour: Palette Line 0/Colour ID 0];
		move.w	#$8800,($C00004).l			;[Unknown/Unused Register];
		move.w	#$8900,($C00004).l			;[Unknown/Unused Register];
		move.w	#$8ADF,($C00004).l			;[H-Interrupt Register];
		move.w	#$8B00,($C00004).l			;[External Interrupt Off];[V-Scroll: Full];[H-Scroll: Full];[Line: By Cell];
		move.w	#$8C81,($C00004).l			;[H-Mode: 32 Cell];[Shadow/Hi-Lighting Off];[Interlace Off];
		move.w	#$8D00|((($D800)>>$0A)&$FF),($C00004).l	;[Horizontal Scroll Table VRam address];  (V-Ram D800)
		move.w	#$8E00,($C00004).l			;[Unknown/Unused Register];
		move.w	#$8F02,($C00004).l			;[Auto Increament: By 2];
		move.w	#$9001,($C00004).l			;[VDP Screen Map Size: Vertical Size 32 (20) Cell/Horizontal Size 64 (40) Cell];
		move.w	#$9100,($C00004).l			;[Window Horizontal Position: 00];
		move.w	#$9200,($C00004).l			;[Window Vertical Position: 00];
		move.w	#$93FF,($C00004).l			;[DMA Transfer Size (Lower Byte XX00)];
		move.w	#$94FF,($C00004).l			;[DMA Transfer Size (Upper Byte 00XX)];
		move.w	#$9500,($C00004).l			;[DMA Transfer Source (Low Byte XXXX00)];
		move.w	#$9600,($C00004).l			;[DMA Transfer Source (Mid Byte XX00XX)];
		move.w	#$9780,($C00004).l			;[DMA Transfer Source (Hi- Byte 00XXXX)];

		move.w	#$0100,($A11100).l			; request Z80 stop (ON)
		move.w	#$0000,($A11200).l			; request Z80 reset (ON)
		moveq	#$40,d1					; prepare initiation flag
		move.b	d1,($A10009).l				; initiate port 1
		move.b	d1,($A1000B).l				; initiate port 2
		move.b	d1,($A1000D).l				; initiate port 3
		move.w	#$0100,($A11200).l			; request Z80 reset (OFF)

; ===========================================================================
; ---------------------------------------------------------------------------
; Writing art and mappings to V-Ram
; ---------------------------------------------------------------------------

		lea	($C00000).l,a5				; load VDP data port address to a5
		lea	$04(a5),a6				; load VDP address port address to a6

		move.l	#$40200000,(a6)				; set VDP address to write to
		lea	(Art).l,a0				; load uncompressed art to dump
		moveq	#$06,d7					; set repeat times

WriteArt:
		move.l	(a0)+,(a5)				; dump art to V-Ram
		move.l	(a0)+,(a5)				; ''
		move.l	(a0)+,(a5)				; ''
		move.l	(a0)+,(a5)				; ''
		move.l	(a0)+,(a5)				; ''
		move.l	(a0)+,(a5)				; ''
		move.l	(a0)+,(a5)				; ''
		move.l	(a0)+,(a5)				; ''
		dbf	d7,WriteArt				; repeat til art is written

		move.l	#$40000003,(a6)				; set VDP address to map plane (C000)
		move.l	#$00010002,(a5)				; dump map tile "h" and "e"
		move.l	#$00030003,(a5)				; dump map tile "l" and "l"
		move.l	#$00040000,(a5)				; dump map tile "o" and "space"
		move.l	#$00050004,(a5)				; dump map tile "w" and "o"
		move.l	#$00060003,(a5)				; dump map tile "r" and "l"
		move.w	#$0007,(a5)				; dump map tile "d"

		move.l	#$C0000000,(a6)				; set VDP address to C-Ram
		move.l	#$00000EEE,(a5)				; dump colours "black" and "white"

; ===========================================================================
; ---------------------------------------------------------------------------
; Program Loop (does nothing but loop)
; ---------------------------------------------------------------------------

		move	#$2300,sr				; enable interrupts V and H
		clr.b	($FFFFF000).w				; clear frame flag

WaitFrame:
		tst.b	($FFFFF000).w				; has V-blank ran yet?
		bra	WaitFrame				; if not, recheck


; ===========================================================================
; ---------------------------------------------------------------------------
; V-Blank routine
; ---------------------------------------------------------------------------

VBlankInt:
		move.b	#1,($FFFFF000).w			; set frame flag (Set V-Blank as ran)
		rte						; return to main program

; ===========================================================================
; ---------------------------------------------------------------------------
; H-Blank routine
; ---------------------------------------------------------------------------

HBlankInt:
		rte						; return to main program

; ===========================================================================
; ---------------------------------------------------------------------------
; Uncompressed art letters H, E, L, O, W, R and D
; ---------------------------------------------------------------------------

Art:		incbin	"Art.bin"
		even

; ===========================================================================








