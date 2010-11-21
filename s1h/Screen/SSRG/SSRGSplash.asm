; =====================================================================================================================
; SSRG Splash Screen - Code made by Marc - Sonic Chrom Hedgehog: ERaZor
; =====================================================================================================================
SSRGSplash_MusicID		EQU	$C5		; Music to play
SSRGSplash_NxtScr		EQU	$04		; Screen mode to go to next (Title Screen)
SSRGSplash_Wait			EQU	$70		; Time to wait

; ---------------------------------------------------------------------------------------------------------------------
SSRGSplash:
		move.b	#$E4,d0
		jsr	PlaySound_Special		; Stop music
		jsr	ClearPLC			; Clear PLCs
		jsr	Pal_FadeFrom			; Fade out previous palette
		move	#$2700,sr

SSRGSplash_VDP:
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
		
SSRGSplash_Art:
		move.l	#$40000000,($C00004).l		; Load art
		lea	(Art_SSRGSplash).l,a0
		jsr	NemDec
		
SSRGSplash_Mappings:
		lea	($FF0000).l,a1			; Load screen mappings
		lea	(Map_SSRGSplash).l,a0
		move.w	#0,d0
		jsr	EniDec
		
SSRGSplash_ShowOnVDP:
		lea	($FF0000).l,a1			; Show screen
		move.l	#$40000003,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		jsr	ShowVDPGraphics		
		
SSRGSplash_Palette:
		lea	(Pal_SSRGSplash).l,a1		; Load palette
		lea	($FFFFFB80).w,a2
		move.b	#$40,d0
SSRGSplash_PalLoop:
		move.l	(a1)+,(a2)+
		tst.w	d0
		beq.s	SSRGSplash_Music
		sub.w	#1,d0
		bra.s	SSRGSplash_PalLoop
		
SSRGSplash_Music:
		move.w	#SSRGSplash_MusicID,d0		; Play music
		jsr	PlaySound
		
SSRGSplash_SetWait:
		move.w	#SSRGSplash_Wait,($FFFFF614).w	; Wait time
		jsr	Pal_FadeTo			; Fade palette in

; ---------------------------------------------------------------------------------------------------------------------
SSRGSplash_Loop:
		move.b	#2,($FFFFF62A).w		; Function 2 in vInt
		jsr	DelayProgram			; Run delay program
		tst.w	($FFFFF614).w			; Test wait time
		beq.s	SSRGSplash_Next		; is it over? branch
		andi.b	#$80,($FFFFF605).w		; is Start button pressed?
		beq.s	SSRGSplash_Loop		; if not, loop

SSRGSplash_Next:
		jmp	SelbiSplash
	;	move.b	#SSRGSplash_NxtScr,($FFFFF600).w ; go to next screen
		rts	
		
; ---------------------------------------------------------------------------------------------------------------------
Art_SSRGSplash:	incbin	"Screen/SSRG/Tiles.bin"
			even
			
Map_SSRGSplash:	incbin	"Screen/SSRG/Maps.bin"
			even
			
Pal_SSRGSplash:	incbin	"Screen/SSRG/Palette.bin"
			even
