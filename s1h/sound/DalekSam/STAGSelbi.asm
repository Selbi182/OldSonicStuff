; -------------------------------------------------------
; File created using XM4SMPS v4.0 (Qt 4.5.0-tp1 Win32)
; Created on Sat Jan 23 2010, 11:45:13
; -------------------------------------------------------

STAG_Header:
	smpsHeaderVoice	STAG_Voices
	smpsHeaderChan	5,3
	smpsHeaderTempo	$2, $6
	smpsHeaderDAC	STAG_DAC
	smpsHeaderFM	STAG_FM1,	$c, $d
	smpsHeaderFM	STAG_FM2,	$0, $11
	smpsHeaderFM	STAG_FM3,	$0, $11
	smpsHeaderFM	STAG_FM4,	$0, $11
	smpsHeaderPSG	STAG_PSG1,	$dc, $6, $0
	smpsHeaderPSG	STAG_PSG2,	$dc, $6, $0
	smpsHeaderPSG	STAG_PSG3,	$c, $1, $0

; Variables for drums--replace as nessacary
StagKick	 = $81
StagSnare	 = $82
StagCymbal 	 = $8E


STAG_FM1:
	smpsCall	STAG_FM1_p0
	smpsCall	STAG_FM1_p0
	smpsCall	STAG_FM1_p0
	smpsCall	STAG_FM1_p0
	smpsCall	STAG_FM1_p4
	smpsCall	STAG_FM1_p5
	smpsCall	STAG_FM1_p6
	smpsCall	STAG_FM1_p7
	smpsCall	STAG_FM1_p8
	smpsCall	STAG_FM1_p9
	smpsCall	STAG_FM1_p6
	smpsCall	STAG_FM1_p7
	smpsCall	STAG_FM1_p8
	smpsCall	STAG_FM1_pd
	smpsCall	STAG_FM1_p8
	smpsCall	STAG_FM1_pf
	smpsJump	STAG_FM1

STAG_FM2:
	smpsCall	STAG_FM2_p0
	smpsCall	STAG_FM2_p0
	smpsCall	STAG_FM2_p2
	smpsCall	STAG_FM2_p3
	smpsCall	STAG_FM2_p4
	smpsCall	STAG_FM2_p5
	smpsCall	STAG_FM2_p6
	smpsCall	STAG_FM2_p7
	smpsCall	STAG_FM2_p8
	smpsCall	STAG_FM2_p9
	smpsCall	STAG_FM2_pa
	smpsCall	STAG_FM2_pb
	smpsCall	STAG_FM2_pc
	smpsCall	STAG_FM2_pb
	smpsCall	STAG_FM2_pe
	smpsCall	STAG_FM2_pf
	smpsJump	STAG_FM2

STAG_FM3:
	smpsCall	STAG_FM3_p0
	smpsCall	STAG_FM3_p0
	smpsCall	STAG_FM3_p2
	smpsCall	STAG_FM3_p3
	smpsCall	STAG_FM3_p4
	smpsCall	STAG_FM3_p5
	smpsCall	STAG_FM3_p6
	smpsCall	STAG_FM3_p7
	smpsCall	STAG_FM3_p8
	smpsCall	STAG_FM3_p9
	smpsCall	STAG_FM3_pa
	smpsCall	STAG_FM3_pb
	smpsCall	STAG_FM3_pc
	smpsCall	STAG_FM3_pb
	smpsCall	STAG_FM3_pe
	smpsCall	STAG_FM3_pf
	smpsJump	STAG_FM3

STAG_FM4:
	smpsCall	STAG_FM4_p0
	smpsCall	STAG_FM4_p0
	smpsCall	STAG_FM4_p0
	smpsCall	STAG_FM4_p0
	smpsCall	STAG_FM4_p4
	smpsCall	STAG_FM4_p5
	smpsCall	STAG_FM4_p6
	smpsCall	STAG_FM4_p7
	smpsCall	STAG_FM4_p8
	smpsCall	STAG_FM4_p9
	smpsCall	STAG_FM4_p6
	smpsCall	STAG_FM4_p7
	smpsCall	STAG_FM4_p8
	smpsCall	STAG_FM4_pd
	smpsCall	STAG_FM4_p8
	smpsCall	STAG_FM4_pf
	smpsJump	STAG_FM4

STAG_PSG1:
	smpsCall	STAG_PSG1_p0
	smpsCall	STAG_PSG1_p1
	smpsCall	STAG_PSG1_p1
	smpsCall	STAG_PSG1_p1
	smpsCall	STAG_PSG1_p4
	smpsCall	STAG_PSG1_p5
	smpsCall	STAG_PSG1_p6
	smpsCall	STAG_PSG1_p7
	smpsCall	STAG_PSG1_p8
	smpsCall	STAG_PSG1_p9
	smpsCall	STAG_PSG1_p6
	smpsCall	STAG_PSG1_p7
	smpsCall	STAG_PSG1_p8
	smpsCall	STAG_PSG1_pd
	smpsCall	STAG_PSG1_pe
	smpsCall	STAG_PSG1_pf
	smpsJump	STAG_PSG1

STAG_PSG2:
	smpsCall	STAG_PSG2_p0
	smpsCall	STAG_PSG2_p1
	smpsCall	STAG_PSG2_p1
	smpsCall	STAG_PSG2_p1
	smpsCall	STAG_PSG2_p4
	smpsCall	STAG_PSG2_p5
	smpsCall	STAG_PSG2_p6
	smpsCall	STAG_PSG2_p7
	smpsCall	STAG_PSG2_p8
	smpsCall	STAG_PSG2_p9
	smpsCall	STAG_PSG2_p6
	smpsCall	STAG_PSG2_p7
	smpsCall	STAG_PSG2_p8
	smpsCall	STAG_PSG2_pd
	smpsCall	STAG_PSG2_pe
	smpsCall	STAG_PSG2_pf
	smpsJump	STAG_PSG2

STAG_PSG3:
	smpsPSGform	$E7
	smpsCall	STAG_PSG3_p0
	smpsCall	STAG_PSG3_p1
	smpsCall	STAG_PSG3_p2
	smpsCall	STAG_PSG3_p3
	smpsCall	STAG_PSG3_p1
	smpsCall	STAG_PSG3_p5
	smpsCall	STAG_PSG3_p3
	smpsCall	STAG_PSG3_p7
	smpsCall	STAG_PSG3_p3
	smpsCall	STAG_PSG3_p7
	smpsCall	STAG_PSG3_p3
	smpsCall	STAG_PSG3_p7
	smpsCall	STAG_PSG3_p3
	smpsCall	STAG_PSG3_p7
	smpsCall	STAG_PSG3_p3
	smpsCall	STAG_PSG3_pf
	smpsJump	STAG_PSG3

STAG_DAC:
	smpsCall	STAG_DAC_p0
	smpsCall	STAG_DAC_p1
	smpsCall	STAG_DAC_p2
	smpsCall	STAG_DAC_p3
	smpsCall	STAG_DAC_p4
	smpsCall	STAG_DAC_p5
	smpsCall	STAG_DAC_p6
	smpsCall	STAG_DAC_p7
	smpsCall	STAG_DAC_p6
	smpsCall	STAG_DAC_p7
	smpsCall	STAG_DAC_p6
	smpsCall	STAG_DAC_p7
	smpsCall	STAG_DAC_p6
	smpsCall	STAG_DAC_p7
	smpsCall	STAG_DAC_p6
	smpsCall	STAG_DAC_pf
	smpsJump	STAG_DAC


; Pattern data for FM1
STAG_FM1_p0:
	smpsFMvoice	$1
	dc.b		$98,$20
	dc.b		$4
	dc.b		$8
	dc.b		$4
	dc.b		$94,$8
	dc.b		$96
	smpsReturn

STAG_FM1_p4:
	dc.b		$98,$3
	dc.b		$98
	dc.b		$98,$2
	dc.b		$8
	dc.b		$3
	dc.b		$98
	dc.b		$98,$2
	dc.b		$8
	dc.b		$99
	dc.b		$99
	dc.b		$98,$3
	dc.b		$98
	dc.b		$98,$2
	dc.b		$8
	smpsReturn

STAG_FM1_p5:
	dc.b		$98,$3
	dc.b		$98
	dc.b		$98,$2
	dc.b		$8
	dc.b		$97
	dc.b		$97
	dc.b		$98,$4
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	smpsReturn

STAG_FM1_p6:
	dc.b		$98,$4
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	smpsReturn

STAG_FM1_p7:
	dc.b		$96,$4
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	smpsReturn

STAG_FM1_p8:
	dc.b		$96,$4
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$96
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	smpsReturn

STAG_FM1_p9:
	dc.b		$98,$4
	dc.b		$98
	dc.b		$9b
	dc.b		$9b
	dc.b		$9a
	dc.b		$9a
	dc.b		$99
	dc.b		$99
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	dc.b		$98
	smpsReturn

STAG_FM1_pd:
	dc.b		$98,$4
	dc.b		$98
	dc.b		$9b
	dc.b		$9b
	dc.b		$9a
	dc.b		$9a
	dc.b		$99
	dc.b		$99
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	dc.b		$94
	smpsReturn

STAG_FM1_pf:
	dc.b		$98,$4
	dc.b		$98
	dc.b		$9b
	dc.b		$9b
	dc.b		$9a
	dc.b		$9a
	dc.b		$99
	dc.b		$99
	smpsReturn

; Pattern data for FM2
STAG_FM2_p0:
	smpsFMvoice	$0
	dc.b		$ab,$4
	dc.b		$ae
	dc.b		$ad
	dc.b		$ab
	dc.b		$b0,$8
	dc.b		$ad,$4
	dc.b		$ae,$8
	dc.b		$ab,$4
	dc.b		$ad
	dc.b		$a9
	dc.b		$a7,$8
	dc.b		$a9
	smpsReturn

STAG_FM2_p2:
	dc.b		$ab,$4
	dc.b		$ae
	dc.b		$b2
	dc.b		$ab
	dc.b		$b5,$8
	dc.b		$b2,$4
	dc.b		$ae,$8
	dc.b		$ab,$4
	dc.b		$b2
	dc.b		$a9
	dc.b		$ac,$8
	dc.b		$ae
	smpsReturn

STAG_FM2_p3:
	dc.b		$b0,$4
	dc.b		$ae
	dc.b		$b2
	dc.b		$ab
	dc.b		$b5,$8
	dc.b		$b2,$4
	dc.b		$ae,$8
	dc.b		$ab,$4
	dc.b		$b2
	dc.b		$a9
	dc.b		$ac,$8
	dc.b		$ae
	smpsReturn

STAG_FM2_p4:
	dc.b		$80,$40
	smpsReturn

STAG_FM2_p5:
	dc.b		$e7,$20
	smpsFMvoice	$0
	dc.b		$ba,$2
	dc.b		$bc,$6
	dc.b		$be,$4
	dc.b		$bc,$8
	dc.b		$be
	dc.b		$be,$2
	dc.b		$bf
	smpsReturn

STAG_FM2_p6:
	dc.b		$e7,$14
	dc.b		$bc,$c
	dc.b		$bf,$2
	dc.b		$be,$12
	dc.b		$ba,$8
	dc.b		$b5,$4
	smpsReturn

STAG_FM2_p7:
	dc.b		$e7,$14
	dc.b		$ba,$2
	dc.b		$bc
	dc.b		$be,$4
	dc.b		$b8,$18
	dc.b		$c
	smpsReturn

STAG_FM2_p8:
	dc.b		$bc,$2
	dc.b		$ba,$12
	dc.b		$b5,$c
	dc.b		$bc,$20
	smpsReturn

STAG_FM2_p9:
	dc.b		$e7,$20
	dc.b		$ba,$2
	dc.b		$bc,$6
	dc.b		$be,$4
	dc.b		$bc,$8
	dc.b		$be
	dc.b		$be,$2
	dc.b		$bf
	smpsReturn

STAG_FM2_pa:
	dc.b		$e7,$14
	dc.b		$bf,$2
	dc.b		$c1,$6
	dc.b		$bf,$4
	dc.b		$c1,$14
	dc.b		$ba,$8
	dc.b		$be,$4
	smpsReturn

STAG_FM2_pb:
	dc.b		$e7,$14
	dc.b		$be,$2
	dc.b		$bf
	dc.b		$c1,$4
	dc.b		$bc,$18
	dc.b		$b8,$c
	smpsReturn

STAG_FM2_pc:
	dc.b		$bc,$2
	dc.b		$ba,$12
	dc.b		$bc,$2
	dc.b		$be,$a
	dc.b		$bf,$20
	smpsReturn

STAG_FM2_pe:
	dc.b		$be,$10
	dc.b		$ba,$c
	dc.b		$b7,$24
	smpsReturn

STAG_FM2_pf:
	dc.b		$e7,$20
	smpsReturn

; Pattern data for FM3
STAG_FM3_p0:
	smpsFMvoice	$0
	dc.b		$b0,$4
	dc.b		$b3
	dc.b		$b2
	dc.b		$b0
	dc.b		$b5,$8
	dc.b		$b2,$4
	dc.b		$b3,$8
	dc.b		$b0,$4
	dc.b		$b2
	dc.b		$ae
	dc.b		$ac,$8
	dc.b		$ae
	smpsReturn

STAG_FM3_p2:
	dc.b		$b0,$4
	dc.b		$b3
	dc.b		$ad
	dc.b		$b0
	dc.b		$b0,$8
	dc.b		$ad,$4
	dc.b		$b3,$8
	dc.b		$b0,$4
	dc.b		$ad
	dc.b		$ae
	dc.b		$a7,$8
	dc.b		$a9
	smpsReturn

STAG_FM3_p3:
	dc.b		$ab,$4
	dc.b		$b3
	dc.b		$ad
	dc.b		$b0
	dc.b		$b0,$8
	dc.b		$ad,$4
	dc.b		$b3,$8
	dc.b		$b0,$4
	dc.b		$ad
	dc.b		$ae
	dc.b		$a7,$8
	dc.b		$a9
	smpsReturn

STAG_FM3_p4:
	dc.b		$80,$40
	smpsReturn

STAG_FM3_p5:
	dc.b		$e7,$20
	smpsFMvoice	$0
	dc.b		$be,$2
	dc.b		$bf,$6
	dc.b		$ba,$4
	dc.b		$bf,$8
	dc.b		$c1
	dc.b		$c1,$2
	dc.b		$c3
	smpsReturn

STAG_FM3_p6:
	dc.b		$e7,$14
	dc.b		$bf,$c
	dc.b		$bc,$2
	dc.b		$c1,$12
	dc.b		$be,$8
	dc.b		$ba,$4
	smpsReturn

STAG_FM3_p7:
	dc.b		$e7,$14
	dc.b		$be,$2
	dc.b		$bf
	dc.b		$ba,$4
	dc.b		$bc,$18
	dc.b		$c
	smpsReturn

STAG_FM3_p8:
	dc.b		$b8,$2
	dc.b		$be,$12
	dc.b		$ba,$c
	dc.b		$b7,$20
	smpsReturn

STAG_FM3_p9:
	dc.b		$e7,$20
	dc.b		$be,$2
	dc.b		$bf,$6
	dc.b		$ba,$4
	dc.b		$bf,$8
	dc.b		$c1
	dc.b		$c1,$2
	dc.b		$c3
	smpsReturn

STAG_FM3_pa:
	dc.b		$e7,$14
	dc.b		$c3,$2
	dc.b		$c4,$6
	dc.b		$c3,$4
	dc.b		$be,$14
	dc.b		$8
	dc.b		$c1,$4
	smpsReturn

STAG_FM3_pb:
	dc.b		$e7,$14
	dc.b		$c1,$2
	dc.b		$c3
	dc.b		$be,$4
	dc.b		$bf,$18
	dc.b		$bc,$c
	smpsReturn

STAG_FM3_pc:
	dc.b		$b8,$2
	dc.b		$be,$12
	dc.b		$bf,$2
	dc.b		$c1,$a
	dc.b		$bc,$20
	smpsReturn

STAG_FM3_pe:
	dc.b		$ba,$10
	dc.b		$b5,$c
	dc.b		$bc,$24
	smpsReturn

STAG_FM3_pf:
	dc.b		$e7,$20
	smpsReturn

; Pattern data for FM4
STAG_FM4_p0:
	smpsFMvoice	$0
	dc.b		$a4,$20
	dc.b		$4
	dc.b		$8
	dc.b		$4
	dc.b		$a0,$8
	dc.b		$a2
	smpsReturn

STAG_FM4_p4:
	dc.b		$a4,$3
	dc.b		$a4
	dc.b		$a4,$2
	dc.b		$8
	dc.b		$3
	dc.b		$a4
	dc.b		$a4,$2
	dc.b		$8
	dc.b		$a5
	dc.b		$a5
	dc.b		$a4,$3
	dc.b		$a4
	dc.b		$a4,$2
	dc.b		$8
	smpsReturn

STAG_FM4_p5:
	dc.b		$a4,$3
	dc.b		$a4
	dc.b		$a4,$2
	dc.b		$8
	dc.b		$a3
	dc.b		$a3
	dc.b		$a4,$4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	smpsReturn

STAG_FM4_p6:
	dc.b		$a4,$4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	smpsReturn

STAG_FM4_p7:
	dc.b		$a2,$4
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	smpsReturn

STAG_FM4_p8:
	dc.b		$a2,$4
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a2
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	smpsReturn

STAG_FM4_p9:
	dc.b		$a4,$4
	dc.b		$a4
	dc.b		$a7
	dc.b		$a7
	dc.b		$a6
	dc.b		$a6
	dc.b		$a5
	dc.b		$a5
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	dc.b		$a4
	smpsReturn

STAG_FM4_pd:
	dc.b		$a4,$4
	dc.b		$a4
	dc.b		$a7
	dc.b		$a7
	dc.b		$a6
	dc.b		$a6
	dc.b		$a5
	dc.b		$a5
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	dc.b		$a0
	smpsReturn

STAG_FM4_pf:
	dc.b		$a4,$4
	dc.b		$a4
	dc.b		$a7
	dc.b		$a7
	dc.b		$a6
	dc.b		$a6
	dc.b		$a5
	dc.b		$a5
	smpsReturn

; Pattern data for PSG1
STAG_PSG1_p0:
	dc.b		$80,$40
	smpsReturn

STAG_PSG1_p1:
	dc.b		$e7,$40
	smpsReturn

STAG_PSG1_p4:
	smpsPSGvoice	$6
	dc.b		$c3,$3
	dc.b		$c3
	dc.b		$c3,$2
	dc.b		$8
	dc.b		$3
	dc.b		$c3
	dc.b		$c3,$2
	dc.b		$8
	dc.b		$c4
	dc.b		$c4
	dc.b		$c3,$3
	dc.b		$c3
	dc.b		$c3,$2
	dc.b		$8
	smpsReturn

STAG_PSG1_p5:
	dc.b		$c3,$3
	dc.b		$c3
	dc.b		$c3,$2
	dc.b		$8
	dc.b		$c2
	dc.b		$c2
	dc.b		$b7,$20
	smpsReturn

STAG_PSG1_p6:
	dc.b		$e7,$20
	dc.b		$be
	smpsReturn

STAG_PSG1_p7:
	dc.b		$e7,$20
	dc.b		$bc
	smpsReturn

STAG_PSG1_p8:
	dc.b		$c1,$14
	dc.b		$c
	dc.b		$c3,$20
	smpsReturn

STAG_PSG1_p9:
	dc.b		$e7,$20
	dc.b		$b7
	smpsReturn

STAG_PSG1_pd:
	dc.b		$e7,$20
	dc.b		$bc,$14
	dc.b		$b8,$c
	smpsReturn

STAG_PSG1_pe:
	dc.b		$be,$10
	dc.b		$c1,$c
	dc.b		$bc,$24
	smpsReturn

STAG_PSG1_pf:
	dc.b		$e7,$20
	smpsReturn

; Pattern data for PSG2
STAG_PSG2_p0:
	dc.b		$80,$40
	smpsReturn

STAG_PSG2_p1:
	dc.b		$e7,$40
	smpsReturn

STAG_PSG2_p4:
	smpsPSGvoice	$6
	dc.b		$c8,$3
	dc.b		$c8
	dc.b		$c8,$2
	dc.b		$8
	dc.b		$3
	dc.b		$c8
	dc.b		$c8,$2
	dc.b		$8
	dc.b		$c9
	dc.b		$c9
	dc.b		$c8,$3
	dc.b		$c8
	dc.b		$c8,$2
	dc.b		$8
	smpsReturn

STAG_PSG2_p5:
	dc.b		$c8,$3
	dc.b		$c8
	dc.b		$c8,$2
	dc.b		$8
	dc.b		$c7
	dc.b		$c7
	dc.b		$bc,$20
	smpsReturn

STAG_PSG2_p6:
	dc.b		$e7,$20
	dc.b		$ba
	smpsReturn

STAG_PSG2_p7:
	dc.b		$e7,$20
	dc.b		$bf
	smpsReturn

STAG_PSG2_p8:
	dc.b		$be,$14
	dc.b		$c4,$c
	dc.b		$bf,$20
	smpsReturn

STAG_PSG2_p9:
	dc.b		$e7,$20
	dc.b		$bc
	smpsReturn

STAG_PSG2_pd:
	dc.b		$e7,$20
	dc.b		$bf,$14
	dc.b		$bc,$c
	smpsReturn

STAG_PSG2_pe:
	dc.b		$ba,$10
	dc.b		$be,$c
	dc.b		$bf,$24
	smpsReturn

STAG_PSG2_pf:
	dc.b		$e7,$20
	smpsReturn

; Pattern data for PSG3 (Noise)
STAG_PSG3_p0:
	dc.b		$80,$20
	smpsPSGvoice	$1
	dc.b		$82,$2
	dc.b		$80
	smpsPSGvoice	$2
	dc.b		$82,$1
	dc.b		$80,$7
	dc.b		$82,$1
	dc.b		$80,$13
	smpsReturn

STAG_PSG3_p1:
	dc.b		$e7,$40
	smpsReturn

STAG_PSG3_p2:
	dc.b		$e7,$8
	smpsPSGvoice	$1
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	smpsReturn

STAG_PSG3_p3:
	smpsPSGvoice	$1
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	smpsReturn

STAG_PSG3_p5:
	dc.b		$e7,$28
	smpsPSGvoice	$1
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	smpsReturn

STAG_PSG3_p7:
	smpsPSGvoice	$1
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$e
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	smpsReturn

STAG_PSG3_pf:
	smpsPSGvoice	$1
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	dc.b		$82,$2
	dc.b		$80,$6
	smpsReturn

; Pattern data for DAC
STAG_DAC_p0:
	dc.b		StagCymbal,$4
	dc.b		StagKick,$1
	dc.b		$80,$6
	dc.b		$15
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$7
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagCymbal,$8
	dc.b		StagCymbal
	smpsReturn

STAG_DAC_p1:
	dc.b		StagKick,$1
	dc.b		$80,$2
	dc.b		$1
	dc.b		StagCymbal,$8
	dc.b		StagKick,$1
	dc.b		$80,$2
	dc.b		$1
	dc.b		$8c,$2
	dc.b		$8d,$1
	dc.b		$80
	dc.b		$8e,$3
	dc.b		$80,$1
	dc.b		$8d,$2
	dc.b		$8e,$1
	dc.b		$80
	dc.b		$86,$3
	dc.b		$80,$1
	dc.b		StagCymbal,$4
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		StagKick,$3
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	smpsReturn

STAG_DAC_p2:
	dc.b		StagCymbal,$4
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		$80
	smpsReturn

STAG_DAC_p3:
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		StagSnare
	dc.b		$80
	smpsReturn

STAG_DAC_p4:
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		$80,$6
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		$80,$6
	dc.b		StagCymbal,$8
	dc.b		StagSnare,$2
	dc.b		$80,$6
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		$80,$6
	smpsReturn

STAG_DAC_p5:
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		$80,$6
	dc.b		StagCymbal,$8
	dc.b		StagSnare,$2
	dc.b		$80,$1
	dc.b		$5
	dc.b		StagCymbal,$4
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	smpsReturn

STAG_DAC_p6:
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	smpsReturn

STAG_DAC_p7:
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		$80
	dc.b		StagCymbal,$4
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	smpsReturn

STAG_DAC_pf:
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagKick
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80,$3
	dc.b		StagSnare,$2
	dc.b		$80
	dc.b		StagKick,$1
	dc.b		$80
	dc.b		StagSnare,$2
	dc.b		StagSnare
	dc.b		$80
	smpsReturn

STAG_Voices:
	dc.b	$38,$33,$1,$51,$1,$10,$13,$1a,$1b,$f,$1f,$1f,$1f,$1,$1,$1
	dc.b	$1,$33,$3,$3,$8,$16,$1a,$19,$80	; Voice 0 (DangerousSeed-Jupiter-A:FM2 Distortion Synth 2 (Mod $1E, $01, $05, $05))
	dc.b	$38,$a,$70,$30,$0,$1f,$1f,$5f,$5f,$12,$e,$a,$a,$0,$4,$4
	dc.b	$3,$26,$26,$26,$26,$23,$2d,$12,$80	; Voice 1 (DangerousSeed-Jupiter-7)
	even
