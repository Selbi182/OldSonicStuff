; ================================================================================
; --------------------------------------------------------------------------------
; Sprite mappings - HUD
; --------------------------------------------------------------------------------

Obj21_Mappings:
		dc.w	Obj21_Blank-Obj21_Mappings	; [$0]
		dc.w	Obj21_Score-Obj21_Mappings	; [$1]
		dc.w	Obj21_Rings-Obj21_Mappings	; [$2]
		dc.w	Obj21_AltRings-Obj21_Mappings	; [$3]
		dc.w	Obj21_Time-Obj21_Mappings	; [$4]
		dc.w	Obj21_Lives-Obj21_Mappings	; [$5]
; --------------------------------------------------------------------------------

Obj21_Blank	dc.b 0
		dc.b $00, $00, $00, $00, $00	; Blank

Obj21_Score:	dc.b 4
		dc.b $F9, $0D, $80, $00, $C8	; SCOR
		dc.b $F9, $01, $80, $16, $E8	; E
		dc.b $F8, $0D, $80, $18, $F0	; First part of Score Counter
		dc.b $F8, $0D, $80, $20, $10	; Second part of Score Counter

Obj21_Rings:	dc.b 3
		dc.b $F9, $0D, $80, $08, $01	; RING
		dc.b $F9, $01, $80, $00, $1C	; S
		dc.b $F8, $09, $80, $30, $DC	; Rings Counter

Obj21_AltRings:	dc.b 3
		dc.b $FB, $0D, $A0, $08, $01	; RING (Alternate)
		dc.b $FB, $01, $A0, $00, $1C	; S (Alternate)
		dc.b $F8, $09, $A0, $30, $DE	; Rings Counter (Alternate)

Obj21_Time:	dc.b 4
		dc.b $F9, $09, $80, $10, $E0	; TIM
		dc.b $F9, $01, $80, $16, $F6	; E
		dc.b $F8, $01, $80, $28, $08	; First digit of Timer
		dc.b $F8, $05, $80, $2C, $10	; Second and third digit of Timer

Obj21_Lives:	dc.b 3
		dc.b $F9, $0D, $81, $0A, $F4	; LIVE
		dc.b $F9, $01, $80, $00, $10	; S
		dc.b $F8, $05, $81, $12, $DC	; Lives Counter
		even
; --------------------------------------------------------------------------------
; ================================================================================