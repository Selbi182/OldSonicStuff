; =====================================================================================================================
; Selbi Splash Screen - Code made by Marc - Sonic ERaZor
; =====================================================================================================================
SelbiSplash_MusicID		EQU	$B7		; Music to play
SelbiSplash_NxtScr		EQU	$04		; Screen mode to go to next (Title Screen)
SelbiSplash_Wait		EQU	$D0		; Time to wait ($100)
SelbiSplash_PalChgSpeed		EQU	$200		; Speed for the palette to be changed ($200)

; ---------------------------------------------------------------------------------------------------------------------
SelbiSplash:
		move.b	#$E4,d0
		jsr	PlaySound_Special		; Stop music
		jsr	ClearPLC			; Clear PLCs
		jsr	Pal_FadeFrom			; Fade out previous palette
		move	#$2700,sr

SelbiSplash_VDP:
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
		
SelbiSplash_Art:
		move.l	#$40000000,($C00004).l		; Load art
		lea	(Art_SelbiSplash).l,a0
		jsr	NemDec
		
SelbiSplash_Mappings:
		lea	($FF0000).l,a1			; Load screen mappings
		lea	(Map_SelbiSplash).l,a0
		move.w	#0,d0
		jsr	EniDec
		
SelbiSplash_ShowOnVDP:
		lea	($FF0000).l,a1			; Show screen
		move.l	#$40000003,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		jsr	ShowVDPGraphics		
		
SelbiSplash_Palette:
		lea	(Pal_SelbiSplash).l,a1		; Load palette
		lea	($FFFFFB80).w,a2
		move.b	#$40,d0
SelbiSplash_PalLoop:
		move.l	(a1)+,(a2)+
		tst.w	d0
		beq.s	SelbiSplash_Music
		sub.w	#1,d0
		bra.s	SelbiSplash_PalLoop
		
SelbiSplash_Music:
	;	move.w	#SelbiSplash_MusicID,d0		; Play music
	;	jsr	PlaySound
		
SelbiSplash_SetWait:
		move.w	#SelbiSplash_Wait,($FFFFF614).w	; Wait time
		jsr	Pal_FadeTo			; Fade palette in
		move.b	#SelbiSplash_MusicID,d0		; Play music
		jsr	PlaySound

; ---------------------------------------------------------------------------------------------------------------------
SelbiSplash_Loop:
		cmpi.w	#$40,($FFFFF614).w		; is time less than $40?
		bmi.s	SelbiSplash_DontChangePal	; if yes, branch
		sub.w	#SelbiSplash_PalChgSpeed,($FFFFFB04)
		sub.w	#SelbiSplash_PalChgSpeed,($FFFFFB06)
		sub.w	#SelbiSplash_PalChgSpeed,($FFFFFB08)
		sub.w	#SelbiSplash_PalChgSpeed,($FFFFFB0A)
		sub.w	#SelbiSplash_PalChgSpeed,($FFFFFB0C)
		sub.w	#SelbiSplash_PalChgSpeed,($FFFFFB0E)
		cmpi.w	#$70,($FFFFF614).w		; is time more than $70?
		bpl.s	SelbiSplash_ChangePal		; if yes, branch
		move.w	($FFFFF614).w,d0
		neg.w	d0
		and.w	#3,d0
		bne.s	SelbiSplash_ChangePal
		jsr	Pal_ToWhite
		bra.s	SelbiSplash_ChangePal

SelbiSplash_DontChangePal:
		tst.b	($FFFFFFAF).w
		bne.s	SelbiSplash_ChangePal
		move.b	#$C3,d0			; play giant ring sound
		jsr	PlaySound		
		movem.l	d0-a6,-(sp)

SelbiSplash_LoadPRESENTS:
		lea	($FF0000).l,a1			; Load screen mappings
		lea	(Map2_SelbiSplash).l,a0
		move.w	#0,d0
		jsr	EniDec
		lea	($FF0000).l,a1			; Show screen
		move.l	#$40000003,d0
		moveq	#$27,d1
		moveq	#$1B,d2
		jsr	ShowVDPGraphics

SelbiSplash_PalLoop2:
		move.l	(a1)+,(a2)+
		tst.w	d0
		beq.s	SelbiSplash_PL2Passed
		sub.w	#1,d0
		bra.s	SelbiSplash_PalLoop2

SelbiSplash_PL2Passed:	
		jsr	Pal_MakeWhite
		movem.l (sp)+,d0-a6
		move.b	#1,($FFFFFFAF).w

SelbiSplash_ChangePal:
		move.b	#2,($FFFFF62A).w		; Function 2 in vInt
		jsr	DelayProgram			; Run delay program
		tst.w	($FFFFF614).w			; Test wait time
		beq.s	SelbiSplash_Next		; is it over? branch
		andi.b	#$80,($FFFFF605).w		; is Start button pressed?
		beq.w	SelbiSplash_Loop		; if not, loop

SelbiSplash_Next:
		clr.b	($FFFFFFAF).w
	;	jmp	TongaraSplash
		move.b	#SelbiSplash_NxtScr,($FFFFF600).w ; go to next screen
		rts	
		
; ---------------------------------------------------------------------------------------------------------------------
Art_SelbiSplash:	incbin	"Screen/Tiles.bin"
			even
Map2_SelbiSplash:	incbin	"Screen/Maps_WithPRESENTS.bin"
			even
Map_SelbiSplash:	incbin	"Screen/Maps_NoPRESENTS.bin"
			even
Pal_SelbiSplash:	incbin	"Screen/Palette.bin"
			even 