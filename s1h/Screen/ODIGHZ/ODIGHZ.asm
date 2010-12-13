; =====================================================================================================================
; "One Day in Green Hill Zone" screen - Code made by Marc
; =====================================================================================================================
ODIGHZSplash_NxtScr		EQU	$0C		; Screen mode to go to next (Sega Screen)
ODIGHZSplash_Wait		EQU	$C0		; Time to wait
; ---------------------------------------------------------------------------------------------------------------------

ODIGHZSplash:
		jsr	ClearPLC			; Clear PLCs
		jsr	Pal_FadeFrom			; Fade out previous palette
		move	#$2700,sr

ODIGHZSplash_VDP:
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
	;	move.b	#2,($FFFFFFA0).w
		
ODIGHZSplash_Art:
		move.l	#$40000000,($C00004).l		; Load art
		lea	($C00000).l,a6

		move.b	#1,($A130F1).l		; enable SRAM
		move.b	($200001).l,($FFFFFFA0).w	; get current chaper number
		move.b	#0,($A130F1).l		; disable SRAM

		lea	(Art_Chapter1).l,a1	; load stuff for chapter 1
		cmpi.b	#2,($FFFFFFA0).w	; is flag set to chapter 2?
		bne.s	ODIGHZ_NoArt2		; if not, branch
		lea	(Art_Chapter2).l,a1	; load chapter 2 stuff instead

ODIGHZ_NoArt2:
		cmpi.b	#3,($FFFFFFA0).w	; is flag set to chapter 3?
		bne.s	ODIGHZ_NoArt3		; if not, branch
		lea	(Art_Chapter3).l,a1	; load chapter 3 stuff instead

ODIGHZ_NoArt3:
		move.w	#$B6,d1			; load 183 tiles
		jsr	LoadTiles		; load tiles

ODIGHZSplash_Mappings:
		lea	(Map_Chapter1).l,a1		; load stuff for chapter 1
		cmpi.b	#2,($FFFFFFA0).w		; is flag set to chapter 2?
		bne.s	ODIGHZ_NoMap2			; if not, branch
		lea	(Map_Chapter2).l,a1		; load chapter 2 stuff instead

ODIGHZ_NoMap2:
		cmpi.b	#3,($FFFFFFA0).w		; is flag set to chapter 3?
		bne.s	ODIGHZ_NoMap3			; if not, branch
		lea	(Map_Chapter3).l,a1		; load chapter 3 stuff instead

ODIGHZ_NoMap3:
		move.l	#$40000003,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		jsr	ShowVDPGraphics
		
ODIGHZSplash_Palette:
		lea	(Pal_Chapter1).l,a1		; load stuff for chapter 1
		cmpi.b	#2,($FFFFFFA0).w		; is flag set to chapter 2?
		bne.s	ODIGHZ_NoPal2			; if not, branch
		lea	(Pal_Chapter2).l,a1		; load chapter 2 stuff instead

ODIGHZ_NoPal2:
		cmpi.b	#3,($FFFFFFA0).w		; is flag set to chapter 3?
		bne.s	ODIGHZ_NoPal3			; if not, branch
		lea	(Pal_Chapter3).l,a1		; load chapter 3 stuff instead

ODIGHZ_NoPal3:
		lea	($FFFFFB80).w,a2
		move.b	#$40,d0

ODIGHZSplash_PalLoop:
		move.l	(a1)+,(a2)+
		tst.w	d0
		beq.s	ODIGHZSplash_Music
		sub.w	#1,d0
		bra.s	ODIGHZSplash_PalLoop
		
ODIGHZSplash_Music:
		move.b	#$E4,d0
		jsr	PlaySound_Special		; Stop music
	;	move.w	#ODIGHZSplash_MusicID,d0		; Play music
	;	jsr	PlaySound
		
ODIGHZSplash_SetWait:
		move.w	#ODIGHZSplash_Wait,($FFFFF614).w	; Wait time
		jsr	Pal_FadeTo			; Fade palette in

; ---------------------------------------------------------------------------------------------------------------------
ODIGHZSplash_Loop:
		move.b	#2,($FFFFF62A).w		; Function 2 in vInt
		jsr	DelayProgram			; Run delay program
		tst.w	($FFFFF614).w			; Test wait time
		bne.s	ODIGHZSplash_Loop		; if it isn't over, loop

ODIGHZSplash_Next:
		move.w	#$400,($FFFFFE10).w	; set level to SYZ1
		move.b	#$C,($FFFFF600).w	; set to level
		move.w	#1,($FFFFFE02).w	; restart level
		rts
		
; ---------------------------------------------------------------------------------------------------------------------
Art_Chapter1:	incbin	"Screen/ODIGHZ/Tiles_Chapter1.bin"
		even
Map_Chapter1:	incbin	"Screen/ODIGHZ/Maps_Chapter1.bin"
		even			
Pal_Chapter1:	incbin	"Screen/ODIGHZ/Palette_Chapter1.bin"
		even

Art_Chapter2:	incbin	"Screen/ODIGHZ/Tiles_Chapter2.bin"
		even
Map_Chapter2:	incbin	"Screen/ODIGHZ/Maps_Chapter2.bin"
		even			
Pal_Chapter2:	incbin	"Screen/ODIGHZ/Palette_Chapter2.bin"
		even

Art_Chapter3:	incbin	"Screen/ODIGHZ/Tiles_Chapter3.bin"
		even
Map_Chapter3:	incbin	"Screen/ODIGHZ/Maps_Chapter3.bin"
		even			
Pal_Chapter3:	incbin	"Screen/ODIGHZ/Palette_Chapter3.bin"
		even