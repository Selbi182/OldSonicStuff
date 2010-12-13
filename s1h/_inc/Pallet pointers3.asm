; ---------------------------------------------------------------------------
; Pallet pointers
; ---------------------------------------------------------------------------
	dc.l Pal_SegaBG		; pallet address
	dc.w $FB00		; RAM address
	dc.w $1F		; (pallet length / 2) - 1
	dc.l Pal_Title
	dc.w $FB00
	dc.w $1F
	dc.l Pal_LevelSel
	dc.w $FB00
	dc.w $1F
	dc.l Pal_Sonic
	dc.w $FB00
	dc.w 7
	dc.l Pal_GHZ3
	dc.w $FB20
	dc.w $17
	dc.l Pal_Null
	dc.w $FB20
	dc.w $17
	dc.l Pal_Null
	dc.w $FB20
	dc.w $17
	dc.l Pal_Null
	dc.w $FB20
	dc.w $17
	dc.l Pal_Null
	dc.w $FB20
	dc.w $17
	dc.l Pal_Null
	dc.w $FB20
	dc.w $17
	dc.l Pal_Special
	dc.w $FB00
	dc.w $1F
	dc.l Pal_Null
	dc.w $FB00
	dc.w $1F
	dc.l Pal_Null
	dc.w $FB20
	dc.w $17
	dc.l Pal_Null
	dc.w $FB00
	dc.w $1F
	dc.l Pal_FZ
	dc.w $FB20
	dc.w $17
	dc.l Pal_Null
	dc.w $FB00
	dc.w 7
	dc.l Pal_Null
	dc.w $FB00
	dc.w 7
	dc.l Pal_Null
	dc.w $FB00
	dc.w $1F
	dc.l Pal_SpeContinue
	dc.w $FB00
	dc.w $F
	dc.l Pal_Ending
	dc.w $FB00
	dc.w $1F
	dc.l Pal_InfoScreen
	dc.w $FB00
	dc.w $1F