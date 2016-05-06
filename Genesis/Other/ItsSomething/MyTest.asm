; ---------------------------------------------------------------------------
; ===========================================================================
; "It's Something..." -- By Selbi
;   A Test ROM for personal educational purposes for the Sega Mega Drive.
; ===========================================================================
; ---------------------------------------------------------------------------

StartOfRom:
Vectors:	dc.l	$00FFFE00,     EntryPoint,  BusError,    AddressError
		dc.l	IllegalInstr,  ZeroDivide,  ChkInstr,    TrapvInstr
		dc.l	PrivilegeViol, Trace,       Line1010Emu, Line1111Emu
		dc.l	ErrorExcept,   ErrorExcept, ErrorExcept, ErrorExcept
		dc.l	ErrorExcept,   ErrorExcept, ErrorExcept, ErrorExcept
		dc.l	ErrorExcept,   ErrorExcept, ErrorExcept, ErrorExcept
		dc.l	ErrorExcept,   ErrorTrap,   ErrorTrap,   ErrorTrap
		dc.l	HBlank,        ErrorTrap,   VBlank,      ErrorTrap
		dc.l	ErrorTrap,     ErrorTrap,   ErrorTrap,   ErrorTrap
		dc.l	ErrorTrap,     ErrorTrap,   ErrorTrap,   ErrorTrap
		dc.l	ErrorTrap,     ErrorTrap,   ErrorTrap,   ErrorTrap
		dc.l	ErrorTrap,     ErrorTrap,   ErrorTrap,   ErrorTrap
		dc.l	ErrorTrap,     ErrorTrap,   ErrorTrap,   ErrorTrap
		dc.l	ErrorTrap,     ErrorTrap,   ErrorTrap,   ErrorTrap
		dc.l	ErrorTrap,     ErrorTrap,   ErrorTrap,   ErrorTrap
		dc.l	ErrorTrap,     ErrorTrap,   ErrorTrap,   ErrorTrap
Console:	dc.b	'SEGA MEGA DRIVE '						; Hardware system ID
Date:		dc.b	'(C)Selb 2015.Nov'						; Release date
Title_Local:	dc.b	"It's Something...                               "		; Domestic name
Title_Int:	dc.b	"It's Something...                               "		; International name
Serial:		dc.b	'GM 10101010-00'						; Serial/version number
Checksum:	dc.w	0								; Checksum
		dc.b	'J               '						; I/O support
RomStartLoc:	dc.l	StartOfRom							; ROM start
RomEndLoc:	dc.l	EndOfRom-1							; ROM end
RamStartLoc:	dc.l	$FF0000								; RAM start
RamEndLoc:	dc.l	$FFFFFF								; RAM end
SRAMSupport:	dc.l	$5241F820							; change to $5241F820 (NOT $5241E020) to create SRAM. 'RA' and $F8 also work.
		dc.l	$200000								; SRAM start
		dc.l	$200200								; SRAM end (Gives us $200  ($100 useable) bytes of SRAM)
Notes:		dc.b	'                                                    '		; Anything can be put in this space, but it has to be 52 bytes.
Region:		dc.b	'JUE             '						; Region (J=Japan, U=USA, E=Europe)

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; Entry Point
;  Start of the system, excecuted on start up and soft reset
; ---------------------------------------------------------------------------

EntryPoint:
	move    #$2700,sr			; disable interrupts
	tst.l   ($A10008).l			; test port A control
	bne.s   PortA_Ok			; if so, magically branch
	tst.w   ($A1000C).l			; test port C control

PortA_Ok:
	bne.w   PortC_Ok			; if port C is okay, skip all the setup stuff
	move.b  ($A10001).l,d0			; get hardware version
	andi.b  #$F,d0				; compare
	beq.s   SkipSecurity			; if the console has no TMSS, skip the security stuff
	move.l  #'SEGA',($A14000).l		; make the TMSS happy

SkipSecurity:

; ---------------------------------------------------------------------------

; SET UP VDP REGISTERS
;   Mostly taken from MarkeyJester because I wanted to start with something.
;   Not everything is actually needed, but kept in here for further learning processes.
	lea	($C00004).l,a0			; set VDP control port to a0 and do lots of fancy things below

	move.w	#$8014,(a0)			;[H-Interrupt On];[H,V Counter On];
	move.w	#$8174,(a0)			;[Display On];[V-Interrupt On];[DMA On];[V 28 Cell PAL/NTSC Mode];
	move.w	#$8230,(a0)			;[Scroll Plane A Map Table VRam address];  (V-Ram C000)
	move.w	#$833C,(a0)			;[Window Plane A Map Table VRam address];  (V-Ram F000)
	move.w	#$8407,(a0)			;[Scroll Plane B Map Table VRam address];  (V-Ram E000)
	move.w	#$8568,(a0)			;[Sprite Plane Map Table VRam address];  (V-Ram D000)
	move.w	#$8600,(a0)			;[Unknown/Unused Register];
	move.w	#$8700,(a0)			;[Backdrop color: Palette Line 0/color ID 0];
	move.w	#$8800,(a0)			;[Unknown/Unused Register];
	move.w	#$8900,(a0)			;[Unknown/Unused Register];
	move.w	#$8ADF,(a0)			;[H-Interrupt Register];
	move.w	#$8B07,(a0)			;[External Interrupt Off];[V-Scroll: Dual];[H-Scroll: Per-Line];
	move.w	#$8C81,(a0)			;[H-Mode: 32 Cell];[Shadow/Hi-Lighting Off];[Interlace Off];
	move.w	#$8D36,(a0)			;[Horizontal Scroll Table VRam address];  (V-Ram D800)
	move.w	#$8E00,(a0)			;[Unknown/Unused Register];
	move.w	#$8F02,(a0)			;[Auto Increament: By 2];
	move.w	#$9001,(a0)			;[VDP Screen Map Size: Vertical Size 32 (20) Cell/Horizontal Size 64 (40) Cell];
	move.w	#$9100,(a0)			;[Window Horizontal Position: 00];
	move.w	#$9200,(a0)			;[Window Vertical Position: 00];
	move.w	#$93FF,(a0)			;[DMA Transfer Size (Lower Byte XX00)];
	move.w	#$94FF,(a0)			;[DMA Transfer Size (Upper Byte 00XX)];
	move.w	#$9500,(a0)			;[DMA Transfer Source (Low Byte XXXX00)];
	move.w	#$9600,(a0)			;[DMA Transfer Source (Mid Byte XX00XX)];
	move.w	#$9780,(a0)			;[DMA Transfer Source (Hi- Byte 00XXXX)];

	; some stuff with Z80 that I'll need to learn later
	move.w	#$0100,($A11100).l		; request Z80 stop (ON)
	move.w	#$0000,($A11200).l		; request Z80 reset (ON)
	moveq	#$40,d1				; prepare initiation flag
	move.b	d1,($A10009).l			; initiate port 1
	move.b	d1,($A1000B).l			; initiate port 2
	move.b	d1,($A1000D).l			; initiate port 3
	move.w	#$0100,($A11200).l		; request Z80 reset (OFF)
; End of SET UP VDP REGISTERS

; ---------------------------------------------------------------------------

; CLEAR RAM
	lea     ($FF0000).l,a0			; load start of RAM into a0
	move.w  #$3FFF,d0			; clear $3FFF longwords
	moveq   #0,d1				; clear d1
@clr_ram_Loop:
	move.l  d1,(a0)+			; clear a long of RAM
	dbf     d0,@clr_ram_Loop		; continue clearing RAM if there's anything left
; End of CLEAR RAM

; ---------------------------------------------------------------------------

; LOAD PALETTE
	move.l  #$C0000000,($C00004).l		; set VDP to CRAM write
	lea	(Selbi_Palette).l,a0		; set address of the palette data to a0
@pal_loop:
	move.w	(a0)+,d0			; get next 0BGR
	bmi.s	@exit_pal			; is it the end of the list ($FFFF)? If yes, leave loop
	move.w  d0,($C00000).l			; write color to data port
	bra.s	@pal_loop

@exit_pal:
; End of LOAD PALETTE

; ---------------------------------------------------------------------------

; LOAD TILES (or 'patterns', apparently. Tristan, god dammit.)
	lea	(Selbi_Tiles).l,a0		; set address of uncompressed tile data to a0
	move.w	#626-1,d0			; load 626 tiles (this is my old splash screen and really horribly optimized)
	move.l	#$40000000,d1			; set VDP to VRAM write and start right at 0000
	bsr.w	LoadArt				; branch to help subroutine for this stuff
; End of LOAD TILES

; ---------------------------------------------------------------------------

; LOAD PLANE MAPPINGS
; plane A:
	lea	(Selbi_Maps).l,a0		; set address of uncompressed plane maps to a0
	move.l	#$40000003,d0			; set VDP to VRAM and start at C000 (location of Plane A nametable)
	moveq	#40-1,d1			; write 40 columns
	moveq	#28-1+4,d2			; write 28 lines (plus 4, because these old mappings are worse than Hitler)
	moveq	#0,d3				; set additional stuff to 0
	bsr.w	ShowVDPGraphics			; write stuff

; plane B:
	lea	(Selbi_Maps).l,a0		; set address of uncompressed plane maps to a0
	move.l	#$60000003,d0			; set VDP to VRAM and start at E000 (location of Plane B nametable)
	moveq	#40-1,d1			; write 40 columns
	moveq	#14-1,d2			; write 14 lines (the "SELBI" stuff, basically)
	move.w	#%0010000000000000,d3		; set additional stuff to "use second palette row"
	bsr.w	ShowVDPGraphics			; write stuff

	lea	(Selbi_Maps).l,a0		; set address of uncompressed plane maps to a0
	moveq	#40-1,d1			; write 40 columns
	moveq	#14-1,d2			; write 14 lines (the "SELBI" stuff, basically)
	bsr.w	ShowVDPGraphics			; write stuff (again, to show a second SELBI in plane B)


; window plane:
	moveq	#103,d2			; write 10 lines
	moveq	#0,d3				; set additional stuff to 0
	move.l	#$70000003,d0			; set VDP to VRAM and start at f000 (location of Window Plane nametable)
	lea	($C00000).l,a6			; load VDP data port address to a6
	lea	($C00004).l,a4			; load VDP address port address to a4

	move.l	d0,(a4)				; set VDP to VRam write mode

;	lea	(Selbi_Maps).l,a0		; set address of uncompressed plane maps to a0
;	move.l	#$70000003,d0			; set VDP to VRAM and start at f000 (location of Window Plane nametable)
;	moveq	#40-1,d1			; write 40 columns
;	moveq	#28-1,d2			; write 28 lines (plus 4, because these old mappings are worse than Hitler)
;	moveq	#0,d3				; set additional stuff to 0
;	bsr.w	ShowVDPGraphics			; write stuff


@windowloop:
	move.w	#$8000+($3C80/$20),d6		; set tile index plus priority bit to draw to window plane
	move.w	d6,(a6)				; dump map to VDP map slot
	dbf	d2,@windowloop		; repeat til all rows have dumped

; End of LOAD PLANE MAPPINGS

PortC_Ok:
	bsr.w   Init_Z80			; initialize the Z80
	move    #$2300, sr			; enable interrupts.
	
	bra.w	MainProgram			; branch to main program

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; Vertical Blanking
;  Right now all it does is to set the flag for system resume
; ---------------------------------------------------------------------------

VBlank:
	move.b	#1,($FFFFFF00).w		; set V-Int flag
	rte					; return from exception

; ---------------------------------------------------------------------------
; Horizontal Blanking
;  Not used at all until I figure out a creative way to learn this shit.
; ---------------------------------------------------------------------------

HBlank:
	rte					; return from exception

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; All Error Handlers
;  For now, dead ends, because fuck you.
; ---------------------------------------------------------------------------

BusError:
AddressError:
IllegalInstr:
ZeroDivide:
ChkInstr:
TrapVInstr:
PrivilegeViol:
Trace:
Line1010Emu:
Line1111Emu:
ErrorExcept:
ErrorTrap:
	stop 	#$2700				; disable any interrupts and freeze here

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to initialise the Z80
;  Totally not stolen from Tristan's page or anything.
; ---------------------------------------------------------------------------

Init_Z80:
	move.w	#$100,($A11100).l  				; Send the Z80 a bus request
	move.w	#$100,($A11200).l 				; Reset the Z80

Init_Z80_WaitZ80Loop:
	btst	#0,($A11100)					; Has the Z80 reset?
	bne.s	Init_Z80_WaitZ80Loop				; If not, keep checking.

	lea	(Init_Z80_InitCode).l, a0			; Load the start address of the code to a0.
	lea	($A00000).l,a1					; Load the address of start of Z80 RAM to a1
	move.w	#Init_Z80_InitCode_End-Init_Z80_InitCode,d1	; Load the length of the Z80 code to d1

Init_Z80_LoadProgramLoop:
	move.b	(a0)+, (a1)+					; Write a byte of Z80 data.
	dbf	d1, Init_Z80_LoadProgramLoop		 	; If we have bytes left to write, write them.
	move.w	#0,($A11200).l					; Disable the Z80 reset.
	move.w	#0,($A11100).l					; Give the Z80 the bus back.
	move.w	#$100,($A11200).l				; Reset the Z80 again.
	rts							; Return to sub.

	; Below is the code that the Z80 will execute.
Init_Z80_InitCode:
	dc.w	$AF01, $D91F, $1127, $0021, $2600, $F977 
	dc.w	$EDB0, $DDE1, $FDE1, $ED47, $ED4F, $D1E1
	dc.w	$F108, $D9C1, $D1E1, $F1F9, $F3ED, $5636
	dc.w	$E9E9
Init_Z80_InitCode_End:
	even

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to load the control data and write a copy into the RAM
;  Format: $FFFFF804 -> SACBRLDU
; ---------------------------------------------------------------------------

GetControls:
	lea	($A10003).l,a1			; load controller 1 into a1

	move.b	#0,(a1)				; request controller part 1
	nop					; wait
	nop					; wait
	move.b	(a1),d0				; get controller information 1 into d0
	lsl.b	#2,d0				; shift Start and A to the very left
	andi.b	#$C0,d0				; clear everything else (SA000000)

	move.b	#$40,(a1)			; request controller part 2
	nop					; wait
	nop					; wait
	move.b	(a1),d1				; get controller information 2 into d1
	andi.b	#$3F,d1				; clear everything else (00CBRLDU)

	or.b	d1,d0				; combine controller part 1 and 2
	not.b	d0				; reverse
	move.b	d0,($FFFFF804).w		; write everything to RAM
	rts					; return

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to load and show plane maps with a predefined width
;  Stolen from Sonic 1, but really self-explanatory
; ---------------------------------------------------------------------------

ShowVDPGraphics:
	lea	($C00000).l,a6			; load VDP data port address to a6
	lea	($C00004).l,a4			; load VDP address port address to a4
	move.l	#$00800000,d4			; prepare line add value

MapScreen_Row:
	move.l	d0,(a4)				; set VDP to VRam write mode
	move.w	d1,d5				; reload number of columns

MapScreen_Column:
	move.w	(a0)+,d6			; get new stuff
	add.w	d3,d6				; add any other stuff
	move.w	d6,(a6)				; dump map to VDP map slot
	dbf	d5,MapScreen_Column		; repeat til columns have dumped
	add.l	d4,d0				; increae to next row on VRam
	dbf	d2,MapScreen_Row		; repeat til all rows have dumped
	rts					; return

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to dump art into VRAM
; Input: a0 = art address
;        d0 = tile count - 1
;        d1 = VRAM Location
; ---------------------------------------------------------------------------

LoadArt:
	lea	($C00000).l,a5			; load VDP data port address to a5
	lea	($C00004).l,a6			; load VDP address port address to a6
	move.l	d1,(a6)				; set VDP address to write to
@LoadArt_Loop:
	move.l	(a0)+,(a5)			; dump art to V-Ram
	move.l	(a0)+,(a5)			; ''
	move.l	(a0)+,(a5)			; ''
	move.l	(a0)+,(a5)			; ''
	move.l	(a0)+,(a5)			; ''
	move.l	(a0)+,(a5)			; ''
	move.l	(a0)+,(a5)			; ''
	move.l	(a0)+,(a5)			; ''
	dbf	d0,@LoadArt_Loop		; repeat til art is written
	rts					; return

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
; Main Program Loop
;  Apart from Vertical Blanking, everything mandatory from now on only
;  happens in here.
; ---------------------------------------------------------------------------

MainProgram:
	bsr.w	GetControls			; get controller inputs

; H-Scroll
;  This part shifts around the two layers at to-the-bottom-increasing speeds.
;  Plane A is faster than Plane B | Plane A mirror-splits at the lower half 
	move.l	#$00000400,d3			; set increase speed to 400 on the
	move.l	($FFFFFF50).w,d2		; get old value
	btst.b	#2,($FFFFF804).w		; check if left is pressed
	bne.s	@lr_pressed			; branch if so
	btst.b	#3,($FFFFF804).w		; check if right is pressed
	beq.s	@end_hScroll			; branch if not (and do nothing)
	neg.l	d3				; otherwise, negate increase speed to -400

@lr_pressed:
	add.l	d3,d2				; add increase to old value
	move.l	d2,d4				; copy that value to d4
	move.l	d2,($FFFFFF50).w		; put everything back to RAM

	lea	($C00000).l,a0			; init VDP data port in a0
	move.l	#$58000003,($C00004).l		; set VDP control port to VRAM write at D800 (Horizontal Scroll Table)
	move.w	#223,d7				; do it for all 224 lines)

@hScroll_loop:
	move.l	d2,d0				; get previous line's scroll factor
	add.l	d4,d2				; add increase speed to old speed

	; these three lines slightly increase the speed every line
	; otherwise it'd be a triangle
	move.l	d4,d5				; copy increase speed
	asr.l	#6,d5				; dramatically reduce the copy
	add.l	d5,d4				; add result back to increase speed

	move.w	d7,d1				; get current number of iteration (starting from 223)
	cmpi.b	#107,d7				; are we in the "PRESENTS" area?
	bhi.s	@apply_hScroll			; if not, branch
	andi.w	#1,d1				; only perform on every other line
	bne.s	@apply_hScroll			; branch on odd line count
	not.l	d0				; reverse the scroll factor for this line

@apply_hScroll:
	move.l	d2,d6				; copy previous line's scroll factor
	andi.l	#$FFFF0000,d6			; make sure there's nothing in the bottom word
	asr.l	#2,d6				; divide it by 4
	swap	d6				; swap words
	andi.l	#$FFFF0000,d0			; make sure there's nothing in the bottom word of the new scroll factor
	or.l	d6,d0				; combine the two words (first word is plane A | second word is plane B)

	move.l	d0,(a0)				; dump art to VRAM in the H-Scroll nametable
	dbf	d7,@hScroll_loop		; repeat until all lines are done

@end_hScroll:

; ---------------------------------------------------------------------------

; V-Scroll
;  This part moves plane B up and down on controller input.
;  Moves like whole-plane mode, but set up as two-tile mode, for future references.
	move.l	#$00000001,d3			; set vertical scroll speed to one pixel per frame down
	btst.b	#0,($FFFFF804).w		; check if up is pressed
	bne.s	@ud_pressed			; branch if so
	btst.b	#1,($FFFFF804).w		; check if down is pressed
	beq.w	@end_vScroll			; if not, don't do anything
	neg.w	d3				; reverse scroll speed (scroll up)

@ud_pressed:
	move.w	($FFFFFF54).w,d2		; get stored scroll position
	add.w	d3,d2				; add new scroll speed
	move.w	d2,($FFFFFF54).w		; already store that new value back to RAM

	lea	($C00000).l,a0			; init VDP data port in a0
	move.l	#$40000010,($C00004).l		; set VDP control port to VSRAM mode and start at 00
	move.w	#39,d7				; do it for all 40 double-tiles (320 width = 80 tiles at 8 pixels)

@vScroll_loop:
	move.w	d2,d0				; copy new scroll position
	
	move.w	d7,d1				; copy iteration
	andi.w	#1,d1				; check if this is an odd iteration
	beq.s	@apply_vScroll			; if not, branch
	clr.w	d0				; otherwise, clear scroll factor for this block

@apply_vScroll:
	move.w	d0,(a0)				; dump art to VSRAM
	dbf	d7,@vScroll_loop		; repeat until all lines are done

@end_vScroll:

; ---------------------------------------------------------------------------

; Window Plane
;  Move entire screen in a slow, circular motion

	move.w	#$9100|%0<<7|%00<<5|$0,d0	; VDP register set ($11, horizontal window plane) | RGHT | xx | WHP5-WHP1
	move.w	d0,($C00004).l
	
	move.w	#$9200|%0<<7|%00<<5|$2,d0	; VDP register set ($12, vertical window plane) | DOWN | xx | WHP5-WHP1
	move.w	d0,($C00004).l
; ---------------------------------------------------------------------------

; Sprites
;  Move a white 1x1 sprite accross the screen and let it bounce off the boundaries.
;  All data for this is predefined at the bottom (except for the position).
X_MOVE EQU 2
Y_MOVE EQU 1
	
; left/right movement
	btst	#0,($FFFFFF5A).w		; is sprite moving to the left?
	bne.s	@sprite_moveleft		; if yes, branch
	cmpi.w	#$138,($FFFFFF56).w		; check if the right boundary has been reached
	bhs.s	@sprite_moveleft		; if yes, branch
	addq.w	#X_MOVE,($FFFFFF56).w		; move sprite to the right
	bclr	#0,($FFFFFF5A).w		; set move mode to right
	bra.s	@sprite_endleftright		; skip to end

@sprite_moveleft:
	subq.w	#X_MOVE,($FFFFFF56).w		; move sprite to the left
	bset	#0,($FFFFFF5A).w		; set move mode to left
	cmpi.w	#$00,($FFFFFF56).w		; has left boundary been reached?
	bhi.s	@sprite_endleftright		; if not, continue moving left next frame
	bclr	#0,($FFFFFF5A).w		; otherwise, move back to the right in the next frame

@sprite_endleftright:


; up/down movement
	btst	#1,($FFFFFF5A).w		; is sprite moving up?
	bne.s	@sprite_moveup			; if yes, branch
	cmpi.w	#$D8,($FFFFFF58).w		; check if the lower boundary has been reached
	bhs.s	@sprite_moveup			; if yes, branch
	addq.w	#Y_MOVE,($FFFFFF58).w		; move sprite downwards
	bclr	#1,($FFFFFF5A).w		; set move mode to downwards
	bra.s	@sprite_endupdown		; skip to end

@sprite_moveup:
	subq.w	#Y_MOVE,($FFFFFF58).w		; move sprite upwards
	bset	#1,($FFFFFF5A).w		; set move mode to upwards
	cmpi.w	#$00,($FFFFFF58).w		; has upper boundary been reached?
	bhi.s	@sprite_endupdown		; if not, continue moving up next frame
	bclr	#1,($FFFFFF5A).w		; otherwise, move back downwards in the next frame

@sprite_endupdown:


; write sprite to sprite table in VRAM
	move.l	#$50000003,($C00004).l		; set VDP control port to write to VRAM at D000 (sprite table)
	lea	($C00000).l,a0			; set up VDP data port at a0
	lea	(Sprite_Sample).l,a1		; load address of the sample sprite data to a1

	move.l	(a1)+,d0			; get the first two words of the sprite data
	moveq	#0,d1				; clear d1
	move.w	($FFFFFF58).w,d1		; get current vertical scroll position
	swap	d1				; put it into the upper word (where the vertical scroll is located for sprites)
	add.l	d1,d0				; add the vertical position to the other sprite data
	move.l	d0,(a0)				; write first two entries with modified vertical position to VRAM

	move.l	(a1)+,d0			; get next two words of the sprite data
	moveq	#0,d1				; clear d1
	move.w	($FFFFFF56).w,d1		; get current horizontal scroll position
	add.l	d1,d0				; directly add it to the sprite data (no need to shift here, because it's already in the lower word)
	move.l	d0,(a0)				; write second two entries with modified to VRAM

Wait_For_VBlank:
	tst.b	($FFFFFF00).w			; is V-Int flag set?
	beq.s	Wait_For_VBlank			; if not, wait here until it's set
	clr.b	($FFFFFF00).w			; when the PC gets here, clear the flag again

	bra.w	MainProgram			; loop main program

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------

Sprite_Sample:
	dc.w	(%000000<<10)|($080)					; 000000vvvvvvvvvv (15-10 unused | 09-00 Vertical Pos (max 3FF))
	dc.w	(%0000<<12)|(%00<<10)|(%00<<08)|(%0<<07)|($00)		; 0000hhvv0lllllll (15-12 unused | 11+10 Horizontal Size | 09+08 Vertical Size | 07 unused | 06-00 Link Data (max 7F))
	dc.w	(%1<<15)|(%10<<13)|(%0<<12)|(%0<<11)|($3C80/$20)	; pPPvhttttttttttt (15 Priority | 14+13 Palette | 12 Vertical Flip | 11 Horizontal Flip | 10-00 Tile Offset (max 7FF))
	dc.w	(%0000000<<09)|($080)					; 0000000hhhhhhhhh (15-09 unused | 08-00 Horizontal Position (max 1FF))
	even

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------

Selbi_Palette:
	dc.w	$0222,$0000,$0004,$002C,$0CEE,$04AE,$0246,$0486,$0444,$0042,$0AA6,$0846,$0A4E,$0422,$0424,$0000	; row 1
	dc.w	$0000,$0000,$0000,$0006,$0688,$0048,$0000,$0020,$0000,$0000,$0440,$0200,$0408,$0000,$0000,$0000	; row 2
	dc.w	$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE	; row 3
	dc.w	$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE,$0EEE	; row 4
	dc.w	$FFFF
	even

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------

Selbi_Tiles:
	incbin	Files/Tiles_dec.bin
	dc.l	$FFFFFFFF
	even

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------

Selbi_Maps:
	incbin	Files/Maps_dec.bin
	dc.l	$FFFFFFFF
	even

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------

EndOfRom:
; Linkin Park.