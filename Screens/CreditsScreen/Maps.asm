; ===========================================================================
; ---------------------------------------------------------------------------
; Scrolling
; ---------------------------------------------------------------------------
;	dc.b	$0D						; Number of lines
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
;	dc.b	"                    ",$FF
; ---------------------------------------------------------------------------

CreditsMaps:

	dc.w	$0100						; time for each section to scroll
	dc.w	$0001						; current timer
	dc.l	$00FF000C					; start address
	dc.l	EndText-StartText				; number of sections

StartText:
	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	"  CREATED AND MAIN  ",$FF
	dc.b	"                    ",$FF
	dc.b	"   PROGRAMMING BY   ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"       SELBI        ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF


	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	" WITH GRAPHICS AND  ",$FF
	dc.b	"                    ",$FF
	dc.b	" SPECIAL HELP FROM  ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"    MARKEYJESTER    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF


	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	"    MUSIC CREATED   ",$FF
	dc.b	"                    ",$FF
	dc.b	"         BY         ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"      DALEKSAM      ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF

	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	"    MUSIC CREATED   ",$FF
	dc.b	"                    ",$FF
	dc.b	"         BY         ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"        SOTI        ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF

	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	"    MUSIC CREATED   ",$FF
	dc.b	"                    ",$FF
	dc.b	"         BY         ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"  EDUARDO KNUCKLES  ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF

	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	" MAIN BETA TESTING  ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"     SONICVAAN      ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF

	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	" SPECIAL THANKS TO  ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"     MAINMEMORY     ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF


	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	" SPECIAL THANKS TO  ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"    VLADIKCOMPER    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF

	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	"   ORIGINAL GAME    ",$FF
	dc.b	"                    ",$FF
	dc.b	"         BY         ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"     SONIC TEAM     ",$FF
	dc.b	"                    ",$FF
	dc.b	"        SEGA        ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF

	dc.b	$0D						; Number of lines
	dc.b	"                    ",$FF
	dc.b	"    THANKS  FOR     ",$FF
	dc.b	"                    ",$FF
	dc.b	"      PLAYING       ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"    PRESS  START    ",$FF
	dc.b	"                    ",$FF
	dc.b	"     TO  RETURN     ",$FF
	dc.b	"                    ",$FF
	dc.b	"   TO SEGA SCREEN   ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF
	dc.b	"                    ",$FF

EndText:

; ---------------------------------------------------------------------------
; ===========================================================================