; =====================================================================================================================
; Selbi Splash Screen - Code made by Marc - Sonic Chrom Hedgehog: ERaZor
; =====================================================================================================================
TongaraSplash_MusicID		EQU	$8F		; Music to play
TongaraSplash_NxtScr		EQU	$00		; Screen mode to go to next (Sega Screen)
TongaraSplash_Wait		EQU	$160		; Time to wait

; ---------------------------------------------------------------------------------------------------------------------
TongaraSplash:
	;	move.b	#$E4,d0
	;	jsr	PlaySound_Special		; Stop music
		jsr	ClearPLC			; Clear PLCs
		jsr	Pal_FadeFrom			; Fade out previous palette
		move	#$2700,sr

TongaraSplash_VDP:
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
		
TongaraSplash_Art:
		move.l	#$40000000,($C00004).l		; Load art
		lea	(Art_TongaraSplash).l,a0
		jsr	NemDec
		
TongaraSplash_Mappings:
		lea	($FF0000).l,a1			; Load screen mappings
		lea	(Map_TongaraSplash).l,a0
		move.w	#0,d0
		jsr	EniDec
		
TongaraSplash_ShowOnVDP:
		lea	($FF0000).l,a1			; Show screen
		move.l	#$40000003,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		jsr	ShowVDPGraphics		
		
TongaraSplash_Palette:
		lea	(Pal_TongaraSplash).l,a1		; Load palette
		lea	($FFFFFB80).w,a2
		move.b	#$40,d0
TongaraSplash_PalLoop:
		move.l	(a1)+,(a2)+
		tst.w	d0
		beq.s	TongaraSplash_Music
		sub.w	#1,d0
		bra.s	TongaraSplash_PalLoop
		
TongaraSplash_Music:
		move.w	#TongaraSplash_MusicID,d0		; Play music
		jsr	PlaySound
		
TongaraSplash_SetWait:
		move.w	#TongaraSplash_Wait,($FFFFF614).w	; Wait time
		jsr	Pal_FadeTo			; Fade palette in

; ---------------------------------------------------------------------------------------------------------------------
TongaraSplash_Loop:
		move.b	#2,($FFFFF62A).w		; Function 2 in vInt
		jsr	DelayProgram			; Run delay program
		tst.w	($FFFFF614).w			; Test wait time
		beq.s	TongaraSplash_Next		; is it over? branch
	;	andi.b	#$80,($FFFFF605).w		; is Start button pressed?
		bra.s	TongaraSplash_Loop		; if not, loop

TongaraSplash_Next:
	;	jmp	GayBomb
		move.b	#TongaraSplash_NxtScr,($FFFFF600).w ; go to next screen
		rts	
		
; ---------------------------------------------------------------------------------------------------------------------
Art_TongaraSplash:	incbin	"Screen/Tongara/Tiles.bin"
			even
			
Map_TongaraSplash:	incbin	"Screen/Tongara/Maps.bin"
			even
			
Pal_TongaraSplash:	incbin	"Screen/Tongara/Palette.bin"
			even
