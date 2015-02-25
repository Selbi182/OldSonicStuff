; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_UDAXs:	
		dc.w SME_UDAXs_A-SME_UDAXs, SME_UDAXs_1F-SME_UDAXs	
		dc.w SME_UDAXs_2F-SME_UDAXs, SME_UDAXs_3F-SME_UDAXs	
		dc.w SME_UDAXs_4F-SME_UDAXs	
SME_UDAXs_A:	dc.b 4	
		dc.b $F0, $B, 0, 0, $E8	
		dc.b $F0, $B, 8, 0, 0	
		dc.b $10, 1, 0, $38, $FC	
		dc.b $20, 0, 0, $39, $FC	
SME_UDAXs_1F:	dc.b 3	
		dc.b $F0, $F, 0, $C, $F0	
		dc.b $10, 1, 0, $38, $FC	
		dc.b $20, 0, 0, $39, $FC	
SME_UDAXs_2F:	dc.b 3	
		dc.b $F0, 3, 0, $1C, $FC	
		dc.b $10, 1, 8, $38, $FC	
		dc.b $20, 0, 8, $39, $FC	
SME_UDAXs_3F:	dc.b 3	
		dc.b $F0, $F, 8, $C, $F0	
		dc.b $10, 1, 8, $38, $FC	
		dc.b $20, 0, 8, $39, $FC	
SME_UDAXs_4F:	dc.b 4	
		dc.b $F0, $B, 0, $20, $E8	
		dc.b $F0, $B, 0, $2C, 0	
		dc.b $10, 1, 0, $38, $FC	
		dc.b $20, 0, 0, $39, $FC	
		even