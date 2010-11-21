; =====================================================================================================================
; Selbi Splash Screen - Code made by Marc - Sonic Chrom Hedgehog: ERaZor
; =====================================================================================================================
GayBomb_MusicID		EQU	$93		; Music to play
GayBomb_NxtScr		EQU	$04		; Screen mode to go to next (Title Screen)
GayBomb_Wait		EQU	$80		; Time to wait

; ---------------------------------------------------------------------------------------------------------------------
GayBomb:
		move.b	#$E4,d0
		jsr	PlaySound_Special		; Stop music
		jsr	ClearPLC			; Clear PLCs
		jsr	Pal_FadeFrom			; Fade out previous palette
		move	#$2700,sr

GayBomb_VDP:
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
		
GayBomb_Art:
		move.l	#$40000000,($C00004).l		; Load art
		lea	(Art_GayBomb).l,a0
		jsr	NemDec
		
GayBomb_Mappings:
		lea	($FF0000).l,a1			; Load screen mappings
		lea	(Map_GayBomb).l,a0
		move.w	#0,d0
		jsr	EniDec
		
GayBomb_ShowOnVDP:
		lea	($FF0000).l,a1			; Show screen
		move.l	#$40000003,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		jsr	ShowVDPGraphics		
		
GayBomb_Palette:
		lea	(Pal_GayBomb).l,a1		; Load palette
		lea	($FFFFFB80).w,a2
		move.b	#$40,d0
GayBomb_PalLoop:
		move.l	(a1)+,(a2)+
		tst.w	d0
		beq.s	GayBomb_Music
		sub.w	#1,d0
		bra.s	GayBomb_PalLoop
		
GayBomb_Music:
		move.w	#GayBomb_MusicID,d0		; Play music
		jsr	PlaySound
		
GayBomb_SetWait:
		move.w	#GayBomb_Wait,($FFFFF614).w	; Wait time
		jsr	Pal_FadeTo			; Fade palette in

; ---------------------------------------------------------------------------------------------------------------------
GayBomb_Loop:
		move.b	#2,($FFFFF62A).w		; Function 2 in vInt
		jsr	DelayProgram			; Run delay program
		tst.w	($FFFFF614).w			; Test wait time
		beq.s	GayBomb_Next		; is it over? branch
		andi.b	#$80,($FFFFF605).w		; is Start button pressed?
		beq.s	GayBomb_Loop		; if not, loop

GayBomb_Next:
		jmp	SelbiSplash
	;	move.b	#GayBomb_NxtScr,($FFFFF600).w ; go to next screen
		rts	
		
; ---------------------------------------------------------------------------------------------------------------------
Art_GayBomb:	incbin	"Screen/GayBomb/Tiles.bin"
			even
			
Map_GayBomb:	incbin	"Screen/GayBomb/Maps.bin"
			even
			
Pal_GayBomb:	incbin	"Screen/GayBomb/Palette.bin"
			even
