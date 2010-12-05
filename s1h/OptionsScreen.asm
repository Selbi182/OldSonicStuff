; ---------------------------------------------------------------------------
; Options screen
; ---------------------------------------------------------------------------

OptionsScreen:				; XREF: GameModeArray
		move.b	#$E4,d0
		jsr	PlaySound_Special ; stop music
		jsr	ClearPLC
		jsr	Pal_FadeFrom
		move	#$2700,sr
		jsr	SoundDriverLoad
		lea	($C00004).l,a6
		move.w	#$8004,(a6)
		move.w	#$8230,(a6)
		move.w	#$8407,(a6)
		move.w	#$9001,(a6)
		move.w	#$9200,(a6)
		move.w	#$8B03,(a6)
		move.w	#$8720,(a6)
		clr.b	($FFFFF64E).w
		jsr	ClearScreen
		lea	($FFFFD000).w,a1
		moveq	#0,d0
		move.w	#$7FF,d1

Options_ClrObjRam:
		move.l	d0,(a1)+
		dbf	d1,Options_ClrObjRam ; fill object RAM ($D000-$EFFF) with $0

	;	move	#$2700,sr
	;	move.l	#$40000001,($C00004).l
	;	lea	(Nem_TitleFg).l,a0 ; load Options	screen patterns
	;	jsr	NemDec

		lea	($C00000).l,a6
		move.l	#$6E000002,4(a6)
		lea	(Art_Text).l,a5
		move.w	#$59F,d1		; Original: $28F

Options_LoadText:
		move.w	(a5)+,(a6)
		dbf	d1,Options_LoadText ; load uncompressed text patterns

		move.l	#$64000002,($C00004).l
		lea	(Nem_ERaZor).l,a0
		jsr	NemDec

		jsr	Pal_FadeFrom

	;	move	#$2700,sr
	;	lea	($FF0000).l,a1
	;	lea	(Eni_Title).l,a0 ; load	Options screen mappings
	;	move.w	#0,d0
	;	jsr	EniDec
	;	lea	($FF0000).l,a1
	;	move.l	#$42080003,d0
	;	moveq	#$21,d1
	;	moveq	#$15,d2
	;	jsr	ShowVDPGraphics

; ---------------------------------------------------------------------------

		move.b	#$02,($FFFFD100).w	; load ERaZor banner object
		move.w	#$BD,($FFFFD108).w	; set X-position
		move.w	#$81,($FFFFD10A).w	; set Y-position

		move.b	#$02,($FFFFD140).w	; load ERaZor banner object
		move.w	#$182,($FFFFD148).w	; set X-position
		move.w	#$81,($FFFFD14A).w	; set Y-position

		move.b	#$02,($FFFFD180).w	; load ERaZor banner object
		move.w	#$BD,($FFFFD188).w	; set X-position
		move.w	#$142,($FFFFD18A).w	; set Y-position

		move.b	#$02,($FFFFD1C0).w	; load ERaZor banner object
		move.w	#$182,($FFFFD1C8).w	; set X-position
		move.w	#$142,($FFFFD1CA).w	; set Y-position

		jsr	ObjectsLoad
		jsr	BuildSprites
; ---------------------------------------------------------------------------

		moveq	#2,d0		; load Options screen pallet
		jsr	PalLoad1
		move.b	#$86,d0		; play Options screen music
		jsr	PlaySound_Special

LOADLS:
		moveq	#2,d0
		jsr	PalLoad2	; load level select pallet

		movem.l	d0-a2,-(sp)		; backup d0 to a2
		lea	(Pal_Sonic).l,a1	; set Sonic'S palette pointer
		lea	($FFFFFBA0).l,a2	; set palette location
		moveq	#7,d0			; set number of loops to 7

Options_SonPalLoop:
		move.l	(a1)+,(a2)+		; load 2 colours (4 bytes)
		dbf	d0,Options_SonPalLoop	; loop
		movem.l	(sp)+,d0-a2		; restore d0 to a2
		
		moveq	#0,d0
		lea	($FFFFCA00).w,a1	; set location for the text
		move.b	#$FF,d0			; put over $FFs
		move.w	#503,d1			; do it for all 504 chars

Options_MakeFF:
		move.b	d0,(a1)+		; put $FF into current spot
		dbf	d1,Options_MakeFF	; loop
		clr.b	($FFFFFF95).w
		clr.w	($FFFFFF96).w
		move.w	#23,($FFFFFF98).w
		clr.w	($FFFFFF9A).w
		clr.w	($FFFFFF9C).w
		
		lea	($FFFFCC00).w,a1
		moveq	#0,d0
		move.w	#$DF,d1

Options_ClrScroll:
		move.l	d0,(a1)+
		dbf	d1,Options_ClrScroll ; fill scroll data with 0

		move.l	d0,($FFFFF616).w
		move	#$2700,sr
		lea	($C00000).l,a6
		move.l	#$60000003,($C00004).l
		move.w	#$3FF,d1

Options_ClrVram:
		move.l	d0,(a6)
		dbf	d1,Options_ClrVram ; fill	VRAM with 0
		move.w	#19,($FFFFFF82).w	; set position to 4

		jsr	Pal_FadeTo
		bra.s	OptionsScreen_MainLoop

; ===========================================================================

Options_PalCycle:

PalLocationO = $FFFFFB20

		move.w	($FFFFF614).w,d0			; load remaining time into d0
		andi.w	#3,d0					; mask it against 3
		bne.s	O_PalSkip_1				; if result isn't 0, branch
		move.w	(PalLocationO+$04).w,d0			; load first blue colour of sonic's palette into d0
		moveq	#7,d1					; set loop counter to 7
		lea	(PalLocationO+$06).w,a1			; load second blue colour into a1

O_PalLoop:
		move.w	(a1),-2(a1)				; move colour to last spot
		adda.l	#2,a1					; increase location pointer
		dbf	d1,O_PalLoop				; loop
		move.w	d0,(PalLocationO+$12).w			; move first colour to last one

O_PalSkip_1:
		move.w	($FFFFF614).w,d0			; load remaining time into d0
		andi.w	#7,d0					; mask it against 7
		bne.s	O_PalSkip_2				; if result isn't 0, branch
		move.w	(PalLocationO+$18).w,d0			; backup first colour of the red
		move.w	(PalLocationO+$1A).w,(PalLocationO+$18).w	; move second colour to first one
		move.w	(PalLocationO+$1C).w,(PalLocationO+$1A).w	; move third colour to second one
		move.w	d0,(PalLocationO+$1C).w			; load first colour into third one

O_PalSkip_2:
		rts

; ===========================================================================
; ---------------------------------------------------------------------------
; Options Screen - Main Loop
; ---------------------------------------------------------------------------

; LevelSelect:
OptionsScreen_MainLoop:
		move.b	#4,($FFFFF62A).w
		jsr	DelayProgram
		jsr	OptionsControls
		jsr	RunPLC_RAM
		
		bsr.s	Options_PalCycle

		tst.l	($FFFFF680).w
		bne.s	OptionsScreen_MainLoop
		tst.b	($FFFFFF9B).w	; is routine counter at $12 (Options_NoMore)?
		bne.s	Options_NoTextChange	; if yes, branch
		move.b	($FFFFF605).w,d1
	;	andi.b	#$F0,d1
		beq.s	Options_NoStart
		move.b	#1,($FFFFFF9B).w
		jsr	OptionsTextLoad		; update text
		bra.s	OptionsScreen_MainLoop	; if not, branch

Options_NoStart:
	;	subq.b	#1,($FFFFFF95).w	; sub 1 from delay
	;	bpl.s	Options_NoTextChange	; if time remains, branch
		jsr	OptionsTextLoad		; update text
	;	move.b	#1,($FFFFFF95).w	; reset delay timer
	;	move.b	#1,($FFFFF7CC).w ; lock controls
		tst.b	($FFFFFF9B).w	; is routine counter at $12 (Options_NoMore)?
		bne.s	Options_NoTextChange	; if yes, branch
		bra.s	OptionsScreen_MainLoop

Options_NoTextChange:
		move.b	($FFFFF605).w,d1	; get button presses
		cmpi.w	#19,($FFFFFF82).w	; is selected line EXIT?
		beq.s	Options_NoLR		; if yes, don't check for Left/Right buttons
		andi.b	#$C,d1			; is left/right	pressed?
		bne.s	Options_OK		; if yes, branch

Options_NoLR:
		andi.b	#$F0,d1			; is A, B, C or Start pressed?
		beq.s	OptionsScreen_MainLoop	; if not, branch

Options_OK:
		clr.b	($FFFFFF95).w
		clr.w	($FFFFFF96).w
		clr.w	($FFFFFF98).w
		clr.b	($FFFFFF9A).w
	;	clr.b	($FFFFFF9B).w
		clr.w	($FFFFFF9C).w

		move.w	#$D9,d0
		jsr	PlaySound_Special
		moveq	#0,d0
		move.w	($FFFFFF82).w,d0
; ===========================================================================

Options_Check4:
		cmpi.w	#4,d0		; have you selected item 4 (AIR MOVE)?
		bne.s	Options_Not4	; if not, check for next numbers
		not.b	($FFFFFFBC).w	; enable/disable air move
		jsr	OptionsTextLoad
		bra.w	OptionsScreen_MainLoop
; ===========================================================================

Options_Not4:
		cmpi.w	#7,d0		; have you selected item 7 (INVIN TIME)?
		bne.s	Options_Not7	; if not, check for next numbers
		not.b	($FFFFFF92).w	; enable/disable invin time
		jsr	OptionsTextLoad
		bra.w	OptionsScreen_MainLoop
; ===========================================================================

Options_Not7:
		cmpi.w	#10,d0		; have you selected item 10 (DEBUG)?
		bne.s	Options_Not10	; if not, check for next numbers
		not.w	($FFFFFFFA).w	; enable/disable debug
		bchg	#2,($FFFFFF84).w
		jsr	OptionsTextLoad
		bra.w	OptionsScreen_MainLoop
; ===========================================================================

Options_Not10:
		cmpi.w	#13,d0		; have you selected item 13 (EXTENDED CAM)?
		bne.s	Options_Not13	; if not, check for next numbers
		not.b	($FFFFFF93).w	; enable/disable extended camera
		jsr	OptionsTextLoad
		bra.w	OptionsScreen_MainLoop
; ===========================================================================

Options_Not13:
		cmpi.w	#16,d0		; have you selected item 16 (SONIC ART)?
		bne.s	Options_Not16	; if not, check for next numbers
		not.b	($FFFFFF94).w	; change art style flag
		jsr	OptionsTextLoad
		bra.w	OptionsScreen_MainLoop
; ===========================================================================

Options_Not16:
		cmpi.w	#19,d0		; have you selected item 19 (EXIT)?
		bne.s	Options_Error	; if not, something went wrong
		tst.b	($FFFFFF9E).w
		beq.s	Options_NoSYZ1
		jsr	Pal_FadeOut		; fade out palette
		move.w	#$400,($FFFFFE10).w
		move.b	#$C,($FFFFF600).w	; set screen mode to level ($C)
		rts

Options_NoSYZ1:
	if Menu2=1
		jmp	Title_ChkLevSel_Rest	; go to Menu 2
	else
		jsr	Pal_FadeOut		; fade out palette
		move.b	#$C,($FFFFF600).w	; set screen mode to level ($C)
		jmp	ODIGHZSplash		; jump to One Day in Green Hill Zone screen
	endif
; ===========================================================================

Options_Error:
		rts			; return
; ===========================================================================

; ---------------------------------------------------------------------------
; Subroutine to	change what you're selecting in the level select
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


OptionsControls:				; XREF: OptionsScreen_MainLoop
		tst.b	($FFFFFF9B).w	; is routine counter at $12 (Options_NoMore)?
		bne.s	Options_AllowControl	; if yes, branch
		rts

Options_AllowControl:
		move.b	($FFFFF605).w,d1
		andi.b	#3,d1		; is up/down pressed and held?
		bne.s	Options_UpDown	; if yes, branch
		subq.w	#1,($FFFFFF80).w ; subtract 1 from time	to next	move
		bpl.s	Options_SndTest	; if time remains, branch

Options_UpDown:
		move.w	#9,($FFFFFF80).w ; reset time delay ($B)
		move.b	($FFFFF604).w,d1
		andi.b	#3,d1		; is up/down pressed?
		beq.s	Options_SndTest	; if not, branch
		move.b	#$D8,d0
		jsr	PlaySound_Special
		move.w	($FFFFFF82).w,d0
		btst	#0,d1		; is up	pressed?
		beq.s	Options_Down	; if not, branch
		subq.w	#3,d0		; move up 1 selection
		cmpi.w	#4,d0
		bcc.s	Options_Down
		moveq	#$13,d0		; if selection moves below 0, jump to selection	$14

Options_Down:
		btst	#1,d1		; is down pressed?
		beq.s	Options_Refresh	; if not, branch
		addq.w	#3,d0		; move down 1 selection
		cmpi.w	#$14,d0
		bcs.s	Options_Refresh
		moveq	#4,d0		; if selection moves above $14,	jump to	selection 0

Options_Refresh:
		move.w	d0,($FFFFFF82).w ; set new selection
		jsr	OptionsTextLoad	; refresh text
		rts
; ===========================================================================

Options_SndTest:				; XREF: OptionsControls
		move.b	($FFFFF605).w,d1
		andi.b	#$C,d1		; is left/right	pressed?
		beq.s	Options_NoMove	; if not, branch
		jsr	OptionsTextLoad	; refresh text

Options_NoMove:
		rts	
; End of function OptionsControls

; ---------------------------------------------------------------------------
; Subroutine to load level select text
; ---------------------------------------------------------------------------

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


OptionsTextLoad:				; XREF: TitleScreen
		jsr	GetOptionsText
		lea	($FFFFCA00).w,a1		
		lea	($C00000).l,a6
		move.l	#$62100003,d4	; screen position (text)
		move.w	#$E570,d3	; VRAM setting
		moveq	#$14,d1		; number of lines of text


loc2_34FE:				; XREF: OptionsTextLoad+26j
		move.l	d4,4(a6)
		jsr	Options_ChgLine
		addi.l	#$800000,d4
		dbf	d1,loc2_34FE
		moveq	#0,d0
		move.w	($FFFFFF82).w,d0
		move.w	d0,d1
		move.l	#$62100003,d4
		lsl.w	#7,d0
		swap	d0
		add.l	d0,d4
		lea	($FFFFCA00).w,a1
		lsl.w	#3,d1
		move.w	d1,d0
		add.w	d1,d1
		add.w	d0,d1
		adda.w	d1,a1
		move.w	#$C570,d3
		move.l	d4,4(a6)

Options_SetCorrectLocation:
		tst.b	($FFFFFF9B).w		; is routine counter at $12 (Options_NoMore)?
		bne.s	Options_Finished		; if yes, branch
		move.w	#$E570,d3

Options_Finished:
		cmpi.w	#4,($FFFFFF82).w	; is selection AIR MOVE ON B?
		bne.s	Cont_Not4		; if not, branch
		lea	($FFFFCA60).w,a1	; set location

Cont_Not4:
		cmpi.w	#7,($FFFFFF82).w	; is selection
		bne.s	Cont_Not7		; if not, branch
		lea	($FFFFCAA8).w,a1	; set location

Cont_Not7:
		cmpi.w	#10,($FFFFFF82).w	; is selection
		bne.s	Cont_Not10		; if not, branch
		lea	($FFFFCAF0).w,a1	; set location

Cont_Not10:
		cmpi.w	#13,($FFFFFF82).w	; is selection
		bne.s	Cont_Not13		; if not, branch
		lea	($FFFFCB38).w,a1	; set location

Cont_Not13:
		cmpi.w	#16,($FFFFFF82).w	; is selection
		bne.s	Cont_Not16		; if not, branch
		lea	($FFFFCB80).w,a1	; set location

Cont_Not16:
		jsr	Options_ChgLine
		move.w	#$E570,d3
		cmpi.w	#$14,($FFFFFF82).w
		bne.s	loc2_3550
		move.w	#$C570,d3

loc2_3550:
		rts	
; End of function OptionsTextLoad

; ||||||||||||||| S U B	R O U T	I N E |||||||||||||||||||||||||||||||||||||||


Options_ChgLine:				; XREF: OptionsTextLoad
		moveq	#$17,d2		; number of characters per line

loc2_3588:
		moveq	#0,d0
		move.b	(a1)+,d0
		bpl.s	loc2_3598
		move.w	#0,(a6)
		dbf	d2,loc2_3588
		rts	
; ===========================================================================

loc2_3598:				; XREF: Options_ChgLine
		add.w	d3,d0
		move.w	d0,(a6)
		dbf	d2,loc2_3588
		rts	
; End of function Options_ChgLine

; ===========================================================================
; ===========================================================================
; ===========================================================================
; ===========================================================================

GetOptionsText:
		tst.b	($FFFFFF9B).w		; is routine counter at $12 (Options_NoMore)?
		beq.w	Options_LoadUp		; if yes, branch
		
		moveq	#0,d5			; make sure d5 is empty
		lea	($FFFFCA00).w,a1	; load destination location to a1
		lea	(Options_HeaderText).l,a2	; get text location
		move.w	#71,d5			; set numbers of loops to 71
		
Options_Loop_Headerx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Headerx	; loop
; ----------------------------------------------------------------------------
		bsr.w	Options_MakeSpaceLine	; make an empty line
; ----------------------------------------------------------------------------
		lea	(Options_AirMove1).l,a2	; get text location
		move.w	#23,d5			; set numbers of loops to 23
		tst.b	($FFFFFFBC).w		; is flag set?
		beq.s	Options_Loop_AirMovex	; if not, branch
		lea	(Options_AirMove2).l,a2	; get alternate text location	
		
Options_Loop_AirMovex:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_AirMovex	; loop
; ----------------------------------------------------------------------------
		bsr.w	Options_MakeSpaceLine	; make an empty line
		bsr.w	Options_MakeSpaceLine	; make an empty line
; ----------------------------------------------------------------------------
		lea	(Options_Invin2).l,a2	; get text location
		move.w	#23,d5			; set numbers of loops to 23
		tst.b	($FFFFFF92).w		; is flag set?
		beq.s	Options_Loop_Invinx	; if not, branch
		lea	(Options_Invin1).l,a2	; get alternate text location	
		
Options_Loop_Invinx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Invinx	; loop
; ----------------------------------------------------------------------------
		bsr.w	Options_MakeSpaceLine	; make an empty line
		bsr.w	Options_MakeSpaceLine	; make an empty line
; ----------------------------------------------------------------------------
		lea	(Options_Debug1).l,a2	; get text location
		move.w	#23,d5			; set numbers of loops to 23
		btst	#2,($FFFFFF84).w	; is flag set?
		beq.s	Options_Loop_Debugx	; if yes, branch
		lea	(Options_Debug2).l,a2	; get alternate text location	
		
Options_Loop_Debugx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Debugx	; loop
; ----------------------------------------------------------------------------
		bsr.s	Options_MakeSpaceLine	; make an empty line
		bsr.s	Options_MakeSpaceLine	; make an empty line
; ----------------------------------------------------------------------------
		lea	(Options_Extended2).l,a2 ; get text location
		move.w	#23,d5			; set numbers of loops to 23
		tst.b	($FFFFFF93).w		; is flag set?
		beq.s	Options_Loop_Extendedx	; if not, branch
		lea	(Options_Extended1).l,a2 ; get alternate text location	
		
Options_Loop_Extendedx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Extendedx ; loop
; ----------------------------------------------------------------------------
		bsr.s	Options_MakeSpaceLine	; make an empty line
		bsr.s	Options_MakeSpaceLine	; make an empty line
; ----------------------------------------------------------------------------
		lea	(Options_SonicArt1).l,a2 ; get text location
		move.w	#23,d5			; set numbers of loops to 23
		tst.b	($FFFFFF94).w		; is flag set?
		beq.s	Options_Loop_SonicArtx	; if not, branch
		lea	(Options_SonicArt2).l,a2	; get alternate text location	
		
Options_Loop_SonicArtx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_SonicArtx ; loop
; ----------------------------------------------------------------------------
		bsr.s	Options_MakeSpaceLine	; make an empty line
		bsr.s	Options_MakeSpaceLine	; make an empty line
; ----------------------------------------------------------------------------
		lea	(Options_Exit).l,a2	; get text location
		tst.b	($FFFFFF9E).w
		beq.s	@cont
		lea	(Options_ExitX).l,a2

@cont:
		move.w	#23,d5			; set numbers of loops to 23
		
Options_Loop_Exitx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Exitx	; loop
; ----------------------------------------------------------------------------
		bsr.s	Options_MakeSpaceLine	; make an empty line
		rts
; ===========================================================================

Options_MakeSpaceLine:
		lea	(Options_Space).l,a2	; get text location
		move.w	#23,d5			; set numbers of loops to 23
		
Options_Loop_Spacexx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Spacexx	; loop
		rts
; ===========================================================================
; ===========================================================================		
		
		
		
Options_LoadUp:
		bra.w	Options_NoEntireText	; skip
; ===========================================================================

		moveq	#0,d5			; make sure d5 is empty
		lea	($FFFFCA00).w,a1	; load destination location to a1
		lea	(OptionsText).l,a2	; get text location
		move.w	#503,d5			; set numbers of loops to 503

Options_TextLoop:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_TextLoop	; loop
		rts				; return
; ===========================================================================
; ===========================================================================

Options_NoEntireText:
		moveq	#0,d0			; clear d0
		move.b	($FFFFFF9A).w,d0	; get index number
		move.w	Options_Index(pc,d0.w),d1 ; get current index
		jmp	Options_Index(pc,d1.w)	; jump to set position
; ===========================================================================
Options_Index:	dc.w Options_HeaderText1-Options_Index
		dc.w Options_HeaderText2-Options_Index
		dc.w Options_SpaceLine-Options_Index
		dc.w Options_SpaceLine-Options_Index
		dc.w Options_AirMove-Options_Index
		dc.w Options_AirMove2x-Options_Index
		dc.w Options_InvinTime-Options_Index
		dc.w Options_InvinTime2x-Options_Index
		dc.w Options_Debug-Options_Index
		dc.w Options_Debug2x-Options_Index
		dc.w Options_Extended-Options_Index
		dc.w Options_Extended2x-Options_Index
		dc.w Options_SonicArt-Options_Index
		dc.w Options_ExitText-Options_Index
		dc.w Options_NoMore-Options_Index
; ===========================================================================

Options_HeaderText1:
		addq.w	#1,($FFFFFF96).w	; increase main counter
		moveq	#0,d5			; make sure d5 is empty
		lea	($FFFFCA00).w,a1	; load destination location to a1
		lea	(Options_Header1).l,a2	; get text location
		move.w	($FFFFFF96).w,d5	; set numbers of loops (this will make the "typing" effect)
		
Options_Loop_Header:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Header	; loop

		lea	($FFFFCA30).w,a1	; load destination location to a1
		lea	(Options_Header1).l,a2	; get text location
		move.w	($FFFFFF96).w,d5	; set numbers of loops (this will make the "typing" effect)
		
Options_Loop_Headerxx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Headerxx	; loop
		
		cmpi.w	#23,($FFFFFF96).w	; has char 71 been reached?
		bgt.s	Options_DoNext1		; if yes, branch
		rts				; otherwise return
; ---------------------------------------------------------------------------

Options_DoNext1:
		clr.w	($FFFFFF96).w
		addq.b	#2,($FFFFFF9A).w	; go to next text
		bra.w	OptionsTextLoad	; kind of return
; ===========================================================================

Options_HeaderText2:
		addq.w	#1,($FFFFFF96).w	; increase main counter
		moveq	#0,d5			; make sure d5 is empty
		lea	($FFFFCA18).w,a1	; load destination location to a1
		lea	(Options_Header2).l,a2	; get text location
		move.w	($FFFFFF96).w,d5	; set numbers of loops (this will make the "typing" effect)
		
Options_Loop_Headerxxx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Headerxxx	; loop

		lea	($FFFFCA30).w,a1	; load destination location to a1
		lea	(Options_Header1).l,a2	; get text location
		move.w	#23,d5			; set numbers of loops (this will make the "typing" effect)
		
Options_Loop_Headerxxxx:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Headerxxxx	; loop
		
		cmpi.w	#23,($FFFFFF96).w	; has char 71 been reached?
		bgt.s	Options_Next1		; if yes, branch
		rts				; otherwise return
; ---------------------------------------------------------------------------

Options_Next1:
		addq.b	#2,($FFFFFF9A).w	; go to next text
		bra.w	OptionsTextLoad	; kind of return
; ===========================================================================

Options_SpaceLine:
		move.b	#$FF,d3			; set char to be set to $FF (space)
		move.w	#23,d5			; set numbers of loops to 23
		
Options_Loop_Spacex:
		move.b	d3,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Spacex	; loop

		addq.b	#2,($FFFFFF9A).w	; go to next text
		bra.w	OptionsTextLoad	; kind of return
; ===========================================================================

Options_MainCode:
		move.w	($FFFFFF98).w,d6	; get current number in $FFFFFF98
		beq.s	Options_NoSpaces	; if it's 0, branch
		move.b	#$FF,d5			; set char to be set to $FF (space)
		
Options_Loop_MakeFFs:
		move.b	d5,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_MakeFFs	; loop

Options_NoSpaces:
		tst.w	($FFFFFF98).w		; is $FFFFFF98 empty?
		beq.s	Options_FF98Empty	; if yes, branch		
		subq.w	#1,($FFFFFF98).w	; otherwise decrease it, to load the next char

Options_FF98Empty:
		move.w	#23,d6			; set number of loop to 23
		sub.w	($FFFFFF98).w,d6	; substract $FFFFFF98 from it
		bne.s	Options_BSR_Return	; if the result is not 0, branch
		move.w	#-1,($FFFFFF98).w	; set so it's getting skipped

Options_BSR_Return:
		rts				; return
; ===========================================================================

Options_MainCode2:
		move.w	($FFFFFF9C).w,d6	; get current number in $FFFFFF9C
		beq.s	Options_NoSpaces2	; if it's 0, branch
		move.b	#$FF,d5			; set char to be set to $FF (space)
		
Options_Loop_MakeFFs2:
		move.b	d5,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_MakeFFs2	; loop

Options_NoSpaces2:
		tst.w	($FFFFFF9C).w		; is $FFFFFF9C empty?
		beq.s	Options_FF9CEmpty	; if yes, branch		
		subq.w	#1,($FFFFFF9C).w	; otherwise decrease it, to load the next char

Options_FF9CEmpty:
		move.w	#23,d6			; set number of loop to 23
		sub.w	($FFFFFF9C).w,d6	; substract $FFFFFF9C from it
		bne.s	Options_BSR_Return2	; if the result is not 0, branch
		move.w	#-1,($FFFFFF9C).w	; set so it's getting skipped

Options_BSR_Return2:
		rts				; return
; ===========================================================================

Options_RemoveLetters:
		moveq	#0,d2
		move.w	($FFFFFF9A).w,d2	; get the number $48 needs to be multiplicated
		subq.w	#6,d2
		mulu.w	#$24,d2			; d2 / 2 * $48 = d2 * $24
		add.w	#$CA60,d2		; add another $CA00 to it
		movea.w	d2,a6			; sign extension takes place automatically
		cmp.b	#$FF,(a6)		; is the last byte of the calculated location $FF?
		beq.s	Op_CheckOk		; if yes, branch
		move.w	#-1,d2			; otherwise, set d2 to 1, for something which will be used later
		
Op_CheckOk:
		move.l	a6,($FFFFCA7A).w
		rts
; ===========================================================================

Options_AirMove:
		lea	($FFFFCA60).w,a1	; reset the text location, just in case

		bsr.s	Options_MainCode	; get default coding
		beq.s	Options_AirMove_Return	; if returned result is -1, branch

		lea	(Options_AirMove1).l,a2	; get text location
		tst.b	($FFFFFFBC).w		; is flag set?
		beq.s	Options_Loop_AirMove	; if not, branch
		lea	(Options_AirMove2).l,a2	; get alternate text location	
		
Options_Loop_AirMove:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_AirMove	; loop
		
		move.w	#$FFFF,($FFFFCA78).w	; fix those two letters manually

	;	bsr.s	Options_RemoveLetters
	;	cmpi.w	#-1,d2
	;	beq.s	Options_Next2
		cmpi.b	#$FF,($FFFFCA6B).w	; is the first letter of the row still empty?
		bne.s	Options_Next2		; if not, go on to next line

Options_AirMove_Return:
		rts				; return
; ---------------------------------------------------------------------------

Options_Next2:
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#10,($FFFFFF98).w	; reset char counter
		move.w	#23,($FFFFFF9C).w	; reset char counter 2
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_AirMove2x:
		lea	($FFFFCA60).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode	; get default coding
		beq.s	Options_AirMove_Return2	; if returned result is -1, branch

		lea	(Options_AirMove1).l,a2	; get text location
		tst.b	($FFFFFFBC).w		; is flag set?
		beq.s	Options_Loop_AirMove2	; if not, branch
		lea	(Options_AirMove2).l,a2	; get alternate text location	
		
Options_Loop_AirMove2:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_AirMove2	; loop
		
		move.w	#$FFFF,($FFFFCA78).w	; fix those two letters manually

		cmpi.b	#$FF,($FFFFCA60).w	; is the first letter of the row still empty?
		bne.s	Options_Next2x		; if not, go on to next line


		lea	($FFFFCAA8).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode2	; get default coding
		beq.s	Options_AirMove_Return2	; if returned result is -1, branch

		lea	(Options_Invin2).l,a2	; get text location
		tst.b	($FFFFFF92).w		; is flag set?
		beq.s	Options_Loop_Invin2	; if not, branch
		lea	(Options_Invin1).l,a2	; get alternate text location	
		
Options_Loop_Invin2:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Invin2	; loop
		
		move.w	#$FFFF,($FFFFCAC0).w	; fix those two letters manually


Options_AirMove_Return2:
		rts				; return
; ---------------------------------------------------------------------------

Options_Next2x:
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#23,($FFFFFF98).w	; reset char counter
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_InvinTime:
		lea	($FFFFCAA8).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode2	; get default coding
		beq.s	Options_Invin_Return	; if returned result is -1, branch

		lea	(Options_Invin2).l,a2	; get text location
		tst.b	($FFFFFF92).w		; is flag set?
		beq.s	Options_Loop_Invin	; if not, branch
		lea	(Options_Invin1).l,a2	; get alternate text location	
		
Options_Loop_Invin:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Invin	; loop
		
		move.w	#$FFFF,($FFFFCAC0).w	; fix those two letters manually

		cmpi.b	#$FF,($FFFFCAB3).w	; is the first letter of the row still empty?
		bne.s	Options_Next3		; if not, go on to next line

Options_Invin_Return:
		rts				; return
; ---------------------------------------------------------------------------

Options_Next3:
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#23,($FFFFFF98).w	; reset char counter
		move.w	#10,($FFFFFF9C).w	; reset char counter 2
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_InvinTime2x:
		lea	($FFFFCAA8).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode2	; get default coding
		beq.s	Options_Invin_Return2	; if returned result is -1, branch

		lea	(Options_Invin2).l,a2	; get text location
		tst.b	($FFFFFF92).w		; is flag set?
		beq.s	Options_Loop_Invin2x	; if not, branch
		lea	(Options_Invin1).l,a2	; get alternate text location	
		
Options_Loop_Invin2x:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Invin2x	; loop
		
		move.w	#$FFFF,($FFFFCAC0).w	; fix those two letters manually

		cmpi.b	#$FF,($FFFFCAA8).w	; is the first letter of the row still empty?
		bne.s	Options_Next3x		; if not, go on to next line

		lea	($FFFFCAF0).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode	; get default coding
		beq.s	Options_Invin_Return2	; if returned result is -1, branch
		
		lea	(Options_Debug1).l,a2	; get text location
		btst	#2,($FFFFFF84).w	; is flag set?
		beq.s	Options_Loop_Debugx2	; if yes, branch
		lea	(Options_Debug2).l,a2	; get alternate text location	
		
Options_Loop_Debugx2:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Debugx2	; loop

		move.w	#$FFFF,($FFFFCB08).w	; fix those two letters manually

Options_Invin_Return2:
		rts				; return
; ---------------------------------------------------------------------------

Options_Next3x:
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#23,($FFFFFF9C).w	; reset char counter 2
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_Debug:
		lea	($FFFFCAF0).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode	; get default coding
		beq.s	Options_Debug_Return	; if returned result is -1, branch
		
		lea	(Options_Debug1).l,a2	; get text location
		btst	#2,($FFFFFF84).w	; is flag set?
		beq.s	Options_Loop_Debug	; if yes, branch
		lea	(Options_Debug2).l,a2	; get alternate text location	
		
Options_Loop_Debug:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Debug	; loop

		move.w	#$FFFF,($FFFFCB08).w	; fix those two letters manually

		cmpi.b	#$FF,($FFFFCAFB).w	; is the first letter of the row still empty?
		bne.s	Options_Next4		; if not, go on to next line

Options_Debug_Return:
		rts
; ---------------------------------------------------------------------------

Options_Next4:
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#23,($FFFFFF9C).w	; reset char counter
		move.w	#10,($FFFFFF98).w	; reset char counter 2
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_Debug2x:
		lea	($FFFFCAF0).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode	; get default coding
		beq.s	Options_Debug_Return2x	; if returned result is -1, branch
		
		lea	(Options_Debug1).l,a2	; get text location
		btst	#2,($FFFFFF84).w	; is flag set?
		beq.s	Options_Loop_Debug2x	; if yes, branch
		lea	(Options_Debug2).l,a2	; get alternate text location	
		
Options_Loop_Debug2x:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Debug2x	; loop

		move.w	#$FFFF,($FFFFCB08).w	; fix those two letters manually

		cmpi.b	#$FF,($FFFFCAF0).w	; is the first letter of the row still empty?
		bne.s	Options_Next4x		; if not, go on to next line


		lea	($FFFFCB38).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode2	; get default coding
		beq.s	Options_Debug_Return2x	; if returned result is -1, branch
		
		lea	(Options_Extended2).l,a2 ; get text location
		tst.b	($FFFFFF93).w		; is flag set?
		beq.s	Options_Loop_Extended2x	; if not, branch
		lea	(Options_Extended1).l,a2 ; get alternate text location	
		
Options_Loop_Extended2x:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Extended2x ; loop

		move.w	#$FFFF,($FFFFCB50).w	; fix those two letters manually

Options_Debug_Return2x:
		rts
; ---------------------------------------------------------------------------

Options_Next4x:
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#23,($FFFFFF98).w	; reset char counter
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_Extended:
		lea	($FFFFCB38).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode2	; get default coding
		beq.s	Options_Ext_Return	; if returned result is -1, branch
		
		lea	(Options_Extended2).l,a2 ; get text location
		tst.b	($FFFFFF93).w		; is flag set?
		beq.s	Options_Loop_Extended	; if not, branch
		lea	(Options_Extended1).l,a2 ; get alternate text location	
		
Options_Loop_Extended:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Extended ; loop

		move.w	#$FFFF,($FFFFCB50).w	; fix those two letters manually

		cmpi.b	#$FF,($FFFFCB43).w	; is the first letter of the row still empty?
		bne.s	Options_Next5		; if not, go on to next line

Options_Ext_Return:
		rts
; ---------------------------------------------------------------------------

Options_Next5:
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#23,($FFFFFF98).w	; reset char counter
		move.w	#10,($FFFFFF9C).w	; reset char counter 2
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_Extended2x:
		lea	($FFFFCB38).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode2	; get default coding
		beq.s	Options_Ext_Return2x	; if returned result is -1, branch
		
		lea	(Options_Extended2).l,a2 ; get text location
		tst.b	($FFFFFF93).w		; is flag set?
		beq.s	Options_Loop_Extendedx2	; if not, branch
		lea	(Options_Extended1).l,a2 ; get alternate text location	
		
Options_Loop_Extendedx2:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_Extendedx2 ; loop

		move.w	#$FFFF,($FFFFCB50).w	; fix those two letters manually

		cmpi.b	#$FF,($FFFFCB38).w	; is the first letter of the row still empty?
		bne.s	Options_Next5x		; if not, go on to next line

		lea	($FFFFCB80).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode	; get default coding
		beq.s	Options_Ext_Return2x	; if returned result is -1, branch

		lea	(Options_SonicArt1).l,a2 ; get text location
		tst.b	($FFFFFF94).w		; is flag set?
		beq.s	Options_Loop_SonicArt2x	; if not, branch
		lea	(Options_SonicArt2).l,a2	; get alternate text location	
		
Options_Loop_SonicArt2x:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_SonicArt2x ; loop

		move.w	#$FFFF,($FFFFCB98).w	; fix those two letters manually

Options_Ext_Return2x:
		rts
; ---------------------------------------------------------------------------

Options_Next5x:
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#12,($FFFFFF98).w	; reset char counter
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_SonicArt:
		lea	($FFFFCB80).w,a1	; reset the text location, just in case

		bsr.w	Options_MainCode	; get default coding
		beq.s	Options_Son_Return	; if returned result is -1, branch

		lea	(Options_SonicArt1).l,a2 ; get text location
		tst.b	($FFFFFF94).w		; is flag set?
		beq.s	Options_Loop_SonicArt	; if not, branch
		lea	(Options_SonicArt2).l,a2	; get alternate text location	
		
Options_Loop_SonicArt:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d6,Options_Loop_SonicArt ; loop

		move.w	#$FFFF,($FFFFCB98).w	; fix those two letters manually

		cmpi.b	#$FF,($FFFFCB80).w	; is the first letter of the row still empty?
		bne.s	Options_Next6		; if not, go on to next line

Options_Son_Return:
		rts
; ---------------------------------------------------------------------------

Options_Next6:
		clr.w	($FFFFFF96).w
		addq.b	#2,($FFFFFF9A).w	; increase routine counter
		move.w	#23,($FFFFFF98).w	; reset char counter
		bra.w	OptionsTextLoad		; go back
; ===========================================================================

Options_ExitText:
		addq.w	#1,($FFFFFF96).w	; increase main counter
		moveq	#0,d5			; make sure d5 is empty
		lea	($FFFFCBCE).w,a1	; reset the text location, just in case
		lea	(Options_Exit2).l,a2	; get text location
		tst.b	($FFFFFF9E).w
		beq.s	@cont
		lea	(Options_ExitX2).l,a2

@cont:
		move.w	($FFFFFF96).w,d5	; set numbers of loops (this will make the "typing" effect)
		
Options_Loop_Exit:
		move.b	(a2)+,(a1)+		; load current char to a1
		dbf	d5,Options_Loop_Exit	; loop
		
		cmpi.w	#11,($FFFFFF96).w	; has char 71 been reached?
		bgt.s	Options_Stop		; if yes, branch
		rts				; otherwise return
; ---------------------------------------------------------------------------

Options_Stop:
		move.b	#1,($FFFFFF9B).w
		addq.b	#2,($FFFFFF9A).w	; increase routine counter

Options_NoMore:
		rts
; ===========================================================================
; ===========================================================================
; ===========================================================================

OptionsText:	dc.b	$0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C		; +HEADER
		dc.b	$FF, $FF, $23, $1F, $1E, $19, $13, $FF, $15, $22, $11, $10, $1F, $22, $FF, $1F, $20, $24, $19, $1F, $1E, $23, $FF, $FF		; +HEADER
		dc.b	$0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C		; +HEADER
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$11, $19, $22, $FF, $1D, $1F, $26, $15, $FF, $1F, $1E, $FF, $12, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $1E		; AIR MOVE ON B
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$19, $1E, $26, $19, $1E, $FF, $24, $19, $1D, $15, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $1E		; INVIN TIME
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$14, $15, $12, $25, $17, $FF, $1D, $1F, $14, $15, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $1E		; DEBUG MODE
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$15, $28, $24, $15, $1E, $14, $15, $14, $FF, $13, $11, $1D, $15, $22, $11, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $1E		; EXTENDED CAMERA
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$23, $1F, $1E, $19, $13, $FF, $11, $22, $24, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $23, $02, $12		; SONIC ART
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $15, $28, $19, $24, $FF, $1F, $20, $24, $19, $1F, $1E, $23, $FF, $FF, $FF, $FF, $FF, $FF		; EXIT OPTIONS
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; -space
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_HeaderText:
		dc.b	$0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C		; +HEADER
		dc.b	$FF, $FF, $23, $1F, $1E, $19, $13, $FF, $15, $22, $11, $10, $1F, $22, $FF, $1F, $20, $24, $19, $1F, $1E, $23, $FF, $FF		; +HEADER
		dc.b	$0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C		; +HEADER
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_Header1:
		dc.b	$0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C		; +HEADER
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_Header2:
		dc.b	$FF, $FF, $23, $1F, $1E, $19, $13, $FF, $15, $22, $11, $10, $1F, $22, $FF, $1F, $20, $24, $19, $1F, $1E, $23, $FF, $FF		; +HEADER
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_Space:
		dc.b	$FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; Space
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_AirMove1:
		dc.b	$11, $19, $22, $FF, $1D, $1F, $26, $15, $FF, $1F, $1E, $FF, $12, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $16, $16		; AIR MOVE ON B (off)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_AirMove2:
		dc.b	$11, $19, $22, $FF, $1D, $1F, $26, $15, $FF, $1F, $1E, $FF, $12, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $1E		; AIR MOVE ON B (on)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
options_Invin1:
		dc.b	$19, $1E, $26, $19, $1E, $FF, $24, $19, $1D, $15, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $16, $16		; INVIN TIME (off)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
options_Invin2:
		dc.b	$19, $1E, $26, $19, $1E, $FF, $24, $19, $1D, $15, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $1E		; INVIN TIME (on)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_Debug1:
		dc.b	$14, $15, $12, $25, $17, $FF, $1D, $1F, $14, $15, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $16, $16		; DEBUG MODE (off)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_Debug2:
		dc.b	$14, $15, $12, $25, $17, $FF, $1D, $1F, $14, $15, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $1E		; DEBUG MODE (on)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_Extended1:
		dc.b	$15, $28, $24, $15, $1E, $14, $15, $14, $FF, $13, $11, $1D, $15, $22, $11, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $16, $16		; EXTENDED CAMERA (off)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_Extended2:
		dc.b	$15, $28, $24, $15, $1E, $14, $15, $14, $FF, $13, $11, $1D, $15, $22, $11, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $1F, $1E		; EXTENDED CAMERA (on)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_SonicArt1:
		dc.b	$23, $1F, $1E, $19, $13, $FF, $11, $22, $24, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $23, $02, $12		; SONIC ART (S2B)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_SonicArt2:
		dc.b	$23, $1F, $1E, $19, $13, $FF, $11, $22, $24, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $23, $03		; SONIC ART (S3)
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_Exit:	dc.b	$FF, $FF, $FF, $FF, $FF, $FF	; it will continue to Options_EXit2
Options_Exit2:
	if Menu2=1
		dc.b				      $15, $28, $19, $24, $FF, $1F, $20, $24, $19, $1F, $1E, $23, $FF, $FF, $FF, $FF, $FF, $FF		; EXIT OPTIONS
	else
		dc.b				      $23, $24, $11, $22, $24, $FF, $17, $11, $1D, $15, $0A, $FF, $FF, $FF, $FF, $FF, $FF, $FF		; START GAME
	endif
		even
; -----------------------------------------------------------------------------------------------------------------------------------------------------
Options_ExitX:	dc.b	$FF, $FF, $FF, $FF, $FF, $FF	; it will continue to Options_EXitX2
Options_ExitX2:	dc.b				      $15, $28, $19, $24, $FF, $1F, $20, $24, $19, $1F, $1E, $23, $FF, $FF, $FF, $FF, $FF, $FF		; EXIT OPTIONS
		even
; ======================================================================================================================================================