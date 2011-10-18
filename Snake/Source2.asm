; ===========================================================================
; ---------------------------------------------------------------------------
; Snake MD - By Selbi
; ---------------------------------------------------------------------------

; Named variables and constants:
Snake_Data	= $FFFFFA00	; Playfield RAM (open array)
Snake_Length	= $FFFFF900	; Length of the Snake, increases with eating food (byte)
Snake_Direction	= $FFFFF902	; Direction of the Snake (byte; 0=up, 1=right, 2=down, 3=left)
Snake_HeadLoc	= $FFFFF906	; Location of Snake's head in coordinates (word; XXYY)
Snake_FoodFlag	= $FFFFF90A

Control1	= $FFFFF600	; Contains the controls of controller 1 (byte/bits; SABCUDLR)
RandomNumber	= $FFFFF636	; Random number for the food positioning (longword)
DelayTimer	= $FFFFF800	; Timer to slow down the system (byte)
Time_Delay	= 5		; Time to delay in frames

Size_X		= $26		; Horizontal playfield size
Size_Y		= $18		; Vertical playfield size

Food_ID		= $FF		; ID of the food
Snake_DefLen	= $08		; default Snake length when starting the game up

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------

StartOfROM:
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
ProductData:	dc.b	'(C)SELBI 2011.10'
LocalTitle:	dc.b	'Snake MD ~by Selbi                              '
InterTitle:	dc.b	'Snake MD ~by Selbi                              '
SerialNumber:	dc.b	'SP 18201337-00'
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
		beq	@SetupGame				; if it's null, then the machine is not official
		move.l	#'SEGA',($A14000).l			; set the official security code (required for hardware)

	@SetupGame:
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

	; Clear RAM:
		lea	($FFFFF000).w,a0		; set base of RAM to a0
		moveq	#0,d0				; set replace number to 0 in d0
		move.w	#$FF,d1				; set loops to $FF
	@SCR_Loop:
		move.l	d0,(a0)+			; clear
		move.l	d0,(a0)+			; clear
		move.l	d0,(a0)+			; clear
		move.l	d0,(a0)+			; clear
		dbf	d1,@SCR_Loop			; loop

; ---------------------------------------------------------------------------
; This part writes graphics and palettes into the VDP on start-up.
; ---------------------------------------------------------------------------

SG_WriteArt:
	; Snake graphics
		lea	($C00000).l,a5			; load VDP data port address to a5
		lea	$04(a5),a6			; load VDP address port address to a6
		move.l	#$40200000,(a6)			; set VDP address to write to
		lea	(Art_Snake).l,a0		; load uncompressed art to dump
		adda.w	#(8*4),a0
		moveq	#(1312/(4*8))-1,d7		; set repeat times (filesize / (bytes per tile row * total rows per tile)) - 1
	@SWA_Snake_Loop:
		move.l	(a0)+,(a5)			; dump art to V-Ram
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		dbf	d7,@SWA_Snake_Loop		; repeat til art is written

	; Food graphics:
		lea	($C00000).l,a5			; load VDP data port address to a5
		lea	$04(a5),a6			; load VDP address port address to a6
		move.l	#$5FE00000,(a6)			; set VDP address to write to
		lea	(Art_Food).l,a0			; load uncompressed art to dump
		move.l	(a0)+,(a5)			; dump art to V-Ram
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''

	; Palette:
		move.l	#$C0000000,(a6)			; set VDP address to C-Ram
		lea	(Palette_Main).w,a1
	@SWA_Palette_Loop:
		move.w	(a1)+,d0
		bmi.s	SG_WritePlayfield
		move.w	d0,(a5)				; dump colour for food
		bra.s	@SWA_Palette_Loop

; ---------------------------------------------------------------------------
; Write the playfield on start-up. The point of this is to instantly show
; something, instead of having a single blank frame.
; ---------------------------------------------------------------------------

SG_WritePlayfield:
	; Head:
		move.b	#Snake_DefLen,(Snake_Length).w	; set base Snake length to 8 units
		move.b	#1,(Snake_Direction).w		; set base Snake direction to 'right'

		move.b	#Size_X,d0			; load horizontal playfield size into d0
		lsr.b	#1,d0				; half it
		move.b	(Snake_Length).w,d1		; load Snake length into d1
		lsr.b	#1,d1				; half it
		sub.b	(Snake_Length).w,d1		; substract original Snake length from it
		sub.b	d1,d0				; substract that result from the playfield result
		lsl.w	#8,d0				; move final result an entire byte to the left (00xx to xx00)
		move.b	#Size_Y,d1			; load vertical playfield size into d1
		subq.b	#1,d1				; subtract 1 from it
		lsr.b	#1,d1				; half it
		add.w	d1,d0				; add that result to old result (xx00 to xxyy)
		move.w	d0,(Snake_HeadLoc).w		; this result is the XY-coordinate of the Snake's head

	; Body:
		move.w	#Size_X,d0			; load horizontal playfield size into d0
		move.w	d0,d3				; copy it to d3
		lsr.w	#1,d3				; half it
		subq.w	#Snake_DefLen/2,d3		; substract the half default Snake length from it
		move.w	#Size_Y,d1			; load vertical playfield size into d1
		lsr.w	#1,d1				; half it
		subq.w	#1,d1				; substract 1 from it
		mulu.w	d1,d0				; multiply X and Y result
		add.w	d3,d0				; add halved X size to it
		lea	(Snake_Data).w,a1		; load playfield data into a1
		adda.w	d0,a1				; add final result to a1
		move.b	#Snake_DefLen,d2		; set loop length to default Snake length
	@SWFB_Loop:
		move.b	d2,(a1)+			; write next body segment to playfield
		subq.b	#1,d2				; decrease body segment number
		bne.s	@SWFB_Loop			; loop until full body has been written

	; Food:
		move.b	#Food_ID,(Snake_Data+$270).w	; set first food positon (the $270 is just a random value to set the first position)

	; And finally, write everyting into the VDP:
		bsr	Sub_WriteArt			; write data to VDP

		move	#$2300,sr			; enable interrupts V and H


; ===========================================================================
; ---------------------------------------------------------------------------
; Main Program Loop
; ---------------------------------------------------------------------------

MainLoop:
		clr.b	($FFFFF000).w			; clear frame flag
		
		bsr	Sub_RandomNumber		; create a new random number for the food

; ---------------------------------------------------------------------------
; This routine checks for presses on the D-Pad and sets the corresponding
; direction for the Snake.
; ---------------------------------------------------------------------------

ControlHandle:
		bsr	GetControls			; load controls

		btst	#0,(Control1).w			; is 'up' being held?
		bne.s	@CH_ChkDown			; if not, check for down
		cmpi.b	#2,(Snake_Direction).w		; is current direction 'downwards'?
		beq.s	WaitFrame			; if yes, don't change direction
		move.b	#0,(Snake_Direction).w		; move upwards
		bra.s	WaitFrame			; skip
	@CH_ChkDown:
		btst	#1,(Control1).w			; is 'down' being held?
		bne.s	@CH_ChkLeft			; if not, check for left
		cmpi.b	#0,(Snake_Direction).w		; is current direction 'upwards'?
		beq.s	WaitFrame			; if yes, don't change direction
		move.b	#2,(Snake_Direction).w		; move downwards
		bra.s	WaitFrame			; skip
	@CH_ChkLeft:
		btst	#2,(Control1).w			; is 'left' being held?
		bne.s	@CH_ChkRight			; if not, check for right
		cmpi.b	#1,(Snake_Direction).w		; is current direction 'to the right'?
		beq.s	WaitFrame			; if yes, don't change direction
		move.b	#3,(Snake_Direction).w		; move to the left
		bra.s	WaitFrame			; skip
	@CH_ChkRight:
		btst	#3,(Control1).w			; is 'right' being held?
		bne.s	WaitFrame			; if not, don't change direction in any way
		cmpi.b	#3,(Snake_Direction).w		; is current direction 'to the left'?
		beq.s	WaitFrame			; if yes, don't change direction
		move.b	#1,(Snake_Direction).w		; move to the right

; ---------------------------------------------------------------------------
; This routine handles system delay, in order to make the game playable.
; ---------------------------------------------------------------------------

WaitFrame:
		tst.b	($FFFFF000).w			; has V-blank ran yet?
		beq.s	WaitFrame			; if not, recheck

		addq.b	#1,(DelayTimer).w		; add 1 to delay timer
		cmpi.b	#Time_Delay,(DelayTimer).w	; has delay time in value been reached?
		bne.w	MainLoop			; if not, loop the game until it is
		clr.b	(DelayTimer).w			; otherwise, reset the delay counter

; ===========================================================================
; ---------------------------------------------------------------------------
; Main Snake/playfield organizing routine.
; ---------------------------------------------------------------------------

PlayfieldModify:
	; Body movement:
		lea	(Snake_Data).w,a1		; load playfield data into a1
		move.w	#(Size_X*Size_Y)-1,d1		; set loops to playfield size
	@PM_B_Loop:
		move.b	(a1),d0				; copy current byte to d0
		beq.s	@PM_B_SkipZero			; if it's zero, branch
		cmpi.b	#Food_ID,d0			; is this the food?
		beq.s	@PM_B_WriteSnake		; if yes, branch
		addq.b	#$01,d0				; otherwise, it's a body segment, and increase it
	@PM_B_SkipZero:
		cmp.b	(Snake_Length).w,d0		; is this the final part of the body?
		ble.s	@PM_B_WriteSnake		; if not, branch
		moveq	#$00,d0				; otherwise, clear that byte
	@PM_B_WriteSnake:
		move.b	d0,(a1)+			; write to playfield data
		dbf	d1,@PM_B_Loop			; loop
; ---------------------------------------------------------------------------

	; Head movement:
		move.w	(Snake_HeadLoc).w,d0		; load head coordinates into d0

		tst.b	(Snake_Direction).w		; check if direction is 'up'
		bne.s	@PM_H_ChkRight			; if it isn't, check for right
		subi.w	#$0001,d0			; move Snake upwards
		tst.b	d0				; did the Snake hit the top?
		bpl.s	@PM_H_Done			; if not, branch
		addq.w	#1,d0				; revert movement
		move.b	#Size_Y-1,d0			; otherwise, make the Snake appear on the bottom
		bra.s	@PM_H_Done			; skip the rest
	@PM_H_ChkRight:
		cmpi.b	#1,(Snake_Direction).w		; check if direction is 'right'
		bne.s	@PM_H_ChkDown			; if it isn't, check for down
		addi.w	#$0100,d0			; move Snake to the right
		move.w	d0,d1				; copy to d1
		lsr.w	#8,d1				; only get X position
		cmpi.b	#Size_X,d1			; did the Snake hit the right side boundary?
		blt.s	@PM_H_Done			; if not, branch
		andi.w	#$00FF,d0			; otherwise, make it appear on the left
		bra.s	@PM_H_Done			; skip the rest
	@PM_H_ChkDown:
		cmpi.b	#2,(Snake_Direction).w		; check if direction is 'down'
		bne.s	@PM_H_ChkLeft			; if it isn't, check for left
		addi.w	#$0001,d0			; move Snake downwards
		cmpi.b	#Size_Y,d0			; did the Snake hit the bottom?
		blt.s	@PM_H_Done			; if not, branch
		move.b	#0,d0				; otherwise, make it appear on the top
		bra.s	@PM_H_Done			; skip the rest
	@PM_H_ChkLeft:
		subi.w	#$0100,d0			; move Snake to the left
		move.w	d0,d1				; copy to d1
		andi.w	#$FF00,d1			; only get X position
		bpl.s	@PM_H_Done			; if the Snake didn't hit the left, branch
		add.w	#((Size_X-1)<<8)+$100,d0	; otherwise make Snake re-appear on the right
	@PM_H_Done:
		move.w	d0,(Snake_HeadLoc).w		; put entire result back into the head location's RAM address

	; Write head to playfield:
		move.w	d0,d1				; copy head result from last code block to d1
		lsr.w	#8,d0				; get only the X position in d0
		andi.w	#$00FF,d1			; get only the Y position in d1
		mulu.w	#Size_X,d1			; multiply default X size with the row, the head is in
		add.w	d0,d1				; add actual X position to it

		lea	(Snake_Data).w,a1		; load playfield data into a1
		cmpi.b	#Food_ID,(a1,d1.w)		; is head currently eating food?
		bne.s	@PM_WF_ChkWrite			; if not, branch
		addq.b	#1,(Snake_Length).w		; otherwise, increase Snake length by 1 unit
		cmpi.b	#Food_ID,(Snake_Length).w	; is current Snake length now equal to Food ID?
		beq.w	StartGame			; if yes, restart the game if (to prevent the Snake from laying shit and fucking everything up, will be replaced with something smarter one day)
	@PM_WF_ChkWrite:
		tst.b	(a1,d1.w)			; check if the position, the Snake is about to move to, is empty
		beq.s	@PM_WF_WriteHead		; if it is, branch and write head
		cmpi.b	#Food_ID,(a1,d1.w)		; check if it is food
		beq.s	@PM_WF_WriteHead		; if it is, branch
		jmp	StartGame			; otherwise, you bit yourself, and the game restarts (will be replaced with a real game over one day)
	@PM_WF_WriteHead:
		move.b	#$01,(a1,d1.w)			; write the freaking head already!

; ---------------------------------------------------------------------------

	; Write food to playfield:







		clr.b	(Snake_FoodFlag).w
		lea	(Snake_Data).w,a1
		move.w	#(Size_X*Size_Y)-1,d1
CheckFood_Loop:
		cmpi.b	#Food_ID,(a1)+
		bne.s	CFL_NoFood
		move.b	#1,(Snake_FoodFlag).w
CFL_NoFood:
		dbf	d1,CheckFood_Loop

		tst.b	(Snake_FoodFlag).w
		bne.s	PM_WriteToVDP
		lea	(Snake_Data).w,a1
		move.l	(RandomNumber).w,d1
		move.b	d1,d2
		andi.w	#$F,d2
		lsr.b	#1,d2
LoopToSize:
		cmpi.w	#(Size_X*Size_Y),d1
		blt.s	SetNewFood
DivBy16:
		lsr.w	d2,d1
		bra.s	LoopToSize
SetNewFood:
		tst.b	(a1,d1.w)
		bne.s	DivBy16
		move.b	#Food_ID,(a1,d1.w)

PM_WriteToVDP:
		bsr	Sub_WriteArt

; ---------------------------------------------------------------------------

		jmp	MainLoop			; loop the game
; ---------------------------------------------------------------------------
; ===========================================================================



; ===========================================================================
; ---------------------------------------------------------------------------
; V-Blank routine
; ---------------------------------------------------------------------------

VBlankInt:
		move.b	#1,($FFFFF000).w		; set frame flag (Set V-Blank as ran)
		rte					; return to main program

; ---------------------------------------------------------------------------
; H-Blank routine
; ---------------------------------------------------------------------------

HBlankInt:
		rte					; return to main program

; ===========================================================================

Sub_WriteArt:
		lea	(Snake_Data).l,a1		; get playfield data into a1
		moveq	#0,d0
		moveq	#0,d1
		moveq	#0,d2
		moveq	#0,d3
		move.l	#$40820003,d2
		move.l	d2,(a6)				; set VDP address to map plane (C000)

		move.w	#(Size_Y)-1,d1

MapLoop_Rows:
		move.w	#(Size_X/2)-1,d3

MapLoop_Line:
		move.b	(a1)+,d0
		cmpi.b	#$28,d0
		ble.s	@cont1
		subi.w	#$28,d0
@cont1:
		swap	d0
		move.b	(a1)+,d0
		cmpi.b	#$28,d0
		ble.s	@cont2
		subi.w	#$28,d0
@cont2:
		move.l	d0,(a5)
		dbf	d3,MapLoop_Line

		addi.l	#$00800000,d2
		move.l	d2,(a6)				; set VDP address to map plane (C000)

		dbf	d1,MapLoop_Rows
		rts

; ---------------------------------------------------------------------------

SWA_FindNumber:
		; d4 input
		lea	(Snake_Data).w,a0
		moveq	#0,d5

CheckFood_Loopx:
		cmpi.b	#Food_ID,(a1)+
		beq.s	CheckFood_Loopx
		move.b	#1,(Snake_FoodFlag).w
		
		rts

; ===========================================================================

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
		move.b	d0,(Control1).w			; write everything to RAM
		rts					; return

; ===========================================================================

Sub_RandomNumber:
		move.l	(RandomNumber).w,d1
		bne.s	loc_29C0
		move.l	#$2A6D365A,d1

loc_29C0:
		move.l	d1,d0
		asl.l	#2,d1
		add.l	d0,d1
		asl.l	#3,d1
		add.l	d0,d1
		move.w	d1,d0
		swap	d1
		add.w	d1,d0
		move.w	d0,d1
		swap	d1
		move.l	d1,(RandomNumber).w
		rts	

; ===========================================================================
; ---------------------------------------------------------------------------
; Uncompressed art
; ---------------------------------------------------------------------------

Art_Snake:	incbin	"Art_Snake.bin"
Art_Food:	incbin	"Art_Food.bin"
		even

; ---------------------------------------------------------------------------

Palette_Main:
		dc.w	$0CEA	; BG Colour
		dc.w	$00A2	; Snake Colour (Body)
		dc.w	$0222	; Snake Colour (Eyes)
		dc.w	$0248	; Food Colour
		dc.w	$FFFF
		even

; ===========================================================================