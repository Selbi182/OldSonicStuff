CreditsScreen:
		move.b	#$E4,d0
		jsr	PlaySound_Special
		jsr	ClearPLC			; Clear PLCs
		move	#$2700,sr

CreditsScreen_VDP:
		lea	($C00004).l,a6			; Setup VDP
		move.w	#$8004,(a6)
		move.w	#$8230,(a6)
		move.w	#$8407,(a6)
		move.w	#$9001,(a6)
		move.w	#$9200,(a6)
		move.w	#$8B03,(a6)
		move.w	#$8720,(a6)
		clr.b	($FFFFF64E).w
		jsr	ClearScreen			; Clear screen

		lea	(Pal_CreditsScreen).l,a1		; Load palette
		lea	($FFFFFB00).w,a2
		move.b	#$40,d0
CreditsScreen_PalLoop:
		move.l	(a1)+,(a2)+
		tst.w	d0
		beq.s	@cont
		sub.w	#1,d0
		bra.s	CreditsScreen_PalLoop

@cont:
		jsr	RunPLC_RAM
		move.b	#$12,($FFFFF62A).w
		jsr	DelayProgram

		lea	($C00000).l,a6
		move.l	#$40000000,($C00004).l
		lea	(Art_CreditsScreen).l,a0
		move.w	#$2AF,d1

Error_LoadGfxX:
		move.w	(a0)+,(a6)
		dbf	d1,Error_LoadGfxX
		
		moveq	#1,d2
		bsr	CS_LoadMap


		move.w	#180,($FFFFF614).w
		move.b	#1,($FFFFFF9A).w

CreditsScreen_Loop:
		move.b	#2,($FFFFF62A).w		; Function 2 in vInt
		jsr	DelayProgram			; Run delay program

		tst.w	($FFFFF614).w
		bne.s	@cont
		moveq	#0,d2
		move.b	($FFFFFF9A).w,d2
		cmpi.b	#$1C,d2
		beq.s	@cont
		bsr	CS_LoadMap
		addq.b	#1,($FFFFFF9A).w
		move.w	#30,($FFFFF614).w
		cmpi.b	#2,($FFFFFF9A).w
		beq.s	@cont
		cmpi.b	#6,($FFFFFF9A).w
		beq.s	@cont
		cmpi.b	#9,($FFFFFF9A).w
		beq.s	@cont
		cmpi.b	#12,($FFFFFF9A).w
		beq.s	@cont
		cmpi.b	#17,($FFFFFF9A).w
		beq.s	@cont
		cmpi.b	#19,($FFFFFF9A).w
		beq.s	@cont
		cmpi.b	#23,($FFFFFF9A).w
		beq.s	@cont
		cmpi.b	#25,($FFFFFF9A).w
		beq.s	@cont
		move.b	#$C4,d0
		jsr	PlaySound_Special

@cont:
		cmpi.b	#$1C,d2
		bne.s	CreditsScreen_Loop
		andi.b	#$80,($FFFFF605).w		; is Start button pressed?
		beq.w	CreditsScreen_Loop		; if not, loop

CreditsScreen_Next:
		move.b	#0,($FFFFF600).w ; go to next screen
		move.w	#0,($FFFFFE10).w
		
		move.w	#$7F,d1
		moveq	#0,d0
		lea	($FFFFFE00).w,a1

@clrram:
		move.l	d0,(a1)+
		dbf	d1,@clrram
		rts	
		
; ---------------------------------------------------------------------------------------------------------------------

CS_LoadMap:
		lea	($FF0000).l,a1			; Load screen mappings
		lea	(Map_CreditsScreen).l,a0
		move.w	#0,d0
		jsr	EniDec
		move.l	#$40000003,d0
		moveq	#$21,d1
		jsr	ShowVDPGraphics
		rts


; ---------------------------------------------------------------------------------------------------------------------
Pal_CreditsScreen:	incbin	"Screens/CreditsScreen/Palette.bin"
			even
Art_CreditsScreen:	incbin	"Screens/CreditsScreen/menutext.bin"
			even
Map_CreditsScreen:	incbin	"Screens/CreditsScreen/Maps_eni.bin"
			even
