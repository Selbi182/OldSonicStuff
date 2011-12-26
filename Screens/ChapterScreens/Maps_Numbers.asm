; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_a3rPT:	
		dc.w SME_a3rPT_C-SME_a3rPT, SME_a3rPT_12-SME_a3rPT	
		dc.w SME_a3rPT_1D-SME_a3rPT, SME_a3rPT_2D-SME_a3rPT	
		dc.w SME_a3rPT_38-SME_a3rPT, SME_a3rPT_3E-SME_a3rPT	
		dc.w SME_a3rPT_49-SME_a3rPT
SME_a3rPT_C:	dc.b 1	
		dc.b $E0, 6, 0, 0, $F8	
SME_a3rPT_12:	dc.b 2	
		dc.b $E0, 6, 0, 0, $F0	
		dc.b $E0, 6, 0, 0, 0	
SME_a3rPT_1D:	dc.b 3	
		dc.b $E0, 6, 0, 0, $E8	
		dc.b $E0, 6, 0, 0, $F8	
		dc.b $E0, 6, 0, 0, 8	
SME_a3rPT_2D:	dc.b 2	
		dc.b $E0, $E, 0, 0, $EA	
		dc.b $E0, 2, 0, $C, $A	
SME_a3rPT_38:	dc.b 1	
		dc.b $E0, $A, 0, 6, $F2	
SME_a3rPT_3E:	dc.b 2	
		dc.b $E0, $A, 0, 6, $EA	
		dc.b $E0, 6, 0, 0, 6	
SME_a3rPT_49:	dc.b 2	
		dc.b $E0, $A, 0, 6, $E2	
		dc.b $E0, 6, 0, 0, $FE	
		dc.b $E0, 6, 0, 0, 8	
		even