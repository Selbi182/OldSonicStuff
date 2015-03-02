; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_LB1qq:	
		dc.w SME_LB1qq_E-SME_LB1qq, SME_LB1qq_14-SME_LB1qq	
		dc.w SME_LB1qq_1A-SME_LB1qq, SME_LB1qq_20-SME_LB1qq	
		dc.w SME_LB1qq_26-SME_LB1qq, SME_LB1qq_31-SME_LB1qq	
		dc.w SME_LB1qq_3C-SME_LB1qq	
SME_LB1qq_E:	dc.b 1	
		dc.b $E0, 5, 0, 0, $F8	
SME_LB1qq_14:	dc.b 1	
		dc.b $E0, 5, 0, 4, $F8	
SME_LB1qq_1A:	dc.b 1	
		dc.b $E0, 1, 0, 8, $FC	
SME_LB1qq_20:	dc.b 1	
		dc.b $E0, 5, 0, $B, $F8	
SME_LB1qq_26:	dc.b 2	
		dc.b $E6, 0, 0, $A, $F8	
		dc.b $E0, 1, 0, 8, 0	
SME_LB1qq_31:	dc.b 2	
		dc.b $E6, 0, 0, $A, $F4	
		dc.b $E0, 5, 0, 4, $FC	
SME_LB1qq_3C:	dc.b 2	
		dc.b $E6, 0, 0, $A, $F4	
		dc.b $E0, 5, 0, 0, $FC	
		even