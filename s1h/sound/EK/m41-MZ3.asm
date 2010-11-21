; =============================================================================================
; Project Name:		M41_SBZ2song2
; Created:		12nd February 2010
; ---------------------------------------------------------------------------------------------
; ASM'd using S1SMPS2ASM version 1.1 by Marc Gordon (AKA Cinossu)
; =============================================================================================

M41_SBZ2song2_Header:
;	Voice Pointer	location
	smpsHeaderVoice	M41_SBZ2song2_Voices
;	Channel Setup	FM	PSG
	smpsHeaderChan	$06,	$03
;	Tempo Setup	divider	modifier
	smpsHeaderTempo	$02,	$09

;	DAC Pointer	location
	smpsHeaderDAC	M41_SBZ2song2_DAC
;	FM1 Pointer	location	pitch		volume
	smpsHeaderFM	M41_SBZ2song2_FM1,	smpsPitch01lo,	$11
;	FM2 Pointer	location	pitch		volume
	smpsHeaderFM	M41_SBZ2song2_FM2,	smpsPitch00,	$10
;	FM3 Pointer	location	pitch		volume
	smpsHeaderFM	M41_SBZ2song2_FM3,	smpsPitch01lo,	$08
;	FM4 Pointer	location	pitch		volume
	smpsHeaderFM	M41_SBZ2song2_FM4,	smpsPitch00,	$0E
;	FM5 Pointer	location	pitch		volume
	smpsHeaderFM	M41_SBZ2song2_FM5,	smpsPitch00,	$40;$10
;	PSG1 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	M41_SBZ2song2_PSG1,	smpsPitch03lo,	$00,	$00
;	PSG2 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	M41_SBZ2song2_PSG2,	smpsPitch03lo,	$00,	$00
;	PSG3 Pointer	location	pitch		volume	instrument
	smpsHeaderPSG	M41_SBZ2song2_PSG3,	smpsPitch02hi+$0B,	$01,	$00

; FM1 Data
M41_SBZ2song2_FM1:
	dc.b		nRst,	$0C
;SetModulation	wait	speed	change	step
	smpsModSet	$00,	$01,	$06,	$04
M41_SBZ2song2_Jump01:
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nE5,	$08,	nB5,	$04,	nE6,	$0C,	nD6,	$08
	dc.b		nCs6,	$14,	nA5,	$04,	nB5,	nCs6,	nB5,	$16
	dc.b		nRst,	$02,	nBb5,	$01,	nB5,	$07,	nA5,	$08
	dc.b		nE5,	$04,	nD6,	$0C,	nCs6,	$08,	nB5,	$0C
	dc.b		nD5,	nBb5,	$01,	nB5,	$03,	nA5,	$10,	nG5
	dc.b		$0C,	nFs5,	$08,	nE5,	$20,	nE6,	$04,	$08
	dc.b		$0C,	nD6,	$08,	nE5,	nB5,	$04,	nE6,	$0C
	dc.b		nD6,	$08,	nCs6,	$14,	nA5,	$04,	nB5,	nCs6
	dc.b		nB5,	$16,	nRst,	$02,	nBb5,	$01,	nB5,	$07
	dc.b		nA5,	$08,	nE5,	$04,	nD6,	$0C,	nCs6,	$08
	dc.b		nB5,	$0C,	nD5,	nBb5,	$01,	nB5,	$03,	nA5
	dc.b		$10,	nG5,	$0C,	nFs5,	$04,	nE5,	$30,	nRst
	dc.b		$04,	nB4,	nCs5,	nD5,	nE5,	$14,	nD5,	$04
	dc.b		nCs5,	nRst,	nD5,	nRst
;	Set?FM?Voice	#
	smpsFMvoice	$01
	dc.b		nE6,	nD6,	nG6,	nRst
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nD5,	nE5,	nD5,	nRst,	nD5,	nRst,	$08,	nE5
	dc.b		nD5,	$04,	nA4,	$1C,	nRst,	$08,	nD5,	$10
	dc.b		$04,	nC5,	$04,	nBb4,	nC5,	$14,	nA4,	$04
	dc.b		nG4,	nF4,	nG4,	$32,	nRst,	$0A,	$08,	nE5
	dc.b		$10,	nD5,	$04,	nCs5,	nRst,	nD5,	nRst
;	Set?FM?Voice	#
	smpsFMvoice	$01
	dc.b		nE6,	nD6,	nG6,	nRst
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nD5,	nE5,	nD5,	nRst,	nD5,	nRst,	$08,	nE5
	dc.b		nD5,	$04,	nA4,	$1C,	nRst,	$08,	nD5,	$10
	dc.b		$04,	nC5,	$04,	nBb4,	nC5,	$14,	nA4,	$04
	dc.b		nG4,	nF4,	nA4,	$32,	nRst,	$02,	$04,	nA4
	dc.b		$0C,	nD5,	$08,	nA4,	$04,	nD5,	$08,	nE5
	dc.b		nF5,	$18,	nD5,	$04,	nE5,	nF5,	$0C,	nD5
	dc.b		$08,	nF5,	nG5,	nAb5,	$01,	nA5,	$0B,	nG5
	dc.b		$14,	nAb5,	$01,	nA5,	$0B,	nG5,	$0C,	nD5
	dc.b		$08,	nAb5,	$01,	nA5,	$07,	nG5,	$08,	nF5
	dc.b		nE5,	nD5,	$30,	nRst,	$08,	nCs5,	nD5,	nA4
	dc.b		$04,	nD5,	$08,	nE5,	nF5,	$18,	nD5,	$04
	dc.b		nE5,	nF5,	$0C,	nD5,	$08,	nF5,	nG5,	nAb5
	dc.b		$01,	nA5,	$0B,	nG5,	$14,	nAb5,	$01,	nA5
	dc.b		$0B,	nG5,	$0C,	nD5,	$08,	nAb5,	$01,	nA5
	dc.b		$07,	nG5,	$08,	nF5,	nE5,	nD5,	$30,	nRst
	dc.b		$04,	nEb5,	$0C
;	Jump?To	?	location
	smpsJump	M41_SBZ2song2_Jump01

; FM2 Data
M41_SBZ2song2_FM2:
	dc.b		nRst,	$0C
M41_SBZ2song2_Jump02:
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$01
	dc.b		nE4,	$04
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nG4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nB4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nG4,	nE4,	nE5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nCs5
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nCs5
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nA4,	nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nCs5,	nE5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE4,	nG4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nB4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nG4,	nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE4,	nCs5
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA4,	nCs5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nCs5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD4,	nG4,	nD4,	nB4,	nG4,	nD4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD5
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nCs5,	nE4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nCs5
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE4,	nA4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC5
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nG4,	nC4,	nC5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nG4,	nC4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nC5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nG4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nC5,	nC5,	$08
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		$0C,	nA4,	$08
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$01
	dc.b		nE4,	$04,	nG4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4,	nB4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nG4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE5,	nE4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nCs5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nCs5,	nA4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4,	nCs5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE5
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nG4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nB4,	nG4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE5,	nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nCs5,	nE4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA4,	nCs5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA4,	nE4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nCs5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE5,	nD4,	nG4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nB4,	nG4,	nD4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD4,	nCs5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA4,	nCs5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE4
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4,	$08
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$01
	dc.b		nE5,	$04
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD6,	nE5,	nE6,	nE5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nCs6
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD6,	nE5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE6
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nG4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nB4,	$14,	$04
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA4,	$04,	nRst,	nB4,	nRst
;	Set?FM?Voice	#
	smpsFMvoice	$01
	dc.b		nE4,	$02
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		$02,	nD4,	$02
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		$02
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nG4,	$02
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		$02
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nD4,	$04
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nG3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nB3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nB3,	nA3,	$08,	nRst,	$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA3,	$08
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nB3,	$04
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nA3,	$10,	nFs3,	$08,	nE3,	$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD3,	$08,	nBb3,	$14
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nC4,	$04,	nBb3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nF4,	$14
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4,	$08
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD4,	$04,	nC4,	$10
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nG3,	$0C
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nC3,	$04,	nE3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nC3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nG3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nC3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE3,	$02
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nG3,	nC4,	nE4,	nB4,	$10,	$04
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA4,	$04,	nRst,	nB4,	nRst
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$01
	dc.b		nE4,	$02
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		$02,	nD4,	$02
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		$02
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nG4,	$02,	$02
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nD4,	$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nG3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nB3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nB3,	nA3,	$08,	nRst,	$04,	nA3,	$08,	nB3
	dc.b		$04
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA3,	$10
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nFs3,	$08
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE3,	$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD3,	$08,	nBb3,	$14
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC4,	$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nBb3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nF4,	$14
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4,	$04,	nD4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nCs4,	$10
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nA3,	$0C,	nE3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nCs3,	$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA3,	nCs3,	nE3,	$02
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nCs4,	$04,	nE4,	$02
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA4,	nCs5
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE5
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$01
	dc.b		nD3,	$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA2
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nF3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nG3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nF3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE3,	nF3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD3,	$08
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		$08
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nF3,	$04
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nA3,	nD4,	nA3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nF4,	nE4,	nD4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nB4,	$01
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nC5,	$0B
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nB4,	$0C
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nG4,	$04
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD4,	nF3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD4,	nG4,	nD4,	nRst
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nBb3,	nA3,	nD3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nG3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC4,	nG3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nC4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nB2
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD3,	nF3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nB3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nF3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nB3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nF4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nB3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD4,	nF4,	nB4,	nF4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE5,	$02
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nCs5
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD3,	$04
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA2,	nD3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nF3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA3,	nG3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nF3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nE3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nF3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD3,	$08
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		$08
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		$04,	nF3,	$04,	nA3,	nD4,	nA3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nC4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nD4,	nF4,	nE4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nA4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nB4,	$01
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC5,	$0B
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nB4,	$0C,	nG4,	$04,	nD4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nF3,	nD4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nG4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD4,	nRst
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nBb3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nA3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nD3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nC3,	nD3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nG3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nC4,	nG3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nC4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nE4
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nB2,	nD3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nF3
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nB3,	nF3
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		nB3,	nD4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nF4,	nB3
;	Panning	?	direction	amsfms
	smpsPan		panRight,	$00
	dc.b		nD4
;	Panning	?	direction	amsfms
	smpsPan		panLeft,	$00
	dc.b		nF4,	nB4
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$03
	dc.b		nA4,	$0C
;	Jump?To	?	location
	smpsJump	M41_SBZ2song2_Jump02

; FM3 Data
M41_SBZ2song2_FM3:
	dc.b		nRst,	$0C
M41_SBZ2song2_Jump03:
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
;	Set?FM?Voice	#
	smpsFMvoice	$04
	dc.b		nE3,	$04,	nRst,	$08,	nE3,	$14,	$04,	nRst
	dc.b		$08,	nE3,	$14,	$04,	nRst,	$08,	nE3,	nD3
	dc.b		$04,	nE3,	nD3,	nA3,	nRst,	$08,	nA3,	$0C
	dc.b		nG3,	$04,	nA3,	nG3,	nRst,	$08,	nG3,	$10
	dc.b		$04,	nA3,	$04,	nRst,	$08,	nA3,	$14,	nC4
	dc.b		$04,	nRst,	$08,	nC4,	$14,	nRst,	$04,	nC4
	dc.b		nRst,	nC4,	nRst,	nD4,	$06,	nRst,	$04,	$02
	dc.b		nE3,	$04,	nRst,	$08,	nE3,	$14,	$04,	nRst
	dc.b		$08,	nE3,	$14,	$04,	nRst,	$08,	nE3,	nD3
	dc.b		$04,	nE3,	nD3,	nA3,	nRst,	$08,	nA3,	$0C
	dc.b		nG3,	$04,	nA3,	nG3,	nRst,	$08,	nG3,	$10
	dc.b		$04,	nA3,	$04,	nRst,	$08,	nA3,	$14,	nE3
	dc.b		$04,	nRst,	$08,	nE3,	$14,	nRst,	$04,	nE3
	dc.b		nRst,	nE3,	$08
;	Set?FM?Voice	#
	smpsFMvoice	$07
	dc.b		nB3,	$02,	nRst,	nG3,	nRst,	nE3,	nRst
;	Set?FM?Voice	#
	smpsFMvoice	$04
	dc.b		nG3,	$04,	nRst,	$08,	nG3,	$04,	nRst,	nD3
	dc.b		nG3,	$08,	nRst,	$04,	nG3,	nRst,	nG3,	nA3
	dc.b		$08,	nG3,	nFs3,	$04,	nRst,	$08,	nFs3,	$04
	dc.b		nRst,	nD3,	nFs3,	$08,	nRst,	$04,	nFs3,	nRst
	dc.b		nFs3,	nG3,	$08,	nFs3,	nBb3,	$04,	nRst,	$08
	dc.b		nBb3,	nA3,	$04,	nG3,	nF3,	$0C,	nRst,	$04
	dc.b		nF3,	$08,	nE3,	$04,	nD3,	nC3,	$0C,	nRst
	dc.b		$04,	nC3,	$08,	nG3,	$04,	nC4,	$08,	nRst
	dc.b		$04,	nC4,	nRst,	nC4,	nG3,	$08,	nC4,	nG3
	dc.b		$04,	nRst,	$08,	nG3,	$04,	nRst,	nD3,	nG3
	dc.b		$08,	nRst,	$04,	nG3,	nRst,	nG3,	nA3,	$08
	dc.b		nG3,	nFs3,	$04,	nRst,	$08,	nFs3,	$04,	nRst
	dc.b		nD3,	nFs3,	$08,	nRst,	$04,	nFs3,	nRst,	nFs3
	dc.b		nG3,	$08,	nFs3,	nBb3,	$04,	nRst,	$08,	nBb3
	dc.b		nA3,	$04,	nG3,	nF3,	$0C,	nRst,	$04,	nF3
	dc.b		$08,	nE3,	$04,	nD3,	nA3,	$10,	$0C,	nG3
	dc.b		$04,	nA3,	nRst,	nA3,	nRst,	nA3,	nRst,	nA3
	dc.b		nG3,	nA3,	nD3,	$08,	nRst,	$04,	nD3,	$06
	dc.b		nRst,	$02,	nD3,	$08,	$04,	$08,	nRst,	$04
	dc.b		nD3,	$06,	nRst,	$02,	nD3,	$04,	nC3,	nD3
	dc.b		nD3,	$08,	nRst,	$04,	nD3,	$06,	nRst,	$02
	dc.b		nC3,	$08,	nD3,	$04,	nG3,	$08,	nRst,	$04
	dc.b		nG3,	$06,	nRst,	$02,	nF3,	$08,	nG3,	$04
	dc.b		nBb3,	$08,	nRst,	$04,	nBb3,	$06,	nRst,	$02
	dc.b		nF3,	$08,	nBb3,	$04,	nC4,	$08,	nRst,	$04
	dc.b		nC4,	$06,	nRst,	$02,	nG3,	$08,	nC4,	$04
	dc.b		nB3,	$08,	nRst,	$04,	nB3,	$0C,	nG3,	$04
	dc.b		nB3,	nRst,	nB3,	nRst,	nB3,	$0C,	nA3,	$08
	dc.b		nD3,	nRst,	$04,	nD3,	$06,	nRst,	$02,	nD3
	dc.b		$08,	$04,	$08,	nRst,	$04,	nD3,	$06,	nRst
	dc.b		$02,	nD3,	$04,	nC3,	nD3,	nD3,	$08,	nRst
	dc.b		$04,	nD3,	$06,	nRst,	$02,	nC3,	$08,	nD3
	dc.b		$04,	nG3,	$08,	nRst,	$04,	nG3,	$06,	nRst
	dc.b		$02,	nF3,	$08,	nG3,	$04,	nBb3,	$08,	nRst
	dc.b		$04,	nBb3,	$06,	nRst,	$02,	nF3,	$08,	nBb3
	dc.b		$04,	nC4,	$08,	nRst,	$04,	nC4,	$06,	nRst
	dc.b		$02,	nG3,	$08,	nC4,	$04,	nB3,	$08,	nRst
	dc.b		$04,	nB3,	$0C,	nG3,	$04,	nB3,	nRst,	nB3
	dc.b		nRst,	nB3,	nRst,	nB3,	$0C
;	Jump?To	?	location
	smpsJump	M41_SBZ2song2_Jump03

; FM4 Data
M41_SBZ2song2_FM4:
	dc.b		nRst,	$0D
	smpsStop

; FM5 Data
M41_SBZ2song2_FM5:
	dc.b		nRst,	$0D
	smpsStop

; PSG1 Data
M41_SBZ2song2_PSG1:
	dc.b		nRst,	$0D
	smpsStop

; PSG2 Data
M41_SBZ2song2_PSG2:
	dc.b		nRst,	$0D
	smpsStop

; PSG3 Data
M41_SBZ2song2_PSG3:
;	Set?PSG?WvForm	#
	smpsPSGform	$E7
	dc.b		nRst,	$10
;	Set?PSG?WvForm	#
	smpsPSGform	$E7
M41_SBZ2song2_Jump04:
;	Set?PSG?Voice	#
	smpsPSGvoice	$02
	dc.b		nAb6,	$0C,	$0C,	$08,	$0C,	$0C,	$08,	$0C
	dc.b		$0C,	$08,	$0C,	$0C,	$08,	$0C,	$0C,	$08
	dc.b		$0C,	$0C,	$08,	$0C,	$0C,	$0C,	$08,	$04
;	Set?PSG?Voice	#
	smpsPSGvoice	$01
	dc.b		$10
;	Set?PSG?Voice	#
	smpsPSGvoice	$02
	dc.b		$0C,	$0C,	$08,	$0C,	$0C,	$08,	$0C,	$0C
	dc.b		$08,	$0C,	$0C,	$08,	$0C,	$0C,	$08,	$0C
	dc.b		$0C,	$08,	$0C,	$0C,	$0C,	$08,	$04
;	Set?PSG?Voice	#
	smpsPSGvoice	$01
	dc.b		$03,	nRst,	$0D
;	Set?PSG?Voice	#
	smpsPSGvoice	$02
	dc.b		nAb6,	$0C,	$0C,	$08,	$0C,	$0C,	$08,	$0C
	dc.b		$0C,	$08,	$0C,	$14,	$0C,	$0C,	$08,	$0C
	dc.b		$0C,	$08,	$0C,	$0C,	$08,	$0C,	$14,	$0C
	dc.b		$0C,	$08,	$0C,	$0C,	$08,	$0C,	$0C,	$08
	dc.b		$0C,	$14,	$0C,	$0C,	$08,	$0C,	$0C,	$08
	dc.b		$0C,	$0C,	$08,	$0C,	$14,	$0C,	$0C,	$08
	dc.b		$0C,	$0C,	$08,	$0C,	$0C,	$08,	$0C,	$14
	dc.b		$0C,	$0C,	$08,	$0C,	$0C,	$08,	$0C,	$0C
	dc.b		$08,	$0C,	$14,	$0C,	$0C,	$08,	$0C,	$0C
	dc.b		$08,	$0C,	$0C,	$08,	$0C,	$14,	$0C,	$0C
	dc.b		$08,	$0C,	$0C,	$08,	$0C,	$0C,	$08,	$0C
	dc.b		$14
;	Jump?To	?	location
	smpsJump	M41_SBZ2song2_Jump04

; DAC Data
M41_SBZ2song2_DAC:
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		$90,	$04,	$9D,	$01,	$03,	$90,	$04
M41_SBZ2song2_Jump05:
;	Panning	?	direction	amsfms
	smpsPan		panCentre,	$00
	dc.b		dVLowTimpani,	$08,	$9D,	$01,	$03,	$90,	$08,	$04
	dc.b		$9D,	$01,	$07,	$90,	$08,	$9D,	$01,	$03
	dc.b		$90,	$08,	$04,	$9D,	$01,	$07,	$90,	$08
	dc.b		$9D,	$01,	$03,	$90,	$08,	$04,	$9D,	$01
	dc.b		$07,	$90,	$08,	$9D,	$01,	$03,	$90,	$08
	dc.b		$04,	$9D,	$01,	$07,	$90,	$08,	$9D,	$01
	dc.b		$03,	$90,	$08,	$04,	$9D,	$01,	$07,	$90
	dc.b		$08,	$9D,	$01,	$03,	$90,	$08,	$04,	$9D
	dc.b		$01,	$07,	$90,	$08,	$9D,	$01,	$03,	$90
	dc.b		$08,	$04,	$9D,	$01,	$07,	$90,	$04,	$9D
	dc.b		$01,	$07,	$01,	$0B,	$93,	$04,	$04,	dVLowTimpani
	dc.b		$08,	$9D,	$01,	$03,	$90,	$08,	$04,	$9D
	dc.b		$01,	$07,	$90,	$08,	$9D,	$01,	$03,	$90
	dc.b		$08,	$04,	$9D,	$01,	$07,	$90,	$08,	$9D
	dc.b		$01,	$03,	$90,	$08,	$04,	$9D,	$01,	$07
	dc.b		$90,	$08,	$9D,	$01,	$03,	$90,	$08,	$04
	dc.b		$9D,	$01,	$07,	$90,	$02,	nRst,	$04,	$02
	dc.b		$9D,	$01,	$03,	$90,	$02,	nRst,	$04,	$02
	dc.b		$90,	$02,	nRst,	$9D,	$01,	$05,	nRst,	$02
	dc.b		$90,	nRst,	$04,	$02,	$9D,	$01,	$03,	$90
	dc.b		$02,	nRst,	$04,	$02,	$90,	$02,	nRst,	$9D
	dc.b		$01,	$05,	nRst,	$02,	$90,	nRst,	$04,	$02
	dc.b		$9D,	$01,	$03,	$90,	$02,	nRst,	$04,	$02
	dc.b		$90,	$02,	nRst,	$9D,	$01,	$05,	nRst,	$02
	dc.b		$90,	nRst,	$9D,	$01,	$05,	nRst,	$02,	$9D
	dc.b		$01,	$05,	nRst,	$02,	$90,	$04,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	dVLowTimpani,	$08,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	$04,	$02,	$90,	$02
	dc.b		nRst,	$9D,	$01,	$05,	nRst,	$02,	$90,	nRst
	dc.b		$04,	$02,	$9D,	$01,	$03,	$90,	$02,	nRst
	dc.b		$04,	$02,	$90,	$02,	nRst,	$9D,	$01,	$05
	dc.b		nRst,	$02,	$90,	nRst,	$04,	$02,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	$04,	$02,	$90,	$02
	dc.b		nRst,	$9D,	$01,	$05,	nRst,	$02,	$90,	nRst
	dc.b		$04,	$02,	$9D,	$01,	$03,	$90,	$02,	nRst
	dc.b		$04,	$02,	$90,	$02,	nRst,	$9D,	$04,	$01
	dc.b		$03,	dVLowTimpani,	$08,	$9D,	$01,	$03,	$90,	$02
	dc.b		nRst,	$04,	$02,	$90,	$02,	nRst,	$9D,	$01
	dc.b		$05,	nRst,	$02,	$90,	nRst,	$04,	$02,	$9D
	dc.b		$01,	$03,	$90,	$02,	nRst,	$04,	$02,	$90
	dc.b		$02,	nRst,	$9D,	$01,	$05,	nRst,	$02,	$90
	dc.b		$08,	$9D,	$01,	$03,	$90,	$02,	nRst,	$04
	dc.b		$02,	$90,	$02,	nRst,	$9D,	$01,	$05,	nRst
	dc.b		$02,	$90,	nRst,	$04,	$02,	$9D,	$01,	$03
	dc.b		$90,	$02,	nRst,	$04,	$02,	$9D,	$01,	$03
	dc.b		$01,	$03,	$01,	$03,	dVLowTimpani,	$02,	nRst,	$04
	dc.b		$02,	$9D,	$01,	$03,	$90,	$02,	nRst,	$04
	dc.b		$02,	$90,	$02,	nRst,	$9D,	$01,	$05,	nRst
	dc.b		$02,	$90,	nRst,	$04,	$02,	$9D,	$01,	$03
	dc.b		$90,	$02,	nRst,	$04,	$02,	$90,	$02,	nRst
	dc.b		$9D,	$01,	$05,	nRst,	$02,	$90,	nRst,	$04
	dc.b		$02,	$9D,	$01,	$03,	$90,	$02,	nRst,	$04
	dc.b		$02,	$90,	$02,	nRst,	$9D,	$01,	$05,	nRst
	dc.b		$02,	$90,	nRst,	$04,	$02,	$9D,	$01,	$03
	dc.b		$90,	$02,	nRst,	$04,	$02,	$90,	$02,	nRst
	dc.b		$9D,	$01,	$03,	$01,	$03,	$90,	$02,	nRst
	dc.b		$04,	$02,	$9D,	$01,	$03,	$90,	$02,	nRst
	dc.b		$04,	$02,	$90,	$02,	nRst,	$9D,	$01,	$05
	dc.b		nRst,	$02,	$90,	nRst,	$04,	$02,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	$04,	$02,	$90,	$02
	dc.b		nRst,	$9D,	$01,	$05,	nRst,	$02,	$90,	nRst
	dc.b		$04,	$02,	$9D,	$01,	$03,	$90,	$02,	nRst
	dc.b		$04,	$02,	$90,	$02,	nRst,	$9D,	$01,	$05
	dc.b		nRst,	$02,	$90,	nRst,	$04,	$02,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	$04,	$02,	$9D,	$01
	dc.b		$03,	$02,	nRst,	$02,	$9D,	$01,	$03,	dVLowTimpani
	dc.b		$08,	$9D,	$01,	$03,	$90,	$02,	nRst,	$04
	dc.b		$02,	$90,	$02,	nRst,	$9D,	$01,	$05,	nRst
	dc.b		$02,	$90,	nRst,	$04,	$02,	$9D,	$01,	$03
	dc.b		$90,	$02,	nRst,	$04,	$02,	$90,	$02,	nRst
	dc.b		$9D,	$01,	$05,	nRst,	$02,	$90,	nRst,	$04
	dc.b		$02,	$9D,	$01,	$03,	$90,	$02,	nRst,	$04
	dc.b		$02,	$90,	$02,	nRst,	$9D,	$01,	$05,	nRst
	dc.b		$02,	$90,	nRst,	$04,	$02,	$9D,	$01,	$03
	dc.b		$90,	$02,	nRst,	$04,	$02,	$90,	$02,	nRst
	dc.b		$9D,	$01,	$03,	$01,	$03,	dVLowTimpani,	$08,	$9D
	dc.b		$01,	$03,	$90,	$02,	nRst,	$04,	$02,	$90
	dc.b		$02,	nRst,	$9D,	$01,	$05,	nRst,	$02,	$90
	dc.b		nRst,	$04,	$02,	$9D,	$01,	$03,	$90,	$02
	dc.b		nRst,	$04,	$02,	$90,	$02,	nRst,	$9D,	$01
	dc.b		$05,	nRst,	$02,	$90,	nRst,	$04,	$02,	$9D
	dc.b		$01,	$03,	$90,	$02,	nRst,	$04,	$02,	$90
	dc.b		$02,	nRst,	$9D,	$01,	$05,	nRst,	$02,	$90
	dc.b		nRst,	$04,	$02,	$9D,	$01,	$03,	$90,	$02
	dc.b		nRst,	$04,	$02,	$9D,	$01,	$03,	$02,	nRst
	dc.b		$02,	$9D,	$01,	$03,	dVLowTimpani,	$08,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	$04,	$02,	$90,	$02
	dc.b		nRst,	$9D,	$01,	$05,	nRst,	$02,	$90,	nRst
	dc.b		$04,	$02,	$9D,	$01,	$03,	$90,	$02,	nRst
	dc.b		$04,	$02,	$90,	$02,	nRst,	$9D,	$01,	$05
	dc.b		nRst,	$02,	$90,	nRst,	$04,	$02,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	$04,	$02,	$90,	$02
	dc.b		nRst,	$9D,	$01,	$05,	nRst,	$02,	$90,	nRst
	dc.b		$04,	$02,	$9D,	$01,	$03,	$90,	$02,	nRst
	dc.b		$04,	$02,	$90,	$02,	nRst,	$9D,	$01,	$03
	dc.b		$01,	$03,	dVLowTimpani,	$08,	$9D,	$01,	$03,	$90
	dc.b		$02,	nRst,	$04,	$02,	$90,	$02,	nRst,	$9D
	dc.b		$01,	$05,	nRst,	$02,	dVLowTimpani,	$08,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	$04,	$02,	$90,	$02
	dc.b		nRst,	$9D,	$01,	$05,	nRst,	$02,	$90,	nRst
	dc.b		$04,	$02,	$9D,	$01,	$03,	$90,	$02,	nRst
	dc.b		$04,	$02,	$90,	$02,	nRst,	$9D,	$01,	$05
	dc.b		nRst,	$02,	$90,	nRst,	$04,	$02,	$9D,	$01
	dc.b		$03,	$90,	$02,	nRst,	$04,	$02,	$9D,	$01
	dc.b		$03,	$01,	$03,	$01,	$03
;	Jump?To	?	location
	smpsJump	M41_SBZ2song2_Jump05

M41_SBZ2song2_Voices:
;	Voice 00
;	$34,$33,$41,$7E,$74,$5B,$9F,$5F,$1F,$04,$07,$07,$08,$00,$00,$00,$00,$FF,$FF,$EF,$FF,$23,$90,$29,$97
;				#
	smpsVcAlgorithm		$04
	smpsVcFeedback		$06
;				op1	op2	op3	op4
	smpsVcDetune		$07,	$07,	$04,	$03
	smpsVcCoarseFreq	$04,	$0E,	$01,	$03
	smpsVcRateScale		$00,	$01,	$02,	$01
	smpsVcAttackRate	$1F,	$1F,	$1F,	$1B
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$08,	$07,	$07,	$04
	smpsVcDecayRate2	$00,	$00,	$00,	$00
	smpsVcDecayLevel	$0F,	$0E,	$0F,	$0F
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$97,	$29,	$90,	$23

;	Voice 01
;	$3A,$61,$3C,$14,$31,$9C,$DB,$9C,$DA,$04,$09,$04,$03,$03,$01,$03,$00,$1F,$0F,$0F,$AF,$21,$20,$31,$80
;				#
	smpsVcAlgorithm		$02
	smpsVcFeedback		$07
;				op1	op2	op3	op4
	smpsVcDetune		$03,	$01,	$03,	$06
	smpsVcCoarseFreq	$01,	$04,	$0C,	$01
	smpsVcRateScale		$03,	$02,	$03,	$02
	smpsVcAttackRate	$1A,	$1C,	$1B,	$1C
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$03,	$04,	$09,	$04
	smpsVcDecayRate2	$00,	$03,	$01,	$03
	smpsVcDecayLevel	$0A,	$00,	$00,	$01
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$80,	$31,	$20,	$21

;	Voice 02
;	$04,$72,$42,$32,$32,$1F,$1F,$1F,$1F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$00,$07,$23,$80,$23,$80
;				#
	smpsVcAlgorithm		$04
	smpsVcFeedback		$00
;				op1	op2	op3	op4
	smpsVcDetune		$03,	$03,	$04,	$07
	smpsVcCoarseFreq	$02,	$02,	$02,	$02
	smpsVcRateScale		$00,	$00,	$00,	$00
	smpsVcAttackRate	$1F,	$1F,	$1F,	$1F
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$00,	$00,	$00,	$00
	smpsVcDecayRate2	$00,	$00,	$00,	$00
	smpsVcDecayLevel	$00,	$00,	$00,	$00
	smpsVcReleaseRate	$07,	$00,	$07,	$00
	smpsVcTotalLevel	$80,	$23,	$80,	$23

;	Voice 03
;	$3D,$01,$01,$01,$01,$8E,$52,$14,$4C,$08,$08,$0E,$03,$00,$00,$00,$00,$1F,$1F,$1F,$1F,$1B,$80,$80,$9B
;				#
	smpsVcAlgorithm		$05
	smpsVcFeedback		$07
;				op1	op2	op3	op4
	smpsVcDetune		$00,	$00,	$00,	$00
	smpsVcCoarseFreq	$01,	$01,	$01,	$01
	smpsVcRateScale		$01,	$00,	$01,	$02
	smpsVcAttackRate	$0C,	$14,	$12,	$0E
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$03,	$0E,	$08,	$08
	smpsVcDecayRate2	$00,	$00,	$00,	$00
	smpsVcDecayLevel	$01,	$01,	$01,	$01
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$9B,	$80,	$80,	$1B

;	Voice 04
;	$3A,$60,$66,$60,$61,$1F,$94,$1F,$1F,$0F,$10,$05,$0D,$07,$06,$06,$07,$2F,$4F,$1F,$5F,$21,$14,$28,$80
;				#
	smpsVcAlgorithm		$02
	smpsVcFeedback		$07
;				op1	op2	op3	op4
	smpsVcDetune		$06,	$06,	$06,	$06
	smpsVcCoarseFreq	$01,	$00,	$06,	$00
	smpsVcRateScale		$00,	$00,	$02,	$00
	smpsVcAttackRate	$1F,	$1F,	$14,	$1F
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$0D,	$05,	$10,	$0F
	smpsVcDecayRate2	$07,	$06,	$06,	$07
	smpsVcDecayLevel	$05,	$01,	$04,	$02
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$80,	$28,	$14,	$21

;	Voice 05
;	$2C,$74,$74,$34,$34,$1F,$12,$1F,$1F,$00,$00,$00,$00,$00,$01,$00,$01,$0F,$3F,$0F,$3F,$16,$90,$17,$90
;				#
	smpsVcAlgorithm		$04
	smpsVcFeedback		$05
;				op1	op2	op3	op4
	smpsVcDetune		$03,	$03,	$07,	$07
	smpsVcCoarseFreq	$04,	$04,	$04,	$04
	smpsVcRateScale		$00,	$00,	$00,	$00
	smpsVcAttackRate	$1F,	$1F,	$12,	$1F
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$00,	$00,	$00,	$00
	smpsVcDecayRate2	$01,	$00,	$01,	$00
	smpsVcDecayLevel	$03,	$00,	$03,	$00
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$90,	$17,	$90,	$16

;	Voice 06
;	$08,$0A,$70,$30,$00,$1F,$1F,$5F,$5F,$12,$0E,$0A,$0A,$00,$04,$04,$03,$2F,$2F,$2F,$2F,$24,$2D,$13,$80
;				#
	smpsVcAlgorithm		$00
	smpsVcFeedback		$01
;				op1	op2	op3	op4
	smpsVcDetune		$00,	$03,	$07,	$00
	smpsVcCoarseFreq	$00,	$00,	$00,	$0A
	smpsVcRateScale		$01,	$01,	$00,	$00
	smpsVcAttackRate	$1F,	$1F,	$1F,	$1F
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$0A,	$0A,	$0E,	$12
	smpsVcDecayRate2	$03,	$04,	$04,	$00
	smpsVcDecayLevel	$02,	$02,	$02,	$02
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$80,	$13,	$2D,	$24

;	Voice 07
;	$3D,$01,$02,$02,$02,$1F,$08,$8A,$0A,$08,$08,$08,$08,$00,$01,$00,$00,$0F,$1F,$1F,$1F,$1F,$88,$88,$87
;				#
	smpsVcAlgorithm		$05
	smpsVcFeedback		$07
;				op1	op2	op3	op4
	smpsVcDetune		$00,	$00,	$00,	$00
	smpsVcCoarseFreq	$02,	$02,	$02,	$01
	smpsVcRateScale		$00,	$02,	$00,	$00
	smpsVcAttackRate	$0A,	$0A,	$08,	$1F
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$08,	$08,	$08,	$08
	smpsVcDecayRate2	$00,	$00,	$01,	$00
	smpsVcDecayLevel	$01,	$01,	$01,	$00
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$87,	$88,	$88,	$1F

;	Voice 08
;	$3C,$31,$52,$50,$30,$52,$53,$52,$53,$08,$00,$08,$00,$04,$00,$04,$00,$1F,$0F,$1F,$0F,$1A,$80,$16,$80
;				#
	smpsVcAlgorithm		$04
	smpsVcFeedback		$07
;				op1	op2	op3	op4
	smpsVcDetune		$03,	$05,	$05,	$03
	smpsVcCoarseFreq	$00,	$00,	$02,	$01
	smpsVcRateScale		$01,	$01,	$01,	$01
	smpsVcAttackRate	$13,	$12,	$13,	$12
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$00,	$08,	$00,	$08
	smpsVcDecayRate2	$00,	$04,	$00,	$04
	smpsVcDecayLevel	$00,	$01,	$00,	$01
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$80,	$16,	$80,	$1A

;	Voice 09
;	$38,$02,$02,$02,$01,$1F,$11,$11,$10,$00,$00,$00,$02,$01,$01,$01,$01,$0F,$0F,$0F,$3F,$2C,$22,$22,$83
;				#
	smpsVcAlgorithm		$00
	smpsVcFeedback		$07
;				op1	op2	op3	op4
	smpsVcDetune		$00,	$00,	$00,	$00
	smpsVcCoarseFreq	$01,	$02,	$02,	$02
	smpsVcRateScale		$00,	$00,	$00,	$00
	smpsVcAttackRate	$10,	$11,	$11,	$1F
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$02,	$00,	$00,	$00
	smpsVcDecayRate2	$01,	$01,	$01,	$01
	smpsVcDecayLevel	$03,	$00,	$00,	$00
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$83,	$22,	$22,	$2C

;	Voice 0A
;	$38,$35,$05,$10,$01,$14,$14,$10,$0E,$05,$08,$02,$08,$00,$00,$00,$00,$9F,$0F,$0F,$1F,$25,$31,$2A,$80
;				#
	smpsVcAlgorithm		$00
	smpsVcFeedback		$07
;				op1	op2	op3	op4
	smpsVcDetune		$00,	$01,	$00,	$03
	smpsVcCoarseFreq	$01,	$00,	$05,	$05
	smpsVcRateScale		$00,	$00,	$00,	$00
	smpsVcAttackRate	$0E,	$10,	$14,	$14
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$08,	$02,	$08,	$05
	smpsVcDecayRate2	$00,	$00,	$00,	$00
	smpsVcDecayLevel	$01,	$00,	$00,	$09
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$80,	$2A,	$31,	$25

;	Voice 0B
;	$37,$52,$31,$34,$50,$1F,$1F,$1F,$1F,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$0F,$0F,$0F,$80,$87,$87,$87
;				#
	smpsVcAlgorithm		$07
	smpsVcFeedback		$06
;				op1	op2	op3	op4
	smpsVcDetune		$05,	$03,	$03,	$05
	smpsVcCoarseFreq	$00,	$04,	$01,	$02
	smpsVcRateScale		$00,	$00,	$00,	$00
	smpsVcAttackRate	$1F,	$1F,	$1F,	$1F
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$00,	$00,	$00,	$00
	smpsVcDecayRate2	$00,	$00,	$00,	$00
	smpsVcDecayLevel	$00,	$00,	$00,	$00
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$87,	$87,	$87,	$80

;	Voice 0C
;	$06,$61,$03,$32,$71,$1F,$1F,$1F,$1F,$00,$00,$00,$00,$00,$00,$00,$00,$0F,$0F,$0F,$0F,$1E,$85,$80,$80
;				#
	smpsVcAlgorithm		$06
	smpsVcFeedback		$00
;				op1	op2	op3	op4
	smpsVcDetune		$07,	$03,	$00,	$06
	smpsVcCoarseFreq	$01,	$02,	$03,	$01
	smpsVcRateScale		$00,	$00,	$00,	$00
	smpsVcAttackRate	$1F,	$1F,	$1F,	$1F
	smpsVcAmpMod		$00,	$00,	$00,	$00
	smpsVcDecayRate1	$00,	$00,	$00,	$00
	smpsVcDecayRate2	$00,	$00,	$00,	$00
	smpsVcDecayLevel	$00,	$00,	$00,	$00
	smpsVcReleaseRate	$0F,	$0F,	$0F,	$0F
	smpsVcTotalLevel	$80,	$80,	$85,	$1E
	even
