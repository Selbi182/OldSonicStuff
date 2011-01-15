; ===========================================================================
; ---------------------------------------------------------------------------
; Chapter Screens
; ---------------------------------------------------------------------------

ChapterSplash:
		move.b	#$82,d0
		jsr	PlaySound_Special		; Stop music
		jsr	ClearPLC			; Clear PLCs
		jsr	Pal_FadeFrom			; Fade out previous palette
	;	jsr	ClearVRAM
		move	#$2700,sr

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

		move.b	#1,($A130F1).l			; enable SRAM
		move.b	($200001).l,($FFFFFFA0).w	; get current chaper number
		move.b	#0,($A130F1).l			; disable SRAM

; ===========================================================================
; ---------------------------------------------------------------------------
		move.l	#$40000000,($C00004).l		; Load art
		lea	($C00000).l,a6
		lea	(Art_ChapterHeader).l,a1	; load chapter header
		move.w	#$2B,d1				; load 43 tiles
		jsr	LoadTiles			; load tiles

		lea	(Map_ChapterHeader).l,a1	; load chapter header
		move.l	#$40000003,d0
		moveq	#$27,d1
		moveq	#$09,d2
		jsr	ShowVDPGraphics

		lea	(Pal_ChapterHeader).l,a1	; load chapter 3 stuff instead
		lea	($FFFFFB80).w,a2
		move.b	#7,d0				; 16 colours
ChapterSplash_PalLoop1:
		move.l	(a1)+,(a2)+
		dbf	d0,ChapterSplash_PalLoop1
; ---------------------------------------------------------------------------

		move.l	#$45A00000,($C00004).l		; Load art
		lea	($C00000).l,a6
		lea	(Art_Chapter1).l,a1		; load chapter 1
		move.w	#$46,d1				; load 70 tiles
		jsr	LoadTiles			; load tiles

		lea	(Map_Chapter1).l,a1		; load chapter 1
		move.l	#$44800003,d0
		moveq	#$27,d1
		moveq	#$12,d2
		bsr	ShowVDPGraphics2

		move.w	#$000F,($FFFFF626).w		; start at palette line 1, 16 colours ($F + 1)
		jsr	Pal_FadeTo2


		lea	(Pal_Chapter1).l,a1		; load chapter 1 palette
		lea	($FFFFFBA0).w,a2
		move.b	#7,d0				; 16 colours
ChapterSplash_PalLoop2:
		move.l	(a1)+,(a2)+
		dbf	d0,ChapterSplash_PalLoop2

		move.w	#$200F,($FFFFF626).w		; start at palette line 2, 16 colours ($F + 1)
		jsr	Pal_FadeTo2

; ---------------------------------------------------------------------------
; ===========================================================================

		move.w	#$C0,($FFFFF614).w	; set wait time

ChapterSplash_Loop:
		move.b	#4,($FFFFF62A).w
		jsr	DelayProgram
		tst.w	($FFFFF614).w		; test wait time
		bne.s	ChapterSplash_Loop	; if it isn't over, loop

ChapterSplash_Next:
		move.w	#$400,($FFFFFE10).w	; set level to SYZ1
		tst.b	($FFFFFF7D).w
		bne.s	Chapter_PlayLevel

		cmpi.b	#2,($FFFFFFA0).w	; is this chapter 2?
		bne.s	Chapter_ChkChapter3	; if not, branch
		move.w	#$200,($FFFFFE10).w	; set level to MZ1
		bra.s 	Chapter_PlayLevel

Chapter_ChkChapter3:
		cmpi.b	#3,($FFFFFFA0).w	; is this chapter 3?
		bne.s	Chapter_PlayLevel	; if not, branch
		move.w	#$101,($FFFFFE10).w	; set level to LZ2

Chapter_PlayLevel:
		move.b	#$C,($FFFFF600).w	; set to level
		move.w	#1,($FFFFFE02).w	; restart level
		clr.b	($FFFFFF7D).w
		rts
; ---------------------------------------------------------------------------
; ===========================================================================


ShowVDPGraphics2:
		lea	($C00000).l,a6		; load VDP data port address to a6
		lea	($C00004).l,a4		; load VDP address port address to a4
		move.l	#$800000,d4		; prepare line add value

MapScreen2_Row:
		move.l	d0,(a4)			; set VDP to VRam write mode
		move.w	d1,d3			; reload number of columns

MapScreen2_Column:
		move.w	(a1)+,d6
		addi.w	#$202D,d6
		move.w	d6,(a6)			; dump map to VDP map slot
		dbf	d3,MapScreen2_Column	; repeat til columns have dumped
		add.l	d4,d0			; increae to next row on VRam
		dbf	d2,MapScreen2_Row	; repeat til all rows have dumped
		rts				; return


; ===========================================================================
; ---------------------------------------------------------------------------
Art_ChapterHeader:	incbin	"Screens/ChapterScreens/Tiles_ChapterHeader.bin"
			even
Map_ChapterHeader:	incbin	"Screens/ChapterScreens/Maps_ChapterHeader.bin"
			even
Pal_ChapterHeader:	incbin	"Screens/ChapterScreens/Palette_ChapterHeader.bin"
			even
; ---------------------------------------------------------------------------
Art_Chapter1:	incbin	"Screens/ChapterScreens/ChapterFiles/Tiles_Chapter1.bin"
		even
Map_Chapter1:	incbin	"Screens/ChapterScreens/ChapterFiles/Maps_Chapter1.bin"
		even
Pal_Chapter1:	incbin	"Screens/ChapterScreens/ChapterFiles/Palette_Chapter1.bin"
		even
; ---------------------------------------------------------------------------
; ===========================================================================
