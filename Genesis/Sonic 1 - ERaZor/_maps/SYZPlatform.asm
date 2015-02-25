; --------------------------------------------------------------------------------
; Sprite mappings - output from SonMapEd - Sonic 1 format
; --------------------------------------------------------------------------------

SME_MdbHX:	
		dc.w SME_MdbHX_6-SME_MdbHX, SME_MdbHX_11-SME_MdbHX	
		dc.w SME_MdbHX_21-SME_MdbHX	
SME_MdbHX_6:	dc.b 2	
		dc.b $F8, $F, 0, 0, $E0	
		dc.b $F8, $F, 0, $10, 0	
SME_MdbHX_11:	dc.b 3	
		dc.b $BE, 6, 0, $20, $F8	
		dc.b $C2, 6, 0, $20, $E0	
		dc.b $C2, 6, 0, $20, $10	
SME_MdbHX_21:	dc.b 3	
		dc.b $F4, 6, 0, $20, $F8	
		dc.b $F8, 6, 0, $20, $E0	
		dc.b $F8, 6, 0, $20, $10	
		even