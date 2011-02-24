; ---------------------------------------------------------------------------
; Animation script - Sonic
; ---------------------------------------------------------------------------
; off_1B618:
; SonicAniData3:
		dc.w SonAni3_Walk-SonicAniData3		; 0
		dc.w SonAni3_Run-SonicAniData3		; 1
		dc.w SonAni3_Roll-SonicAniData3		; 2
		dc.w SonAni3_Roll2-SonicAniData3		; 3
		dc.w SonAni3_Push-SonicAniData3		; 4
		dc.w SonAni3_Wait-SonicAniData3		; 5
		dc.w SonAni3_Balance-SonicAniData3 	; 6
		dc.w SonAni3_LookUp-SonicAniData3	; 7
		dc.w SonAni3_Duck-SonicAniData3		; 8
		dc.w SonAni3_Warp1-SonicAniData3		; 9
		dc.w SonAni3_Warp2-SonicAniData3		; A
		dc.w SonAni3_Warp3-SonicAniData3		; B
		dc.w SonAni3_Warp4-SonicAniData3		; C
		dc.w SonAni3_Stop-SonicAniData3		; D
		dc.w SonAni3_Float1-SonicAniData3	; E
		dc.w SonAni3_Float2-SonicAniData3	; F
		dc.w SonAni3_Spring-SonicAniData3	; 10
		dc.w SonAni3_LZHang-SonicAniData3	; 11
		dc.w SonAni3_Leap1-SonicAniData3		; 12
		dc.w SonAni3_Leap2-SonicAniData3		; 13
		dc.w SonAni3_Surf-SonicAniData3		; 14
		dc.w SonAni3_Bubble-SonicAniData3	; 15
		dc.w SonAni3_Death1-SonicAniData3	; 16
		dc.w SonAni3_Drown-SonicAniData3		; 17
		dc.w SonAni3_Death2-SonicAniData3	; 18
		dc.w SonAni3_Shrink-SonicAniData3	; 19
		dc.w SonAni3_Hurt-SonicAniData3		; 1A
		dc.w SonAni3_LZSlide-SonicAniData3 	; 1B
		dc.w SonAni3_Blank-SonicAniData3		; 1C
		dc.w SonAni3_Float3-SonicAniData3	; 1D
		dc.w SonAni3_Float4-SonicAniData3	; 1E
		dc.w SonAni3_Spindash-SonicAniData3 	; 1F
		dc.w SonAni3_SPO-SonicAniData3		; 20
		dc.w SonAni3_FastRunning-SonicAniData3	; $21
		dc.w SonAni3_Null1-SonicAniData3		; $22
		dc.w SonAni3_Null2-SonicAniData3		; $23
		dc.w SonAni3_Null3-SonicAniData3		; $24
		dc.w SonAni3_Death_New-SonicAniData3	; $25
		dc.w SonAni3_Running_SPO-SonicAniData3	; $26		
		dc.w SonAni3_Sprinting_SPO-SonicAniData3	; $27
		dc.w SonAni3_HomeRoll-SonicAniData3	; $28	
		dc.w SonAni3_DownDash-SonicAniData3	; $29
		dc.w SonAni3_EXTREME-SonicAniData3	; $2A
		dc.w SonAni3_DeathGrnd-SonicAniData3	; $2B
		dc.w SonAni3_Drown2-SonicAniData3	; $2C

SonAni3_Walk:	dc.b $FF, $F,$10,$11,$12,$13,$14, $D, $E,$FF
SonAni3_Run:	dc.b $FF,$2D,$2E,$2F,$30,$FF,$FF,$FF,$FF,$FF

SonAni3_Roll:	dc.b $FE,$3D,$41,$3E,$41,$3F,$41,$40,$41,$FF,$FF
SonAni3_Roll2:	dc.b $FE,$3D,$3E,$3F,$40,$41,$FF

SonAni3_Push:	dc.b $FD,$48,$49,$4A,$4B,$FF,$FF,$FF,$FF,$FF
SonAni3_Wait:	dc.b $A, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 2, 2, 5, 4, 5, 4, 5, 4, 5,  4, 5,  4, 5, 4, 5, 4, 5, 4, 5,  5, 4,  5, 4,  5, 4,  5, 4,  5, 4,  5, 4, 6, 7, 8, 9, 9, $FE, $1F, 0
SonAni3_Balance:	dc.b   7, $64, $65, $66, $FF
SonAni3_LookUp:	dc.b   5, $B, $C,$FE,  1
SonAni3_Duck:	dc.b   5,$4C,$4D,$FE,  1
SonAni3_Warp1:	dc.b $3F, $33, $FF, 0
SonAni3_Warp2:	dc.b $3F, $34, $FF, 0
SonAni3_Warp3:	dc.b $3F, $35, $FF, 0
SonAni3_Warp4:	dc.b $3F, $36, $FF, 0
SonAni3_Stop:	dc.b   5,$6B,$6C,$6D,$6E,$FD,  0 ; halt/skidding animation
SonAni3_Float1:	dc.b   7,$54,$55,$56,$57,$58,$59,$FF
SonAni3_Float2:	dc.b   7,$54,$55,$56,$57,$58,$59,$FF
SonAni3_Spring:	dc.b $2F, $5B, $FD, 0
SonAni3_LZHang:	dc.b   1,$50,$51,$FF
SonAni3_Leap1:	dc.b $F, $43, $43, $43,	$FE, 1
SonAni3_Leap2:	dc.b $F, $43, $44, $FE,	1, 0
SonAni3_Surf:	dc.b $3F, $49, $FF, 0
SonAni3_Bubble:	dc.b $B, $5A, $5A, $3D,$41,$3E,$41,$3F,$41,$40,$41, $FD,	0, 0
SonAni3_Death1:	dc.b $20, $5C, $FF, 0
SonAni3_Drown:	dc.b $2F, $5D, $FF, 0
SonAni3_Death2:	dc.b 3,	$5C, $FF, 0
SonAni3_Shrink:	dc.b 3,	$4E, $4F, $50, $51, $52, 0, $FE, 1, 0
SonAni3_Hurt:	dc.b $F,$4E, $4F, $4E, $4F,$4E, $4F,$4E, $4F,$4E, $4F,$4E, $4F,$4E, $4F,$4E, $4F, $4E, $4F,$4E, $4F,$4E, $4F,$4E, $4F,$4E, $4F,$4E, $4F,$FF
SonAni3_LZSlide:	dc.b 7, $4E, $4F, $FF
SonAni3_Blank:	dc.b $77,  0,$FD,  0
SonAni3_Float3:	dc.b 3,	$3C, $3D, $53, $3E, $54, $FF, 0
SonAni3_Float4:	dc.b 3,	$3C, $FD, 0
SonAni3_Spindash: dc.b   0,$42,$43,$42,$44,$42,$45,$42,$46,$42,$47,$FF
SonAni3_SPO:		dc.b 2, $F,$10,$11,$12,$13,$14, $D, $E, $FD, $26
SonAni3_FastRunning:	dc.b $FF,$2D,$2E,$2F,$30,$FF,$FF,$FF,$FF,$FF
SonAni3_Null1:		dc.b 0
SonAni3_Null2:		dc.b 0
SonAni3_Null3:		dc.b 0
SonAni3_Death_New:	dc.b $28,	$5C, $FD, $17
SonAni3_Running_SPO:	dc.b 2, $2D, $2E, $2F, $30, $2D, $2E, $2F, $30, $2D, $2E, $FD, $27
SonAni3_Sprinting_SPO:	dc.b 0, $2D, $2E, $2F, $30, $2D, $2E, $2F, $30, $2D, $2E, $FF
SonAni3_HomeRoll:	dc.b 0, $2E, $2F, $32, $30, $31, $32, $FF
SonAni3_DownDash:	dc.b 0, $35, $75, $FF
SonAni3_EXTREME:		dc.b 0,0,1,2,3,4,5,6,7,8,9,$A,$B,$C,$D,$E,$F,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F,$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B,$3C,$3D,$3E,$3F,$40,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$5B,$5C,$5D,$5E,$5F,$60,$61,$62,$63,$64,$65,$66,$67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F,$70,$71,$72,$73,$74,$FF
SonAni3_DeathGrnd:	dc.b $2F, $54, $FF, 0
SonAni3_Drown2:		dc.b 5, $54, $FD, $17
		even