; ===========================================================================
; ---------------------------------------------------------------------------
; Snake MD - By Selbi
; ---------------------------------------------------------------------------

; Named variables and constants:
Snake_Data	= $FFFFF000	; Playfield RAM (array; $400)
Snake_BodyData	= $FFFFF400	; Alternate playfield RAM, used for writing the Snake to VDP (array; $400)
Snake_Length	= $FFFFF900	; Length of the Snake, increases by eating food (byte)
Snake_Direction	= $FFFFF902	; Direction of the Snake (byte; 0=up, 1=right, 2=down, 3=left)
Snake_HeadLoc	= $FFFFF906	; Location of Snake's head in coordinates (word; XXYY)

VInt_Flag	= $FFFFF800	; Used to slow down the system based on V-Blank (byte)
DelayTimer	= $FFFFF802	; Timer to slow down the system (byte)
Control1	= $FFFFF804	; Contains the controls of controller 1 (byte/bits; SABCUDLR)
RandomNumber	= $FFFFF806	; Random number for the food positioning (longword)
LastDirection	= $FFFFF80A	; Last direction per body segment, used for the body data building (byte)
LastBody	= $FFFFF80C	; Last body position in RAM, used for body data building (word)
CollectedFood	= $FFFFF80E	; Tells if current frame if food has been collected (byte; flag)
FoodPosition	= $FFFFF810	; Current RAM position of the food (word)
NewDir		= $FFFFF812	; Will be used for the new direction, if there is a new one (byte)
ScoreCounter	= $FFFFF814	; Score counter in decimal (word)

TimeDelay_Fast	= 6		; Time to delay in frames
TimeDelay_Slow	= 30		; Time to delay in frames (while holding C)

Size_X		= 38		; Horizontal playfield size
Size_Y		= 24		; Vertical playfield size

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
		move	#$2700,sr			; disable interrupts V and H

		move.b	($A10001).l,d0			; load hardware I/O data
		andi.b	#$0F,d0				; get only the hardware version number
		beq	@SetupGame			; if it's null, then the machine is not official
		move.l	#'SEGA',($A14000).l		; set the official security code (required for hardware)

	@SetupGame:
		move.w	#$8014,($C00004).l		;[H-Interrupt On];[H,V Counter On];
		move.w	#$8174,($C00004).l		;[Display On];[V-Interrupt On];[DMA On];[V 28 Cell PAL/NTSC Mode];
		move.w	#$8230,($C00004).l		;[Scroll Plane A Map Table VRam address];  (V-Ram C000)
		move.w	#$833C,($C00004).l		;[Window Plane A Map Table VRam address];  (V-Ram F000)
		move.w	#$8407,($C00004).l		;[Scroll Plane B Map Table VRam address];  (V-Ram E000)
		move.w	#$8568,($C00004).l		;[Sprite Plane Map Table VRam address];  (V-Ram D000)
		move.w	#$8600,($C00004).l		;[Unknown/Unused Register];
		move.w	#$8700,($C00004).l		;[Backdrop color: Palette Line 0/color ID 0];
		move.w	#$8800,($C00004).l		;[Unknown/Unused Register];
		move.w	#$8900,($C00004).l		;[Unknown/Unused Register];
		move.w	#$8ADF,($C00004).l		;[H-Interrupt Register];
		move.w	#$8B00,($C00004).l		;[External Interrupt Off];[V-Scroll: Full];[H-Scroll: Full];[Line: By Cell];
		move.w	#$8C81,($C00004).l		;[H-Mode: 32 Cell];[Shadow/Hi-Lighting Off];[Interlace Off];
		move.w	#$8D36,($C00004).l		;[Horizontal Scroll Table VRam address];  (V-Ram D800)
		move.w	#$8E00,($C00004).l		;[Unknown/Unused Register];
		move.w	#$8F02,($C00004).l		;[Auto Increament: By 2];
		move.w	#$9001,($C00004).l		;[VDP Screen Map Size: Vertical Size 32 (20) Cell/Horizontal Size 64 (40) Cell];
		move.w	#$9100,($C00004).l		;[Window Horizontal Position: 00];
		move.w	#$9200,($C00004).l		;[Window Vertical Position: 00];
		move.w	#$93FF,($C00004).l		;[DMA Transfer Size (Lower Byte XX00)];
		move.w	#$94FF,($C00004).l		;[DMA Transfer Size (Upper Byte 00XX)];
		move.w	#$9500,($C00004).l		;[DMA Transfer Source (Low Byte XXXX00)];
		move.w	#$9600,($C00004).l		;[DMA Transfer Source (Mid Byte XX00XX)];
		move.w	#$9780,($C00004).l		;[DMA Transfer Source (Hi- Byte 00XXXX)];

		move.w	#$0100,($A11100).l		; request Z80 stop (ON)
		move.w	#$0000,($A11200).l		; request Z80 reset (ON)
		moveq	#$40,d1				; prepare initiation flag
		move.b	d1,($A10009).l			; initiate port 1
		move.b	d1,($A1000B).l			; initiate port 2
		move.b	d1,($A1000D).l			; initiate port 3
		move.w	#$0100,($A11200).l		; request Z80 reset (OFF)

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
	; Snake graphics:
		lea	($C00000).l,a5			; load VDP data port address to a5
		lea	($C00004).l,a6			; load VDP address port address to a6
		move.l	#$40200000,(a6)			; set VDP address to write to
		lea	(Art_Snake).l,a0		; load uncompressed art to dump
		moveq	#(512/(4*8))-1,d7		; set repeat times (filesize / (bytes per tile row * total rows per tile)) - 1
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
		lea	($C00004).l,a6			; load VDP address port address to a6
		move.l	#$42200000,(a6)			; set VDP address to write to
		lea	(Art_Food).l,a0			; load uncompressed art to dump
		move.l	(a0)+,(a5)			; dump art to V-Ram
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''

	; Numbers graphics:
		lea	($C00000).l,a5			; load VDP data port address to a5
		lea	($C00004).l,a6			; load VDP address port address to a6
		move.l	#$42400000,(a6)			; set VDP address to write to
		lea	(Art_Numbers).l,a0		; load uncompressed art to dump
		moveq	#(512/(4*8))-1,d7		; set repeat times (filesize / (bytes per tile row * total rows per tile)) - 1
	@SWA_Numbers_Loop:
		move.l	(a0)+,(a5)			; dump art to V-Ram
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		dbf	d7,@SWA_Numbers_Loop		; repeat til art is written

	; Screen border:
		lea	($C00000).l,a5			; load VDP data port address to a5
		lea	($C00004).l,a6			; load VDP address port address to a6
		move.l	#$44400000,(a6)			; set VDP address to write to
		lea	(Art_Border).l,a0		; load uncompressed art to dump
		moveq	#(320/(4*8))-1,d7		; set repeat times (filesize / (bytes per tile row * total rows per tile)) - 1
	@SWA_Border_Loop:
		move.l	(a0)+,(a5)			; dump art to V-Ram
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		move.l	(a0)+,(a5)			; ''
		dbf	d7,@SWA_Border_Loop		; repeat til art is written

	; Palette:
		move.l	#$C0000000,(a6)			; set VDP address to C-Ram
		lea	(Palette_Snake).w,a1		; load palette data into a1
	@SWA_Palette1_Loop:
		move.w	(a1)+,d0			; get current color into d0
		bmi.s	@SWA_Palette2			; if it's negative, the end of the list has been reached, so quit
		move.w	d0,(a5)				; dump colors
		bra.s	@SWA_Palette1_Loop		; loop

	@SWA_Palette2:
		move.l	#$C0200000,(a6)			; set VDP address to C-Ram
		lea	(Palette_Main).w,a1		; load palette data into a1
	@SWA_Palette2_Loop:
		move.w	(a1)+,d0			; get current color into d0
		bmi.s	SG_WritePlayfield		; if it's negative, the end of the list has been reached, so quit
		move.w	d0,(a5)				; dump colors
		bra.s	@SWA_Palette2_Loop		; loop

; ---------------------------------------------------------------------------
; Write the playfield on start-up. The point of this is to instantly show
; something, instead of having a single blank frame.
; ---------------------------------------------------------------------------

SG_WritePlayfield:
	; Head:
		move.b	#Snake_DefLen,(Snake_Length).w	; set base Snake length to 8 units
		move.b	#1,(Snake_Direction).w		; set base Snake direction to 'right'
		move.b	#1,(NewDir).w			; set default control direction to 'right'

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
		move.w	#$270,(FoodPosition).w		; also put that value into FoodPosition

	; Screen border:
		; Top Row:
		move.l	#$60020003,(a6)			; set VDP position (top left + 1)
		move.w	#(Size_X/2)-1,d1		; set loops ((horizontal playfield size / 2) - 1)
	@SWSB_Top_Loop:
		move.l	#$20242024,(a5)			; write two tiles (top)
		dbf	d1,@SWSB_Top_Loop		; loop

		; BottomRow 1:
		move.l	#$6C820003,(a6)			; set VDP position (upper bottom left + 1)
		move.w	#(Size_X/2)-1,d1		; set loops ((horizontal playfield size / 2) - 1)
	@SWSB_Bottom1_Loop:
		move.l	#$20222022,(a5)			; write two tiles (bottom)
		dbf	d1,@SWSB_Bottom1_Loop		; loop

		; Bottom Row 2:
		move.l	#$6D820003,(a6)			; set VDP position (lower bottom left + 1)
		move.w	#(Size_X/2)-1,d1		; set loops ((horizontal playfield size / 2) - 1)
	@SWSB_Bottom2_Loop:
		move.l	#$20222022,(a5)			; write two tiles (bottom)
		dbf	d1,@SWSB_Bottom2_Loop		; loop

		; Left Line:
		move.l	#$60800003,d0			; set VDP position (second row, very left)
		move.l	d0,(a6)				; write it to VDP
		move.w	#Size_Y+1,d1			; set loops (vertical playfield size + 1)
	@SWSB_Left_Loop:
		move.w	#$2025,(a5)			; write tile (left line)
		addi.l	#$00800000,d0			; use the next row
		move.l	d0,(a6)				; load it into the VDP
		dbf	d1,@SWSB_Left_Loop		; loop

		; Right Line:
		move.l	#$60CE0003,d0			; set VDP position (second row, very right)
		move.l	d0,(a6)				; write it to VDP
		move.w	#Size_Y+1,d1			; set loops (vertical playfield size + 1)
	@SWSB_Right_Loop:
		move.w	#$2023,(a5)			; write tile (right line)
		addi.l	#$00800000,d0			; use the next row
		move.l	d0,(a6)				; load it into the VDP
		dbf	d1,@SWSB_Right_Loop		; loop

		; Corners and T-Pieces:
		move.l	#$60000003,(a6)			; write 'top left corner' tile
		move.w	#$2026,(a5)			; ''
		move.l	#$604E0003,(a6)			; write 'top right corner' tile
		move.w	#$2027,(a5)			; ''
		move.l	#$6D800003,(a6)			; write 'bottom left corner' tile
		move.w	#$2028,(a5)			; ''
		move.l	#$6DCE0003,(a6)			; write 'bottom right corner' tile
		move.w	#$2029,(a5)			; ''
		move.l	#$6C800003,(a6)			; write 'left T-piece' tile
		move.w	#$202A,(a5)			; ''
		move.l	#$6CCE0003,(a6)			; write 'right T-piece' tile
		move.w	#$202B,(a5)			; ''

	; And finally, write everyting into the VDP:
		bsr	Sub_UpdateScore			; initiate score counter
		bsr	Sub_WriteArt			; write data to VDP
		move	#$2300,sr			; enable interrupts V and H

; ===========================================================================
; ---------------------------------------------------------------------------
; Main Program Loop
; ---------------------------------------------------------------------------

MainLoop:
		clr.b	(VInt_Flag).w			; clear frame flag

		bsr	Sub_CheckForFood		; check if any new food needs to be created

; ---------------------------------------------------------------------------
; This routine checks for presses on the D-Pad and sets the corresponding
; direction for the Snake.
; ---------------------------------------------------------------------------

ControlHandel:
		bsr	Sub_GetControls			; load controls (SABCUDLR)

		btst	#0,(Control1).w			; is 'up' being held?
		bne.s	@CH_ChkDown			; if not, check for down
		cmpi.b	#2,(Snake_Direction).w		; is current direction 'downwards'?
		beq.s	WaitFrame			; if yes, don't change direction
		move.b	#0,(NewDir).w			; move upwards
		bra.s	WaitFrame			; skip
	@CH_ChkDown:
		btst	#1,(Control1).w			; is 'down' being held?
		bne.s	@CH_ChkLeft			; if not, check for left
		cmpi.b	#0,(Snake_Direction).w		; is current direction 'upwards'?
		beq.s	WaitFrame			; if yes, don't change direction
		move.b	#2,(NewDir).w			; move downwards
		bra.s	WaitFrame			; skip
	@CH_ChkLeft:
		btst	#2,(Control1).w			; is 'left' being held?
		bne.s	@CH_ChkRight			; if not, check for right
		cmpi.b	#1,(Snake_Direction).w		; is current direction 'to the right'?
		beq.s	WaitFrame			; if yes, don't change direction
		move.b	#3,(NewDir).w			; move to the left
		bra.s	WaitFrame			; skip
	@CH_ChkRight:
		btst	#3,(Control1).w			; is 'right' being held?
		bne.s	WaitFrame			; if not, don't change direction in any way
		cmpi.b	#3,(Snake_Direction).w		; is current direction 'to the left'?
		beq.s	WaitFrame			; if yes, don't change direction
		move.b	#1,(NewDir).w			; move to the right

; ---------------------------------------------------------------------------
; This routine handles system delay, in order to make the game playable.
; ---------------------------------------------------------------------------

WaitFrame:
		tst.b	(VInt_Flag).w			; has V-blank ran yet?
		beq.s	WaitFrame			; if not, recheck

		addq.b	#1,(DelayTimer).w		; add 1 to delay timer
		btst	#5,(Control1).w			; is C button pressed?
		bne.s	@WF_MoveFast			; if yes, branch
		cmpi.b	#TimeDelay_Slow,(DelayTimer).w	; has delay time in value been reached?
		blt.w	MainLoop			; if not, loop the game until it is
		clr.b	(DelayTimer).w			; otherwise, reset the delay counter
		bra.s	PlayfieldModify			; skip

@WF_MoveFast:
		cmpi.b	#TimeDelay_Fast,(DelayTimer).w	; has delay time in value been reached?
		blt.w	MainLoop			; if not, loop the game until it is
		clr.b	(DelayTimer).w			; otherwise, reset the delay counter

; ===========================================================================
; ---------------------------------------------------------------------------
; Main Snake/playfield organizing routine.
; ---------------------------------------------------------------------------

PlayfieldModify:
		move.b	(NewDir).w,(Snake_Direction).w	; move to the right

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
		bcs.s	@PM_B_WriteSnake		; if not, branch
		beq.s	@PM_B_WriteSnake		; if not, branch
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
		add.w	#Size_X<<8,d0			; otherwise make Snake re-appear on the right
	@PM_H_Done:
		move.w	d0,(Snake_HeadLoc).w		; put entire result back into the head location's RAM address

	; Write head to playfield & food handling:
		move.w	d0,d1				; copy head result from last code block to d1
		lsr.w	#8,d0				; get only the X position in d0
		andi.w	#$00FF,d1			; get only the Y position in d1
		mulu.w	#Size_X,d1			; multiply default X size with the row, the head is in
		add.w	d0,d1				; add actual X position to it

		clr.b	(CollectedFood).w		; set "CollectedFood" flag to false
		lea	(Snake_Data).w,a1		; load playfield data into a1
		cmp.w	(FoodPosition).w,d1		; is head currently eating food?
		bne.s	@PM_WF_ChkWrite			; if not, branch (no food has been collected in this frame)
		addq.b	#1,(Snake_Length).w		; otherwise, increase Snake length by 1 unit
		move.w	(ScoreCounter).w,d2		; load score into d2
		addq.b	#01,d2				; increase it by 1
		cmpi.b	#10,d2				; did we reach 10?
		bne.s	@PM_WF_No10			; if not, branch
		move.b	#00,d2				; otherwise clear second digit
		addi.w	#$0100,d2			; increase first digit by 1
	@PM_WF_No10:
		move.w	d2,(ScoreCounter).w		; write into score counter
		move.b	#1,(CollectedFood).w		; set "CollectedFood" flag to true
		cmpi.w	#$0909,(ScoreCounter).w		; has maximum score counter number (99) been reached?
		beq.w	GameOver			; if yes, game over, branch (temporary solution for noow)
	@PM_WF_ChkWrite:
		tst.b	(a1,d1.w)			; check if the position, the Snake is about to move to, is empty
		beq.s	@PM_WF_WriteHead		; if it is, branch and write head
		cmpi.b	#Food_ID,(a1,d1.w)		; check if it is food
		bne.w	GameOver			; if it isn't, you bit yourself, game over
	@PM_WF_WriteHead:
		move.b	#$01,(a1,d1.w)			; write the freaking head already!

		bsr	Sub_CheckForFood		; check if any new food needs to be created

; ---------------------------------------------------------------------------

	; Final code, writes everything to VDP and loops the game:
		bsr	Sub_WriteArt			; write playfield data into VDP
		jmp	MainLoop			; loop the game
; ---------------------------------------------------------------------------
; ===========================================================================



; ===========================================================================
; ---------------------------------------------------------------------------
; This subroutine checks if a piece of food exists, and if not, creates a new one.
; ---------------------------------------------------------------------------

Sub_CheckForFood:
		bsr	Sub_RandomNumber		; create a new random number for the food (this happens even if it is not required)
		
	; Check if any food exists already:
		moveq	#0,d0				; clear d0
		lea	(Snake_Data).w,a1		; load playfield data into a1
		move.w	#(Size_X*Size_Y)-1,d1		; set number of loops
	@SCFF_Chk_Loop:
		cmpi.b	#Food_ID,(a1)+			; is this food?
		bne.s	@SCFF_NoFood			; if not, branchh
		moveq	#1,d0				; otherwise, set d0 to 1 (food has been found)
	@SCFF_NoFood:
		dbf	d1,@SCFF_Chk_Loop		; loop

		tst.b	d0				; has food been found?
		bne.s	SCFF_Return			; if yes, skip all this

	; Write new piece of food:
	@SCFF_WriteFood:
		lea	(Snake_Data).w,a2		; load playfield data into a2
		bsr	Sub_RandomNumber		; create a new random number for the food
		move.l	(RandomNumber).w,d0		; get the random generated number
		bclr    #0,d0				; make sure it's even
		move.b	d0,d1				; copy the first byte of it into d1
		andi.w	#$000E,d1			; only get the first nybble of the copy (and make sure it REALLY is even)
		lsr.b	#1,d1				; divide it by 2 (result will be 7 or less)
		moveq	#0,d2				; clear d2
		bra.s	@SCFF_ToSize_Loop		; start the loop

	@SCFF_Div_Loop:
		lsr.w	d1,d0				; divide by the random generated value (made for double randomness (lol))

	@SCFF_ToSize_Loop:
		cmpi.w	#(Size_X*Size_Y)-1,d0		; is the food in the playfield area?
		bge.s	@SCFF_Div_Loop			; if not, branch
		addq.b	#1,d2				; increase d2 by 1
		beq.s	@SCFF_WriteFood			; did we reach 0 again? if yes, we got stuck, so emergency espace this crap and try again
		tst.b	(a2,d0.w)			; is current position empty?
		bne.s	@SCFF_Div_Loop			; if not, repeat until you found a free position

		move.b	#Food_ID,(a2,d0.w)		; write food
		move.w	d0,(FoodPosition).w		; remember food position

SCFF_Return:
		rts					; return

; ---------------------------------------------------------------------------

Sub_RandomNumber:	; stolen from Sonic 1 (lolz)
		move.l	(RandomNumber).w,d1		; get current random number
		bne.s	@SRN_NoDefault			; if it's not zero, branch
		move.l	#$2A6D365A,d1			; otherwise set a random value to start with

	@SRN_NoDefault:
		move.l	d1,d0				; do some random stuff to make it random
		asl.l	#2,d1				; ''
		add.l	d0,d1				; ''
		asl.l	#3,d1				; ''
		add.l	d0,d1				; ''
		move.w	d1,d0				; ''
		swap	d1				; ''
		add.w	d1,d0				; ''
		move.w	d0,d1				; ''
		swap	d1				; ''
		move.l	d1,(RandomNumber).w		; write result into RAM
		rts					; return
; ---------------------------------------------------------------------------
; ===========================================================================



; ===========================================================================
; ---------------------------------------------------------------------------
; Routine to handel game overs (currently simply restarts the game).
; ---------------------------------------------------------------------------

GameOver:
		lea	($C00000).l,a5			; load VDP data port address to a5
		lea	($C00004).l,a6			; load VDP address port address to a6
		move.l	#$C0000000,(a6)			; set VDP address to C-Ram
		move.w	#$0000,(a5)			; BG color (black)
		move.l	#$C0280000,(a6)			; set VDP address to C-Ram
		move.w	#$0EEE,(a5)			; score counter (white)

GO_Freeze:
		bra.s	GO_Freeze			; loop

		jmp	StartGame			; restart the game (will be replaced with something smarter one day)

; ---------------------------------------------------------------------------
; ===========================================================================

; ===========================================================================
; ---------------------------------------------------------------------------
; Blank routines
; ---------------------------------------------------------------------------

VBlankInt:
		move.b	#1,(VInt_Flag).w		; set frame flag (Set V-Blank as ran)
		rte					; return to main program

; ---------------------------------------------------------------------------

HBlankInt:
		rte					; return to main program
; ---------------------------------------------------------------------------
; ===========================================================================



; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to update the score counter.
; ---------------------------------------------------------------------------

Sub_UpdateScore:
		lea	($C00000).l,a5			; load VDP data port address to a5
		lea	($C00004).l,a6			; load VDP address port address to a6

		move.l	#$40240003+($800000*(Size_Y+2)),(a6) ; set VDP position (Default Position + Y Playfield Size + 2)
		move.w	(ScoreCounter).w,d0		; load Snake's length into d0
		move.w	d0,d1				; copy it to d1

		lsr.w	#8,d0				; get first digit
		addi.w	#$2012,d0			; add $12 to the index (VRAM position of numbers starts there) and use second palette row
		andi.w	#$000F,d1			; get second digit
		lsl.w	#8,d1				; move it one byte to the left
		ext.l	d1				; extend to long
		lsl.l	#8,d1				; move it another byte to the left
		addi.l	#$20120000,d1			; add $12 to the index (VRAM position of numbers starts there) and use second palette row

		move.l	d0,(a5)				; write first digit to VDP
		move.l	d1,(a5)				; write second digit to VDP

		rts					; return
; ---------------------------------------------------------------------------
; ===========================================================================



; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to write everything into the VDP, thus showing you the actual game.
; ---------------------------------------------------------------------------

Sub_WriteArt:
		bsr	SWA_CreateBodyData		; create the array with the screen content
		lea	(Snake_BodyData).l,a1		; get fresh body data into a1

		moveq	#0,d0				; clear d0
		move.l	#$40820003,d2			; load VDP stuff (map plane) into d2
		move.l	d2,(a6)				; load it into the VDP

		move.w	#(Size_Y)-1,d1			; set number of loops (for Rows)
	@MapLoop_Rows:
		move.w	#(Size_X/2)-1,d3		; set number of loops (for Lines)
	@MapLoop_Line:
		move.b	(a1)+,d0			; load next body data entry into d0
		swap	d0				; swap words
		move.b	(a1)+,d0			; load next body data entry into d0
		move.l	d0,(a5)				; write to VDP (two at a time)
		dbf	d3,@MapLoop_Line		; loop

		addi.l	#$00800000,d2			; use the next row
		move.l	d2,(a6)				; load it into the VDP
		dbf	d1,@MapLoop_Rows		; loop

		bsr	Sub_UpdateScore			; update the score counter

		rts					; return

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------

SWA_CreateBodyData:
	; Clear Body Data:
		lea	(Snake_BodyData).w,a0		; load body data into a0
		moveq	#0,d0				; set d0 to 0
		move.w	#((Size_X*Size_Y)/4)-1,d1	; set number of loops
	@SCBD_Loop:
		move.l	d0,(a0)+			; clear 4 bytes
		dbf	d1,@SCBD_Loop			; loop

	; Find and write the food:
		lea	(Snake_BodyData).w,a0		; load body data into a0
		adda.w	(FoodPosition).w,a0		; add food position to it
		move.b	#$11,(a0)			; write food to body data

	; Find and write Snake's head:
		lea	(Snake_Data).w,a0		; load playfield data into a0
		moveq	#-1,d0				; set d0 to -1
	@SFH_Loop:
		addq.w	#1,d0				; increase d0 by 1
		cmpi.b	#$01,(a0)+			; is this the head?
		bne.s	@SFH_Loop			; if not, loop until it has been found
		lea	(Snake_BodyData).l,a1		; load body data into a1
		adda.w	d0,a1				; add head location to it
		move.b	(Snake_Direction).w,(a1)	; write head (which happens to have the same values as the direction RAM ...
		addq.b	#1,(a1)				; ... well almost, still needs to have a 1 added)

	; Find and write next body pieces:
		move.b	(Snake_Direction).w,(LastDirection).w ; set LastDirection to the one of the head
		moveq	#0,d4				; clear d4
		move.b	(Snake_Length).w,d4		; load current length of the Snake into d4
		subq.b	#3,d4				; substract 3 from it
		tst.b	(CollectedFood).w		; have you collected any food in this round?
		beq.s	@SWT_Skip			; if not, branch
		subq.b	#1,d4				; otherwise, substract 1 from it once more
	@SWT_Skip:
		move.b	#$02,d2				; start with body segment 2 (1 is the head)
	@SWB_Loop:
		bsr	SWA_FindNextBody		; find the body piece (also, if it one, make prior body piece an edge piece)
		move.b	d3,(a1)				; write result into body data
		move.w	a1,(LastBody).w			; remember the position of the current body piece
		addq.b	#1,d2				; set to next body piece
		dbf	d4,@SWB_Loop			; loop
	
	; Find and write the tail:
		bsr	SWA_FindNextBody		; find the tail of the Snake
		addq.b	#8,d3				; make sure it uses the correct tiles
		move.b	d3,(a1)				; write result into body data

@SCBD_Return:
		rts					; return

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
ID_Up		= 5
ID_Right	= 6
ID_Down		= 7
ID_Left		= 8
ID_TopRight	= 9
ID_DownRight	= 10
ID_TopLeft	= 11
ID_DownLeft	= 12
; ---------------------------------------------------------------------------

SWA_FindNextBody:
		lea	(Snake_BodyData).l,a1		; load body data into a1
		lea	(Snake_Data).l,a2		; load playfield data into a2

	; Above, moving downwards:
		move.w	d0,d1				; load last body location (or head) into d1
		subi.w	#Size_X,d1			; go one line upwards
		cmp.b	(a2,d1.w),d2			; check if given body number is equal to Snake_Data's one
		bne.s	@SFNB_ChkDownOf			; if not, branch
		move.b	#ID_Up,d3			; use "upwards moving" tile

		moveq	#0,d5				; use array row #1
		bra	SFNB_ChkCornerBody		; check if prior body piece an edge piece (and make it one if yes)
		
	; Below, moving upwards:
	@SFNB_ChkDownOf:
		move.w	d0,d1				; load last body location (or head) into d1
		addi.w	#Size_X,d1			; go one line downwards
		cmp.b	(a2,d1.w),d2			; check if given body number is equal to Snake_Data's one
		bne.s	@SFNB_ChkRightOf		; if not, branch
		move.b	#ID_Down,d3			; use "downwards moving" tile

		moveq	#1,d5				; use array row #2
		bra	SFNB_ChkCornerBody		; check if prior body piece an edge piece (and make it one if yes)

	; Right, moving leftwards:
	@SFNB_ChkRightOf:
		move.w	d0,d1				; load last body location (or head) into d1
		addi.w	#1,d1				; go to the right by one
		cmp.b	(a2,d1.w),d2			; check if given body number is equal to Snake_Data's one
		bne.s	@SFNB_ChkLeftOf			; if not, branch
		move.b	#ID_Right,d3			; use "rightwards moving" tile

		moveq	#2,d5				; use array row #3
		bra	SFNB_ChkCornerBody		; check if prior body piece an edge piece (and make it one if yes)

	; Left, moving rightwards:
	@SFNB_ChkLeftOf:
		move.w	d0,d1				; load last body location (or head) into d1
		subi.w	#1,d1				; go to the left by one
		cmp.b	(a2,d1.w),d2			; check if given body number is equal to Snake_Data's one
		bne.s	@SFNB_ChkOverScreen		; if not, branch
		move.b	#ID_Left,d3			; use "leftwards moving" tile

		moveq	#3,d5				; use array row #4
		bra	SFNB_ChkCornerBody		; check if prior body piece an edge piece (and make it one if yes)

; ---------------------------------------------------------------------------

@SFNB_ChkOverScreen:
	; Bottom, coming out of the top:
		move.w	d0,d1				; load last body location (or head) into d1
		addi.w	#Size_X*(Size_Y-1),d1		; go to the top of the screen
		cmp.b	(a2,d1.w),d2			; check if given body number is equal to Snake_Data's one
		bne.s	@SCOS_Top			; if not, branch
		move.b	#ID_Down,d3			; use "downwards moving" tile

		moveq	#4,d5				; use array row #5
		bra	SFNB_ChkCornerBody		; check if prior body piece an edge piece (and make it one if yes)

	; Top, coming out of the bottom:
	@SCOS_Top:
		move.w	d0,d1				; load last body location (or head) into d1
		subi.w	#Size_X*(Size_Y-1),d1		; go to the bottom of the screen
		cmp.b	(a2,d1.w),d2			; check if given body number is equal to Snake_Data's one
		bne.s	@SCOS_Left			; if not, branch
		move.b	#ID_Up,d3			; use "upwards moving" tile

		moveq	#5,d5				; use array row #6
		bra	SFNB_ChkCornerBody		; check if prior body piece an edge piece (and make it one if yes)

	; Left, coming out of the right:
	@SCOS_Left:
		move.w	d0,d1				; load last body location (or head) into d1
		addi.w	#Size_X-1,d1			; go to the right of the screen
		cmp.b	(a2,d1.w),d2			; check if given body number is equal to Snake_Data's one
		bne.s	@SCOS_Right			; if not, branch
		move.b	#ID_Left,d3			; use "leftwards moving" tile

		moveq	#6,d5				; use array row #7
		bra	SFNB_ChkCornerBody		; check if prior body piece an edge piece (and make it one if yes)

	; Right, coming out of the left:
	@SCOS_Right:
		move.w	d0,d1				; load last body location (or head) into d1
		subi.w	#Size_X-1,d1			; go to the left of the screen
		cmp.b	(a2,d1.w),d2			; check if given body number is equal to Snake_Data's one
		bne.s	@SFNB_Return			; if not, branch (technically, this branch should never happen)
		move.b	#ID_Right,d3			; use "rightwards moving" tile

		moveq	#7,d5				; use array row #8
		bra	SFNB_ChkCornerBody		; check if prior body piece an edge piece (and make it one if yes)

@SFNB_Return:
		rts					; return
; End of subroutine Sub_WriteArt

; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------

SFNB_ChkCornerBody:
		move.w	d1,d0				; backup last body location to d0
		adda.w	d1,a1				; add current body location to a1 (necessary for the next body segment)

		lea	(SCCB_Array).l,a3		; load the below array into a3
		mulu.w	#4,d5				; multiply input by d5
		adda.w	d5,a3				; add result to a3
		moveq	#0,d5				; clear d5

		move.b	0(a3),d5			; load first entry into d5
		cmp.b	(LastDirection).w,d5		; does it match with the last direction?
		beq.s	@SCCB_Cont2			; if not, branch
		movea.w	(LastBody).w,a2			; load last body segment into a2
		move.b	1(a3),d5			; load second entry into d5
		cmp.b	(LastDirection).w,d5		; does it match with the last direction=
		bne.s	@SCCB_Cont1			; if not, branch
		move.b	2(a3),(a2)			; use first tile
		bra.s	@SCCB_Cont2			; skip
	@SCCB_Cont1:
		move.b	3(a3),(a2)			; use second tile
	@SCCB_Cont2:
		move.b	0(a3),(LastDirection).w		; set the new "LastDirection"
		rts					; return

; ---------------------------------------------------------------------------
SCCB_Array:	;	Check 1, Check 2, Graphic 1, Graphic 2
		dc.b	2, 1, ID_TopRight, ID_DownLeft	; Above
		dc.b	0, 1, ID_DownRight, ID_TopLeft	; Below
		dc.b	3, 2, ID_DownRight, ID_TopRight	; Rightwards
		dc.b	1, 2, ID_TopLeft, ID_DownLeft	; Leftwards

		dc.b	2, 1, ID_TopRight, ID_DownLeft	; Top (Screen)
		dc.b	0, 1, ID_DownRight, ID_TopLeft	; Bottom (Screen)
		dc.b	1, 2, ID_TopLeft, ID_DownLeft	; Right (Screen)
		dc.b	3, 2, ID_DownRight, ID_TopRight	; Left (Screen)
		even
; ---------------------------------------------------------------------------
; ===========================================================================



; ===========================================================================
; ---------------------------------------------------------------------------
; Subroutine to load the control data and write a copy into the RAM.
; ---------------------------------------------------------------------------

Sub_GetControls:
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
; ---------------------------------------------------------------------------
; ===========================================================================



; ===========================================================================
; ---------------------------------------------------------------------------
; Artistic stuff
; ---------------------------------------------------------------------------

Art_Snake:	incbin	"Content/Art_Snake.bin"
Art_Food:	incbin	"Content/Art_Food.bin"
Art_Numbers:	incbin	"Content/Art_Numbers.bin"
Art_Border:	incbin	"Content/Art_Border.bin"
		even

; ---------------------------------------------------------------------------

Palette_Snake:
		dc.w	$0CEA	; 0 (BG color)
		dc.w	$000E	; 1
		dc.w	$0008	; 2
		dc.w	$004A	; 3
		dc.w	$0048	; 4
		dc.w	$0280	; 5
		dc.w	$02C0	; 6
		dc.w	$08E8	; 7
		dc.w	$0060	; 8
		dc.w	$0024	; 9
		dc.w	$0EEE	; A
		dc.w	$0248	; B (Food color)
		dc.w	$FFFF	; >>> End of list <<<

Palette_Main:
		dc.w	$0000	; <null>
		dc.w	$0000	; <null>
		dc.w	$0000	; <null>
		dc.w	$0000	; <null>
		dc.w	$0000	; Numbers color
		dc.w	$0EEE	; Border colour 1
		dc.w	$0CCC	; Border colour 2
		dc.w	$0888	; Border colour 3
		dc.w	$0444	; Border colour 4
		dc.w	$0000	; Border colour 5
		dc.w	$FFFF	; >>> End of list <<<
		even

; ---------------------------------------------------------------------------
; ===========================================================================