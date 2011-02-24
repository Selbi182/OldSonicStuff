; =============================================================================================
; Project Name:		BTOADS
; Created:		31st March 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

btoadsSURFCITY_Header:
;	Voice Pointer	location
	smpsHeaderVoice	btoadsSURFCITY_Voices
;	Channel Setup	FM	PSG
	smpsHeaderChan	$06,	$03
;	Tempo Setup	divider	modifier
	smpsHeaderTempo	$01,	$0C

;	DAC Pointer	location
	smpsHeaderDAC	btoadsSURFCITY_DAC
;	FM1 Pointer	location	pitch		volume
	smpsHeaderFM	btoadsSURFCITY_FM1,	smpsPitch02lo,	$06
;	FM2 Pointer	location	pitch		volume
	smpsHeaderFM	btoadsSURFCITY_FM2,	smpsPitch00,	$07
;	FM3 Pointer	location	pitch		volume
	smpsHeaderFM	btoadsSURFCITY_FM3,	smpsPitch00,	$07
;	FM4 Pointer	location	pitch		volume
	smpsHeaderFM	btoadsSURFCITY_FM4,	smpsPitch00,	$07
;	FM5 Pointer	location	pitch		volume
	smpsHeaderFM	btoadsSURFCITY_FM5,	smpsPitch00,	$07
;	PSG1 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	btoadsSURFCITY_PSG1,	smpsPitch00+$0B,	$08,	$101
;	PSG2 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	btoadsSURFCITY_PSG2,	smpsPitch00+$0B,	$08,	$02
;	PSG3 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	btoadsSURFCITY_PSG3,	smpsPitch00,	$03,	$03

; FM1 Data
btoadsSURFCITY_FM1:
;	Set FM Voice	#
	smpsFMvoice	$00
;	Tempo Modifier	set
	smpsSetTempoMod	$41
	dc.b		$F4
btoadsSURFCITY_Jump01:
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call01
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call01
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call02
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call01
	dc.b		nBb5,	$0E,	$07,	$07,	$0E,	$07,	nAb5,	$31
	dc.b		nD6,	$07,	$07,	nRst,	$38,	nRst,	$38,	nRst
	dc.b		$38,	nRst,	$38
btoadsSURFCITY_Loop01:
	dc.b		nC6,	$07,	$0E,	$0E,	$0E,	$07,	$07,	$0E
	dc.b		$0E,	$0E,	$07
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$02,	btoadsSURFCITY_Loop01
btoadsSURFCITY_Loop02:
	dc.b		nC6,	$07,	nBb5,	nG5,	nC6,	$0E,	$0E,	$07
	dc.b		$07,	nBb5,	nG5,	nC6,	$0E,	$07,	nEb6,	nF6
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$04,	btoadsSURFCITY_Loop02
btoadsSURFCITY_Loop03:
	dc.b		nC5,	$07,	nC5,	nC5,	nC5
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$08,	btoadsSURFCITY_Loop03
btoadsSURFCITY_Loop04:
	dc.b		nBb5,	$07,	nBb5,	nBb5,	nBb5
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$04,	btoadsSURFCITY_Loop04
btoadsSURFCITY_Loop05:
	dc.b		nAb5,	$07,	nAb5,	nAb5,	nAb5
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$04,	btoadsSURFCITY_Loop05
btoadsSURFCITY_Loop06:
	dc.b		nC5,	$07,	nC5,	nC5,	nC5
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$08,	btoadsSURFCITY_Loop06
btoadsSURFCITY_Loop07:
	dc.b		nBb5,	$07,	nBb5,	nBb5,	nBb5
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$04,	btoadsSURFCITY_Loop07
btoadsSURFCITY_Loop08:
	dc.b		nAb5,	nAb5,	nAb5,	nAb5
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$04,	btoadsSURFCITY_Loop08
btoadsSURFCITY_Loop09:
	dc.b		nC5,	$0E,	$07,	$07,	nG5,	nBb5,	$0E,	nC6
	dc.b		nC6,	$07,	nBb5,	$0E,	nF5,	$07,	nG5,	nEb5
	dc.b		nF5
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$04,	btoadsSURFCITY_Loop09
;	Jump To	 	location
	smpsJump	btoadsSURFCITY_Jump01

btoadsSURFCITY_Call01:
	dc.b		nC5,	$0E,	$07,	$07,	nEb5,	nF5,	$0E,	nG5
	dc.b		nG5,	$07,	nF5,	$0E,	nEb5,	$07,	nF5,	$15
	dc.b		nC5,	$2A,	$07,	$0E,	$07,	$0E,	$07,	$15
	smpsReturn

btoadsSURFCITY_Call02:
	dc.b		nF5,	$0E,	$07,	$07,	nAb5,	nBb5,	$0E,	nC6
	dc.b		nC6,	$07,	nBb5,	$0E,	nAb5,	$07,	nBb5,	$15
	dc.b		nF5,	$2A,	$07,	$0E,	$07,	$0E,	$07,	$15
	smpsReturn

; FM2 Data
btoadsSURFCITY_FM2:
;	Set FM Voice	#
	smpsFMvoice	$01
;	Set Modulation	wait	speed	change	step
	smpsModSet	$18,	$01,	$02,	$06
;	Panning	 	direction	amsfms
	smpsPan		panRight,	$00
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call03
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call03
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call04
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call03
;	Set FM Voice	#
	smpsFMvoice	$02
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		nBb4,	$07,	nRst,	$07,	nBb4,	$07,	$07
;	Alter Pitch	value
	smpsAlterPitch	$0C
	dc.b		nF5,	$15,	nEb5,	$07,	nRst,	$0E
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		nEb5,	$07,	nRst,	nEb5,	nRst,	nF5,	$07,	$07
;	Alter Pitch	value
	smpsAlterPitch	$0C
;	Alter Pitch	value
	smpsAlterPitch	$0C
;	Panning	 	direction	amsfms
	smpsPan		panCentre,	$00
btoadsSURFCITY_Loop0A:
;	Set FM Voice	#
	smpsFMvoice	$01
	dc.b		nG4,	$07,	nC5,	nD5,	nEb5,	nG5,	nEb5,	nD5
	dc.b		nEb5,	nAb4,	nC5,	nD5,	nEb5,	nG5,	nEb5,	nD5
	dc.b		nEb5,	nBb4,	nC5,	nD5,	nEb5,	nG5,	nEb5,	nD5
	dc.b		nEb5,	nAb4,	nC5,	nD5,	nEb5,	nG5,	nEb5,	nD5
	dc.b		nEb5,	nG4,	nC5,	nD5,	nEb5,	nG5,	nEb5,	nD5
	dc.b		nEb5,	nAb4,	nC5,	nD5,	nEb5,	nG5,	nEb5,	nD5
	dc.b		nEb5,	nBb4,	nC5,	nD5,	nEb5,	nG5,	nEb5,	nD5
	dc.b		nEb5,	nAb4,	nC5,	nD5,	nEb5,	nG5,	nEb5,	nD5
	dc.b		nEb5
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$02,	btoadsSURFCITY_Loop0A
;	Alter Pitch	value
	smpsAlterPitch	$F4
;	Alter Pitch	value
	smpsAlterPitch	$F4
;	Panning	 	direction	amsfms
	smpsPan		panRight,	$00
btoadsSURFCITY_Loop0B:
;	Set FM Voice	#
	smpsFMvoice	$05
	dc.b		nC4,	$0E,	$07,	$07,	nEb5,	nF5,	nC4,	nG5
	dc.b		$0E,	$07,	nF5,	$0E,	nEb5,	$07,	nF5,	nC4
	dc.b		$0E,	$0E,	nC6,	nBb5,	nC4,	$07,	nG5,	$0E
	dc.b		$07,	nF5,	$0E,	nEb5,	$07,	nF5,	nC4,	$0E
	dc.b		nBb4,	nBb4,	$07,	$07,	nEb5,	nF5,	$0E,	nG5
	dc.b		nG5,	$07,	nF5,	$0E,	nEb5,	$07,	nF5,	nBb4
	dc.b		$0E,	nAb4,	nC6,	nBb5,	nAb4,	$07,	nG5,	$0E
	dc.b		$07,	nF5,	$0E,	nEb5,	$07,	nF5,	nAb4,	$0E
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$02,	btoadsSURFCITY_Loop0B
;	Alter Pitch	value
	smpsAlterPitch	$0C
btoadsSURFCITY_Loop0C:
;	Panning	 	direction	amsfms
	smpsPan		panCentre,	$00
;	Set FM Voice	#
	smpsFMvoice	$04
	dc.b		nC4,	$07,	nRst,	nC4,	$07,	$07,	nG4,	nBb4
	dc.b		$07,	nRst,	nC5,	nRst,	nC5,	$07,	nBb4,	nRst
	dc.b		nF4,	$07,	nG4,	nEb4,	nF4
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$04,	btoadsSURFCITY_Loop0C
;	Panning	 	direction	amsfms
	smpsPan		panRight,	$00
;	Jump To	 	location
	smpsJump	btoadsSURFCITY_FM2

btoadsSURFCITY_Call03:
;	Note Fill	duration
	smpsNoteFill	$04
;	Set FM Voice	#
	smpsFMvoice	$03
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		nC6,	$07,	$07,	$07,	$07,	$07,	$07,	$07
	dc.b		$07,	$07,	$07,	$07,	$07,	$07,	$07,	$07
	dc.b		$07,	$07,	$07,	$07,	$07
;	Alter Pitch	value
	smpsAlterPitch	$0C
;	Note Fill	duration
	smpsNoteFill	$00
;	Set FM Voice	#
	smpsFMvoice	$02
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		nEb5,	$38,	$07,	$07,	nRst,	$0E
;	Alter Pitch	value
	smpsAlterPitch	$0C
;	Set FM Voice	#
	smpsFMvoice	$01
	smpsReturn

btoadsSURFCITY_Call04:
;	Note Fill	duration
	smpsNoteFill	$04
;	Set FM Voice	#
	smpsFMvoice	$03
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		nF6,	$07,	nF6,	nF6,	nF6,	nF6,	nF6,	nF6
	dc.b		nF6,	nF6,	nF6,	nF6,	nF6,	nF6,	nF6,	nF6
	dc.b		nF6,	nF6,	nF6,	nF6,	nF6
;	Alter Pitch	value
	smpsAlterPitch	$0C
;	Note Fill	duration
	smpsNoteFill	$00
;	Set FM Voice	#
	smpsFMvoice	$02
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		nAb5,	$38,	$07,	$07,	nRst,	$0E
;	Alter Pitch	value
	smpsAlterPitch	$0C
;	Set FM Voice	#
	smpsFMvoice	$01
	smpsReturn

; FM3 Data
btoadsSURFCITY_FM3:
;	Set FM Voice	#
	smpsFMvoice	$02
;	Set Modulation	wait	speed	change	step
	smpsModSet	$18,	$01,	$02,	$06
;	Panning	 	direction	amsfms
	smpsPan		panLeft,	$00
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call05
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call05
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call06
;	Call At	 	location
	smpsCall	btoadsSURFCITY_Call05
	dc.b		nRst,	$1C,	nD5,	$15,	nC5,	$07,	nRst,	$38
	dc.b		nRst,	$38,	nRst,	$38,	nRst,	$38,	nRst,	$38
	dc.b		nRst,	$38,	nRst,	$38,	nRst,	$38,	nRst,	$38
	dc.b		nRst,	$38,	nRst,	$38,	nRst,	$38,	nRst,	$38
	dc.b		nRst,	$38,	nRst,	$38,	nRst,	$38,	nRst,	$38
;	Alter Pitch	value
	smpsAlterPitch	$F4
btoadsSURFCITY_Loop0D:
;	Set FM Voice	#
	smpsFMvoice	$05
	dc.b		nG3,	$0E,	$07,	$07,	nC5,	nD5,	nG3,	nEb5
	dc.b		$0E,	$07,	nD5,	$0E,	nC5,	$07,	nD5,	nG3
	dc.b		$0E,	$0E,	nG5,	nG5,	nG3,	$07,	nEb5,	$0E
	dc.b		$07,	nD5,	$0E,	nC5,	$07,	nD5,	nG3,	$0E
	dc.b		nF4,	nF4,	$07,	$07,	nC5,	nD5,	nF4,	nEb5
	dc.b		$0E,	$07,	nD5,	$0E,	nC5,	$07,	nD5,	nF4
	dc.b		$0E,	nEb4,	nG5,	nG5,	nEb4,	$07,	nEb5,	$0E
	dc.b		$07,	nD5,	$0E,	nC5,	$07,	nD5,	nEb4,	$0E
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$02,	btoadsSURFCITY_Loop0D
;	Alter Pitch	value
	smpsAlterPitch	$0C
	dc.b		nRst,	$38,	nRst,	$38,	nRst,	$38,	nRst,	$38
	dc.b		nRst,	$38,	nRst,	$38,	nRst,	$38,	nRst,	$38
;	Set FM Voice	#
	smpsFMvoice	$02
;	Jump To	 	location
	smpsJump	btoadsSURFCITY_FM3

btoadsSURFCITY_Call05:
;	Panning	 	direction	amsfms
	smpsPan		panCentre,	$00
;	Set FM Voice	#
	smpsFMvoice	$04
	dc.b		nC4,	$07,	nRst,	$07,	nC4,	$07,	nC4,	nEb4
	dc.b		nF4,	$07,	nRst,	nG4,	nRst,	nG4,	$07,	nF4
	dc.b		$07,	nRst,	nEb4,	$07,	nF4,	$07,	nRst,	$0E
	dc.b		nC4,	$07,	nRst,	$15
;	Panning	 	direction	amsfms
	smpsPan		panLeft,	$00
;	Set FM Voice	#
	smpsFMvoice	$02
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		nBb4,	$38,	$07,	$07,	nRst,	$0E
;	Alter Pitch	value
	smpsAlterPitch	$0C
	smpsReturn

btoadsSURFCITY_Call06:
;	Panning	 	direction	amsfms
	smpsPan		panCentre,	$00
;	Set FM Voice	#
	smpsFMvoice	$04
	dc.b		nF4,	$07,	nRst,	$07,	nF4,	$07,	nF4,	nAb4
	dc.b		nBb4,	$07,	nRst,	nC5,	nRst,	nC5,	$07,	nBb4
	dc.b		$07,	nRst,	nAb4,	$07,	nBb4,	$07,	nRst,	$0E
	dc.b		nF4,	$07,	nRst,	$15
;	Panning	 	direction	amsfms
	smpsPan		panLeft,	$00
;	Set FM Voice	#
	smpsFMvoice	$02
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		nEb5,	$38,	$07,	$07,	nRst,	$0E
;	Alter Pitch	value
	smpsAlterPitch	$0C
	smpsReturn

; FM4 Data
btoadsSURFCITY_FM4:
;	Set FM Voice	#
	smpsFMvoice	$01
;	Panning	 	direction	amsfms
	smpsPan		panRight,	$00
;	Alter Notes	value
	smpsAlterNote	$E9
	dc.b		nRst,	$0E
;	Alter Volume	value
	smpsAlterVol	$13
;	Jump To	 	location
	smpsJump	btoadsSURFCITY_FM2

; FM5 Data
btoadsSURFCITY_FM5:
;	Set FM Voice	#
	smpsFMvoice	$02
;	Panning	 	direction	amsfms
	smpsPan		panLeft,	$00
;	Alter Notes	value
	smpsAlterNote	$E9
	dc.b		nRst,	$0E
;	Alter Volume	value
	smpsAlterVol	$13
;	Jump To	 	location
	smpsJump	btoadsSURFCITY_FM3

; PSG1 Data
btoadsSURFCITY_PSG1:
	dc.b		nRst,	$38,	nRst,	$38

; PSG2 Data
btoadsSURFCITY_PSG2:
	dc.b		nRst,	$38,	nRst,	$38
	smpsStop

; PSG3 Data
btoadsSURFCITY_PSG3:
;	Set PSG WvForm	#
	smpsPSGform	$E7
;	Note Fill	duration
	smpsNoteFill	$02
;	Set PSG Voice	#
	smpsPSGvoice	$02
btoadsSURFCITY_Loop0E:
	dc.b		nAb5,	$07
;	Set Volume	value
	smpsSetVol	$02
	dc.b		nAb5
;	Set Volume	value
	smpsSetVol	$01
	dc.b		nAb5,	nAb5,	nAb5,	nAb5,	nAb5,	nAb5
;	Set Volume	value
	smpsSetVol	$FD
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$10,	btoadsSURFCITY_Loop0E
;	Jump To	 	location
	smpsJump	btoadsSURFCITY_Loop0E

; DAC Data
btoadsSURFCITY_DAC:
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$84,	$15,	dKick
	dc.b		$0E,	dKick,	$07,	dKick,	$0E,	$84,	$07,	dKick
	dc.b		$15,	dKick,	$1C,	$84,	$0E,	dKick,	$07,	dKick
	dc.b		$0E,	dKick,	$07,	dKick,	$0E,	dSnare,	$07,	dSnare
	dc.b		$15
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$04,	btoadsSURFCITY_DAC
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$84,	$15,	dKick
	dc.b		$15,	$84,	$0E,	$84,	$0E,	dSnare,	$07,	dSnare
btoadsSURFCITY_Loop0F:
	dc.b		nRst,	$38,	nRst,	$38
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$02,	btoadsSURFCITY_Loop0F
btoadsSURFCITY_Loop10:
	dc.b		$85,	$07,	dKick,	$0E,	dKick,	$0E,	dKick,	$0E
	dc.b		dKick,	$07,	$84,	$07,	dKick,	$0E,	dKick,	$0E
	dc.b		dKick,	$0E,	dKick,	$07
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$02,	btoadsSURFCITY_Loop10
btoadsSURFCITY_Loop11:
	dc.b		$85,	$07,	$85,	$07,	$84,	$07,	dKick,	$0E
	dc.b		dKick,	$0E,	dKick,	$07,	$84,	$07,	$84,	$07
	dc.b		dTimpani,	$07,	dKick,	$0E,	dKick,	$0E,	dKick,	$07
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$02,	btoadsSURFCITY_Loop11
	dc.b		$85,	$07,	$85,	$07,	$84,	$07,	dKick,	$07
	dc.b		$84,	$07,	dKick,	$07,	$84,	$07,	$84,	$07
	dc.b		$84,	$07,	$84,	$07,	dTimpani,	$07,	dKick,	$07
	dc.b		dTimpani,	$07,	dKick,	$07,	dTimpani,	$07,	dTimpani,	$07
	dc.b		$85,	$07,	$85,	$07,	$84,	$07,	dKick,	$07
	dc.b		$84,	$07,	dKick,	$07,	$84,	$07,	$84,	$07
	dc.b		dSnare,	$07,	dSnare,	$07,	$85,	$07,	$85,	$07
	dc.b		$84,	$07,	$84,	$07,	dTimpani,	$07,	dTimpani,	$07
btoadsSURFCITY_Loop12:
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$07,	dSnare,	$15
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$0E,	dSnare,	$07
	dc.b		dKick,	$15,	dKick,	$0E,	dKick,	$07,	dKick,	$07
	dc.b		dSnare,	$15,	dKick,	$0E,	dKick,	$07,	dKick,	$0E
	dc.b		dSnare,	$07,	dKick,	$0E,	dKick,	$07
;	Loop To	 	index	loops	location
	smpsLoop	$00,	$03,	btoadsSURFCITY_Loop12
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$07,	dSnare,	$15
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$0E,	dSnare,	$07
	dc.b		dKick,	$15,	dKick,	$0E,	dKick,	$07,	dKick,	$07
	dc.b		dSnare,	$15,	dKick,	$0E,	dKick,	$07,	dKick,	$0E
	dc.b		dSnare,	$07,	dSnare,	$0E,	dSnare,	$07,	dKick,	$0E
	dc.b		dKick,	$07,	dKick,	$07,	$84,	$07,	$84,	$0E
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$0E,	$85,	$07
	dc.b		$85,	$07,	$84,	$07,	$84,	$07,	dKick,	$0E
	dc.b		dKick,	$07,	dKick,	$07,	$84,	$07,	$84,	$0E
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$0E,	$85,	$07
	dc.b		$85,	$07,	dTimpani,	$07,	dTimpani,	$07,	dKick,	$0E
	dc.b		dKick,	$07,	dKick,	$07,	$84,	$07,	$84,	$0E
	dc.b		dKick,	$0E,	dKick,	$07,	dKick,	$0E,	$85,	$07
	dc.b		$85,	$07,	$84,	$07,	$84,	$07,	dKick,	$0E
	dc.b		dKick,	$07,	dKick,	$07,	dSnare,	$07,	dSnare,	$0E
	dc.b		dSnare,	$07,	dKick,	$07,	$85,	$07,	$85,	$07
	dc.b		$85,	$07,	$84,	$07,	$84,	$07,	dTimpani,	$07
	dc.b		dTimpani,	$07
;	Jump To	 	location
	smpsJump	btoadsSURFCITY_DAC

btoadsSURFCITY_Voices:
	dc.b		$35,$01,$31,$70,$00,$1F,$1F,$1F,$1F,$10,$0B,$0B,$0B,$12,$12,$12
	dc.b		$12,$80,$9F,$9F,$9F,$14,$8B,$8B,$8B;			Voice 00
	dc.b		$24,$00,$01,$02,$40,$1E,$1E,$1E,$1E,$0B,$09,$18,$04,$05,$09,$0C
	dc.b		$02,$2F,$4F,$4F,$4F,$0C,$8A,$40,$8C;			Voice 01
	dc.b		$3D,$01,$62,$03,$21,$30,$1F,$13,$26,$08,$08,$08,$03,$05,$00,$03
	dc.b		$00,$0F,$1B,$1B,$1B,$1A,$85,$86,$89;			Voice 02
	dc.b		$39,$05,$12,$31,$71,$1F,$1F,$1F,$1F,$0C,$09,$09,$0F,$00,$00,$00
	dc.b		$13,$0F,$0F,$0F,$1F,$1D,$1D,$1A,$80;			Voice 03
	dc.b		$49,$04,$10,$30,$70,$1F,$1F,$1F,$1F,$14,$0C,$0A,$0A,$00,$00,$00
	dc.b		$00,$4F,$4F,$AF,$AB,$15,$10,$18,$88;			Voice 04
	dc.b		$0C,$0A,$01,$38,$72,$1F,$1D,$1F,$1D,$0C,$0B,$07,$0A,$10,$15,$00
	dc.b		$15,$47,$5F,$AF,$8F,$1C,$85,$20,$87;			Voice 05
	dc.b		$36;			Voice 06
	even
