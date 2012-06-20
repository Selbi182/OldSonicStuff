; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_wCaAT:	
		dc.w SME_wCaAT_4-SME_wCaAT, SME_wCaAT_14-SME_wCaAT	
SME_wCaAT_4:	dc.b 3	
		dc.b $F1, $A, 0, 0, $F4	
		dc.b 9, 8, 0, 9, $F4	
		dc.b $E7, 1, 0, $C, $FC	
SME_wCaAT_14:	dc.b 3	
		dc.b $F1, $A, 0, $E, $F4	
		dc.b 9, 8, 0, $17, $F4	
		dc.b $E7, 1, 0, $1A, $FC	
		even