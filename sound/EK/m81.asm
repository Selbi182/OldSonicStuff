; =============================================================================================
; Project Name:		BTOADSSELECT
; Created:		31st March 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

BTOADSSELECT_Header:
;	Voice Pointer	location
	smpsHeaderVoice	BTOADSSELECT_Voices
;	Channel Setup	FM	PSG
	smpsHeaderChan	$06,	$03
;	Tempo Setup	divider	modifier
	smpsHeaderTempo	$01,	$00

;	DAC Pointer	location
	smpsHeaderDAC	BTOADSSELECT_DAC
;	FM1 Pointer	location	pitch		volume
	smpsHeaderFM	BTOADSSELECT_FM1,	smpsPitch01lo,	$08
;	FM2 Pointer	location	pitch		volume
	smpsHeaderFM	BTOADSSELECT_FM2,	smpsPitch01lo,	$09
;	FM3 Pointer	location	pitch		volume
	smpsHeaderFM	BTOADSSELECT_FM3,	smpsPitch01lo,	$08
;	FM4 Pointer	location	pitch		volume
	smpsHeaderFM	BTOADSSELECT_FM4,	smpsPitch01lo,	$09
;	FM5 Pointer	location	pitch		volume
	smpsHeaderFM	BTOADSSELECT_FM5,	smpsPitch01lo,	$10
;	PSG1 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	BTOADSSELECT_PSG1,	smpsPitch01lo,	$08,	$101
;	PSG2 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	BTOADSSELECT_PSG2,	smpsPitch01lo,	$08,	$02
;	PSG3 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	BTOADSSELECT_PSG3,	smpsPitch00,	$05,	$03

; FM1 Data
BTOADSSELECT_FM1:
;	Tempo Modifier	set
	smpsSetTempoMod	$67
	dc.b		$F4
BTOADSSELECT_Jump03:
;	Alter Pitch	value
	smpsAlterPitch	$F4
BTOADSSELECT_Jump01:
;	Set FM Voice	#
	smpsFMvoice	$00
;	Note Fill	duration
	smpsNoteFill	$08
	dc.b		nD5,	$0C,	nA4,	nC5,	nD5,	nE5,	nE5,	nD5
	dc.b		nE5,	nF5,	nD5,	nF5,	nG5,	nF5,	nE5,	nD5
	dc.b		nC5
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump01

; FM2 Data
BTOADSSELECT_FM2:
;	Panning	 	direction	amsfms
	smpsPan		panRight,	$00
;	Set Modulation	wait	speed	change	step
	smpsModSet	$15,	$01,	$03,	$06
BTOADSSELECT_Jump04:
;	Set FM Voice	#
	smpsFMvoice	$07
;	Alter Pitch	value
	smpsAlterPitch	$F4
BTOADSSELECT_Jump02:
;	Note Fill	duration
	smpsNoteFill	$08
	dc.b		nD5,	$0C,	nA4,	nC5,	nD5,	nE5,	nE5,	nD5
	dc.b		nE5,	nF5,	nD5,	nF5,	nG5,	nF5,	nE5,	nD5
	dc.b		nC5
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump02

; FM3 Data
BTOADSSELECT_FM3:
;	Alter Notes	value
	smpsAlterNote	$E9
;	Alter Volume	value
	smpsAlterVol	$12
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump03

; FM4 Data
BTOADSSELECT_FM4:
;	Panning	 	direction	amsfms
	smpsPan		panLeft,	$00
;	Alter Notes	value
	smpsAlterNote	$E9
	dc.b		nRst,	$0C
;	Alter Volume	value
	smpsAlterVol	$12
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump04

; FM5 Data
BTOADSSELECT_FM5:
;	Set FM Voice	#
	smpsFMvoice	$02
	dc.b		nRst,	$30,	nRst,	$30
	smpsStop

; PSG1 Data
BTOADSSELECT_PSG1:
	dc.b		nRst,	$30,	nRst,	$30
	smpsStop

; PSG2 Data
BTOADSSELECT_PSG2:
	dc.b		nRst,	$30,	nRst,	$30
	smpsStop

; PSG3 Data
BTOADSSELECT_PSG3:
;	Set PSG WvForm	#
	smpsPSGform	$E7
;	Set PSG Voice	#
	smpsPSGvoice	$03
;	Note Fill	duration
	smpsNoteFill	$0C
BTOADSSELECT_Jump05:
	dc.b		nAb5,	$18,	nAb5,	nAb5,	nAb5
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump05

; DAC Data
BTOADSSELECT_DAC:
	dc.b		dKick,	$18,	dSnare,	dKick,	dSnare
;	Jump To	 	location
	smpsJump	BTOADSSELECT_DAC
	dc.b		$BF,	$CB,	$06,	$00,	$01,	$00
	smpsStop
	dc.b		$C9,	$00,	$00,	$7D,	$C9
;	Note Fill	duration
	smpsNoteFill	$08
	dc.b		$A2,	$C9,	smpsModOff,	$08,	$CB,	$C9,	smpsModOff,	$08
	dc.b		$DB,	$C9,	smpsModOff,	$08
	smpsFade
	dc.b		$C9,	smpsModOff,	$0E
;	Tempo Modifier	set
	smpsSetTempoMod	$01
	dc.b		$00
;	Set FM Voice	#
	smpsFMvoice	$00
;	Note Fill	duration
	smpsNoteFill	$07
	dc.b		$BF,	$03,	$C0,	$C1,	$06,	$BF,	$BC,	$BF
	dc.b		$0C,	$BC,	$06,	$BA,	$BA,	$03,	$BB,	$BC
	dc.b		$06,	$BA,	$B8,	$BA,	$0C,	$B8,	$06
;	Note Fill	duration
	smpsNoteFill	$00
	dc.b		$B3,	$0C,	$B5,	$12
	smpsStop
BTOADSSELECT_Jump06:
;	Set FM Voice	#
	smpsFMvoice	$07
;	Set Modulation	wait	speed	change	step
	smpsModSet	$15,	$01,	$03,	$06
;	Note Fill	duration
	smpsNoteFill	$07
	dc.b		$CB,	$03,	$CC,	$CD,	$06,	$CB,	$C8,	$CB
	dc.b		$0C,	$C8,	$06,	$C6,	$C6,	$03,	$C7,	$C8
	dc.b		$06,	$C6,	$C4,	$C6,	$0C,	$C4,	$06
;	Panning	 	direction	amsfms
	smpsPan		panLeft,	$00
;	Note Fill	duration
	smpsNoteFill	$00
	dc.b		$BF,	$0C,	$C1,	$12
	smpsStop
BTOADSSELECT_Jump07:
;	Set FM Voice	#
	smpsFMvoice	$07
;	Set Modulation	wait	speed	change	step
	smpsModSet	$15,	$01,	$03,	$06
;	Panning	 	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nRst,	$5A,	$BA,	$0C,	$BC,	$12
	smpsStop
;	Alter Notes	value
	smpsAlterNote	$E9
	dc.b		nRst,	$0C
;	Alter Volume	value
	smpsAlterVol	$12
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump06
;	Alter Notes	value
	smpsAlterNote	$E9
	dc.b		nRst,	$0C
;	Alter Volume	value
	smpsAlterVol	$12
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump07
	dc.b		nRst,	$30,	nRst,	$30
	smpsStop
	dc.b		$84,	$03,	$84,	$84,	$84,	dKick,	$06,	dSnare
	dc.b		dKick,	$0C,	$84,	$06,	dSnare,	$84,	$03,	$84
	dc.b		$84,	$84,	dKick,	$06,	dSnare,	dKick,	$0C,	dSnare
	dc.b		$06,	dSnare,	$0C,	dSnare,	$06
	smpsStop
	dc.b		$BF,	$CB,	$06,	$00,	$01,	$00,	$BA,	$CB
	dc.b		$00,	$00,	$2E,	$CA
;	Note Fill	duration
	smpsNoteFill	$0B
	dc.b		$8C,	$CA,	$00,	$07,	$24,	$CB,	$00,	$07
	dc.b		$99,	$CB,	$00,	$07,	$A2,	$CB,	$00,	$07
;	Tempo Modifier	set
	smpsSetTempoMod	$32
	dc.b		$00
;	Set FM Voice	#
	smpsFMvoice	$07
;	Alter Pitch	value
	smpsAlterPitch	$F4
	dc.b		$C0,	$10,	smpsNoAttack,	$C0,	$10,	smpsNoAttack,	$C0,	$10
	dc.b		smpsNoAttack,	$C0,	$10,	smpsNoAttack,	$C0,	$10,	smpsNoAttack,	$C0
	dc.b		$10,	smpsNoAttack,	$C0,	$10,	smpsNoAttack,	$C0,	$10
;	Set FM Voice	#
	smpsFMvoice	$00
	dc.b		$C5,	$10,	$10,	$10,	$10,	$C9,	$C9,	$C9
	dc.b		$C9,	$CA,	$CA,	$CA,	$CA,	$C3,	$C3,	$C3
	dc.b		$C3,	$C2,	$C2,	$C2,	$C2,	$C2,	$C2,	$C2
	dc.b		$C2
BTOADSSELECT_Jump08:
;	Set FM Voice	#
	smpsFMvoice	$00
	dc.b		$C9,	$C9,	$C9,	$C9,	$C9,	$C9,	$C9,	$C9
	dc.b		$C9,	$C9,	$C9,	$C9,	$C9,	$C9,	$C9,	$C9
	dc.b		$C9,	$C9,	$C9,	$C9,	$C9,	$C9,	$C9,	$C9
	dc.b		$C9,	$C9,	$C9,	$C9,	$C9,	$C9,	$C9,	$C9
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump08
BTOADSSELECT_Jump0B:
;	Set Modulation	wait	speed	change	step
	smpsModSet	$15,	$01,	$03,	$06
;	Set FM Voice	#
	smpsFMvoice	$07
;	Panning	 	direction	amsfms
	smpsPan		panRight,	$00
;	Alter Volume	value
	smpsAlterVol	$09
	dc.b		$B8,	$10,	smpsNoAttack
;	Alter Volume	value
	smpsAlterVol	$FD
	dc.b		$B8,	$10,	smpsNoAttack
;	Alter Volume	value
	smpsAlterVol	$FD
	dc.b		$B8,	$10,	smpsNoAttack
;	Alter Volume	value
	smpsAlterVol	$FD
	dc.b		$B8,	$10,	smpsNoAttack
;	Alter Volume	value
	smpsAlterVol	$FD
	dc.b		$B8,	$10,	smpsNoAttack,	$B8,	$10,	smpsNoAttack,	$B8,	$10
	dc.b		smpsNoAttack,	$B8,	$10
;	Alter Volume	value
	smpsAlterVol	$03
;	Alter Volume	value
	smpsAlterVol	$E9
;	Set FM Voice	#
	smpsFMvoice	$02
	dc.b		nRst,	$08,	$C2,	$10,	$10,	$C4,	$08,	$C2
	dc.b		$C0,	$18,	$BD,	$30,	nRst,	$08,	$C2,	$10
	dc.b		$10,	$C4,	$08,	$C2,	$18,	$10,	$10,	$C3
	dc.b		$08,	$C2,	$10,	$20,	$C9,	$60
;	Alter Volume	value
	smpsAlterVol	$05
;	Alter Pitch	value
	smpsAlterPitch	$F4
BTOADSSELECT_Jump09:
;	Set FM Voice	#
	smpsFMvoice	$06
	dc.b		$B8,	$08,	$B1,	$BD,	$B1,	$B8,	$B1,	$BD
	dc.b		$B1,	$B8,	$B1,	$BD,	$B1,	$B8,	$B1,	$BD
	dc.b		$B1,	$B8,	$B1,	$BD,	$B1,	$B8,	$B1,	$BD
	dc.b		$B1,	$B8,	$B1,	$BD,	$B1,	$B8,	$B1,	$BD
	dc.b		$B1,	$B8,	$B1,	$BD,	$B1,	$B8,	$B1,	$BD
	dc.b		$B1,	$B8,	$B1,	$BD,	$B1,	$B8,	$B1,	$BD
	dc.b		$B1,	$B8,	$B1,	$BD,	$B1,	$B8,	$B1,	$BD
	dc.b		$B1,	$B8,	$B1,	$BD,	$B1,	$B8,	$B1,	$BD
	dc.b		$B1
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump09
;	Set Modulation	wait	speed	change	step
	smpsModSet	$15,	$01,	$03,	$06
;	Set FM Voice	#
	smpsFMvoice	$07
;	Panning	 	direction	amsfms
	smpsPan		panLeft,	$00
;	Call At	 	location
	smpsCall	BTOADSSELECT_Call01
BTOADSSELECT_Jump0A:
;	Call At	 	location
	smpsCall	BTOADSSELECT_Call02
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump0A

BTOADSSELECT_Call01:
;	Alter Volume	value
	smpsAlterVol	$E9
;	Alter Volume	value
	smpsAlterVol	$09
	dc.b		$B3,	$10,	smpsNoAttack
;	Alter Volume	value
	smpsAlterVol	$FD
	dc.b		$B3,	$10,	smpsNoAttack
;	Alter Volume	value
	smpsAlterVol	$FD
	dc.b		$B3,	$10,	smpsNoAttack
;	Alter Volume	value
	smpsAlterVol	$FD
	dc.b		$B3,	$10,	smpsNoAttack
;	Alter Volume	value
	smpsAlterVol	$FD
	dc.b		$B3,	$10,	smpsNoAttack,	$B3,	$10,	smpsNoAttack,	$B3,	$10
	dc.b		smpsNoAttack,	$B3,	$10
;	Alter Volume	value
	smpsAlterVol	$03
;	Set FM Voice	#
	smpsFMvoice	$02
	dc.b		nRst,	$08,	$BD,	$10,	$18,	$08,	$B8,	$18
	dc.b		$30,	nRst,	$08,	$BE,	$10,	$18,	$18,	$BB
	dc.b		$10,	$BB,	$18,	$10,	$BA,	$20,	$C6,	$60
;	Alter Pitch	value
	smpsAlterPitch	$F4
;	Alter Volume	value
	smpsAlterVol	$05
	smpsReturn

BTOADSSELECT_Call02:
;	Set FM Voice	#
	smpsFMvoice	$06
	dc.b		$BD,	$10,	smpsNoAttack,	$FC,	$01,	$BD,	$FE,	$70
	dc.b		smpsNoAttack,	$BA,	$FE,	nRst,	$FC,	$00,	$BD,	$10
	dc.b		smpsNoAttack,	$FC,	$01,	$BD,	$FE,	$70,	smpsNoAttack,	$BA
	dc.b		$FE,	nRst,	$FC,	$00
	smpsReturn
;	Alter Notes	value
	smpsAlterNote	$E9
	dc.b		nRst,	$10
;	Alter Volume	value
	smpsAlterVol	$12
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump0B
;	Alter Notes	value
	smpsAlterNote	$E9
	dc.b		nRst,	$10
;	Alter Volume	value
	smpsAlterVol	$12
;	Set FM Voice	#
	smpsFMvoice	$07
;	Panning	 	direction	amsfms
	smpsPan		panLeft,	$00
;	Call At	 	location
	smpsCall	BTOADSSELECT_Call01
BTOADSSELECT_Jump0C:
;	Call At	 	location
	smpsCall	BTOADSSELECT_Call02
;	Jump To	 	location
	smpsJump	BTOADSSELECT_Jump0C
	dc.b		nRst,	$40,	nRst,	$40
	smpsStop
	dc.b		nRst,	$40,	nRst,	$40
	smpsStop

BTOADSSELECT_Voices:
	dc.b		$03,$08,$00,$01,$00,$1F,$1F,$1F,$1F,$0F,$02,$08,$0D,$04,$00,$00
	dc.b		$00,$CF,$FF,$FF,$FF,$22,$19,$19,$81;			Voice 00
	dc.b		$0E,$42,$00,$21,$00,$17,$1D,$1D,$1D,$05,$0D,$08,$09,$10,$03,$00
	dc.b		$03,$4F,$5F,$AF,$8F,$19,$85,$8C,$80;			Voice 01
	dc.b		$49,$02,$11,$30,$70,$1F,$1F,$1F,$1F,$0C,$09,$09,$0A,$00,$00,$00
	dc.b		$0A,$0F,$0F,$0F,$1F,$20,$1D,$1A,$82;			Voice 02
	dc.b		$3C,$01,$62,$01,$22,$17,$1F,$1F,$1F,$08,$08,$08,$09,$05,$00,$03
	dc.b		$00,$0F,$1B,$1B,$1B,$14,$80,$06,$80;			Voice 03
	dc.b		$49,$04,$10,$30,$70,$1F,$1F,$1F,$1F,$14,$0C,$0A,$0A,$00,$00,$00
	dc.b		$00,$4F,$4F,$AF,$AB,$15,$10,$18,$80;			Voice 04
	dc.b		$28,$05,$14,$32,$70,$1F,$1F,$1F,$1F,$0E,$0E,$0C,$0A,$00,$00,$00
	dc.b		$00,$4F,$4F,$AF,$AB,$1D,$1B,$18,$82;			Voice 05
	dc.b		$24,$01,$02,$04,$41,$1E,$1E,$1E,$1E,$0B,$09,$18,$04,$05,$09,$0C
	dc.b		$02,$2F,$4F,$4F,$4F,$0C,$82,$40,$82;			Voice 06
	dc.b		$24,$01,$01,$00,$70,$1E,$1E,$1E,$1E,$08,$06,$0B,$03,$00,$00,$00
	dc.b		$00,$4F,$4F,$AF,$0F,$08,$84,$16,$84;			Voice 07
	dc.b		$24,$08,$C5,$C5,$10,$80,$20,$F7,$00,$03,$FF,$EF,$F5,$03,$E8,$0A
	dc.b		$80,$20,$80,$18,$C5,$28,$C5,$20,$F7;			Voice 08
	dc.b		$01,$03,$FF,$DE,$E8,$02,$F5,$02,$C5,$10,$C5,$C5,$C5,$F7,$00,$0C
	dc.b		$FF,$F3,$E8,$02,$F5,$02,$C5,$10,$C5;			Voice 09
	dc.b		$C5,$C5,$F7,$00,$0C,$FF,$F3,$C5,$08,$C5,$80,$C5,$C5,$80,$C5,$C5
	dc.b		$80,$40,$C5,$08,$C5,$80,$C5,$C5,$80;			Voice 0A
	dc.b		$C5,$C5,$80,$C5,$08,$C5,$80,$C5,$C5,$C5,$C5,$F7,$00,$04,$FF,$DF
	dc.b		$F6,$FF,$9D,$81,$08,$81,$10,$81,$10;			Voice 0B
	dc.b		$81,$18,$81,$20,$84,$20,$F7,$00,$03,$FF,$F0,$81,$08,$81,$10,$81
	dc.b		$10,$81,$10,$84,$28,$84,$20,$F7,$01;			Voice 0C
	dc.b		$03,$FF,$DF,$81,$08,$81,$08,$82,$10,$81,$08,$81,$08,$82,$10,$F7
	dc.b		$00,$0A,$FF,$F0,$81,$08,$81,$08,$82;			Voice 0D
	dc.b		$10,$81,$08,$81,$08,$82,$10,$81,$08,$81,$08,$82,$10,$81,$08,$81
	dc.b		$08,$82,$10,$81,$08,$81,$08,$82,$10;			Voice 0E
	dc.b		$81,$08,$81,$08,$82,$10,$F7,$00,$08,$FF,$F0,$81,$08,$81,$08,$82
	dc.b		$10,$81,$08,$81,$08,$82,$10,$81,$08;			Voice 0F
	dc.b		$81,$08,$82,$10,$81,$08,$81,$08,$82,$10,$81,$08,$81,$08,$82,$10
	dc.b		$81,$08,$81,$08,$82,$10,$F7,$00,$02;			Voice 10
	dc.b		$FF,$F0,$81,$18,$81,$18,$81,$10,$80,$40,$81,$18,$81,$18,$81,$18
	dc.b		$84,$18,$84,$10,$84,$10,$F7,$00,$04;			Voice 11
	dc.b		$FF,$E8,$F6,$FF,$60,$35,$01,$31,$70,$01,$1F,$1F,$1F,$1F,$0F,$0B
	dc.b		$0B,$0B,$12,$12,$12,$12,$80,$9F,$9F;			Voice 12
	dc.b		$9F,$15,$87,$87,$87,$24,$01,$02,$04,$41,$1E,$1E,$1E,$1E,$0B,$09
	dc.b		$18,$04,$05,$09,$0C,$02,$2F,$4F,$4F;			Voice 13
	dc.b		$4F,$0C,$8A,$40,$8A,$0C,$0A,$01,$38,$72,$1F,$1D,$1F,$1D,$0C,$06
	dc.b		$07,$06,$10,$13,$00,$13,$47,$57,$A7;			Voice 14
	dc.b		$87,$1C,$82,$20,$83,$3C,$01,$62,$01,$22,$17,$1F,$1F,$1F,$08,$08
	dc.b		$08,$09,$05,$00,$03,$00,$0F,$1B,$1B;			Voice 15
	dc.b		$1B,$14,$80,$06,$80,$24,$01,$01,$00,$70,$1E,$1E,$1E,$1E,$08,$0A
	dc.b		$0B,$0B,$00,$48,$00,$48,$4F,$6F,$AF;			Voice 16
	dc.b		$6F,$08,$85,$16,$85,$33,$00,$03,$02,$40,$1E,$1E,$1E,$1E,$04,$07
	dc.b		$08,$04,$05,$09,$0C,$02,$2F,$4F,$4F;			Voice 17
	dc.b		$4F,$1B,$1A,$14,$83,$38,$04,$12,$30,$71,$1F,$1F,$1F,$1F,$0E,$0E
	dc.b		$0C,$0A,$00,$00,$00,$00,$4F,$4F,$AF;			Voice 18
	dc.b		$AB,$14,$1B,$18,$8A,$37;			Voice 19
	even
