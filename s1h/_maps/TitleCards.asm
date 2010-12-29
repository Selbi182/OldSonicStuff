; ---------------------------------------------------------------------------
; Sprite mappings - zone title cards
; ---------------------------------------------------------------------------

; Map_Obj34:
		dc.w byte_C9FE-Map_obj34
		dc.w byte_CA2C-Map_obj34
		dc.w byte_CA5A-Map_obj34
		dc.w byte_CA7A-Map_obj34
		dc.w byte_CAA8-Map_obj34
		dc.w byte_CADC-Map_obj34
		dc.w byte_CB10-Map_obj34
		dc.w byte_CB26-Map_obj34
		dc.w byte_CB31-Map_obj34
		dc.w byte_CB3C-Map_obj34
		dc.w byte_CB31X-Map_obj34
		dc.w byte_CB3CX-Map_obj34
		dc.w byte_CB3CXX-Map_obj34
		dc.w byte_CB47-Map_obj34
		dc.w byte_CB8A-Map_obj34

byte_C9FE:	dc.b $A	; GREEN HILL | NIGHT HILL
		dc.b $F8, 5, 0, $2E, $BC	;N
		dc.b $F8, 1, 0, $20, $CC	;I
		dc.b $F8, 5, 0, $18, $D4	;G
		dc.b $F8, 5, 0, $1C, $E4	;H
		dc.b $F8, 5, 0, $42, $F4	;T
		dc.b $F8, 0, 0, $56, $4		;Space
		dc.b $F8, 5, 0, $1C, $14	;H
		dc.b $F8, 1, 0, $20, $24	;I
		dc.b $F8, 5, 0, $26, $2C	;L
		dc.b $F8, 5, 0, $26, $3C	;L

byte_CA2C:	dc.b 9	;  LABYRINTH | LABYRINTH
		dc.b $F8, 5, 0, $26, $C4	; L
		dc.b $F8, 5, 0, 0, $D4		; A
		dc.b $F8, 5, 0, 4, $E4		; B
		dc.b $F8, 5, 0, $4A, $F4	; Y
		dc.b $F8, 5, 0, $3A, $4		; R
		dc.b $F8, 1, 0, $20, $14	; I
		dc.b $F8, 5, 0, $2E, $1C	; N
		dc.b $F8, 5, 0, $42, $2C	; T
		dc.b $F8, 5, 0, $1C, $3C	; H

byte_CA5A:	dc.b 6	;  MARBLE | RUINED
		dc.b $F8, 5, 0, $3A, $F4	; R
		dc.b $F8, 5, 0, $46, $4		; U
		dc.b $F8, 1, 0, $20, $14	; I
		dc.b $F8, 5, 0, $2E, $1C	; N
		dc.b $F8, 5, 0, $10, $2C	; E
		dc.b $F8, 5, 0, $0C, $3C	; D

byte_CA7A:	dc.b 7	;  STAR LIGHT | SPECIAL
		dc.b $F8, 5, 0, $3E, $E4	; S
		dc.b $F8, 5, 0, $36, $F4	; P
		dc.b $F8, 5, 0, $10, $4		; E
		dc.b $F8, 5, 0, 8, $14		; C
		dc.b $F8, 1, 0, $20, $24	; I
		dc.b $F8, 5, 0, 0, $2C		; A
		dc.b $F8, 5, 0, $26, $3C	; L

byte_CAA8:	dc.b $B	;  SPRING YARD | SPRING YARD
		dc.b $F8, 5, 0, $3E, $A4	; S
		dc.b $F8, 5, 0, $36, $B4	; P
		dc.b $F8, 5, 0, $3A, $C4	; R
		dc.b $F8, 1, 0, $20, $D4	; I
		dc.b $F8, 5, 0, $2E, $DC	; N
		dc.b $F8, 5, 0, $18, $EC	; G
		dc.b $F8, 0, 0, $56, $FC	; Space
		dc.b $F8, 5, 0, $4A, $C		; Y
		dc.b $F8, 5, 0, 0, $1C		; A
		dc.b $F8, 5, 0, $3A, $2C	; R
		dc.b $F8, 5, 0, $0C, $3C	; D

byte_CADC:	dc.b $B	;  SCRAP BRAIN | SCRAP BRAIN
		dc.b $F8, 5, 0, $3E, $A4	; S
		dc.b $F8, 5, 0, 8, $B4		; C
		dc.b $F8, 5, 0, $3A, $C4	; R
		dc.b $F8, 5, 0, 0, $D4		; A
		dc.b $F8, 5, 0, $36, $E4	; P
		dc.b $F8, 0, 0, $56, $F4	; Space
		dc.b $F8, 5, 0, 4, $4		; B
		dc.b $F8, 5, 0, $3A, $14	; R
		dc.b $F8, 5, 0, 0, $24		; A
		dc.b $F8, 1, 0, $20, $34	; I
		dc.b $F8, 5, 0, $2E, $3C	; N

byte_CB10:	dc.b 5			; ZONE
		dc.b $F8, 5, 0, $36, $D2	;P
		dc.b $F8, 5, 0, $26, $E2	;L
		dc.b $F8, 5, 0, 0, $F2		;A
		dc.b $F8, 5, 0, 8, $2		;C
		dc.b $F8, 5, 0, $10, $12	;E
; ---------------------------------------------------------------------------

byte_CB26:	dc.b 2			; ACT 1
		dc.b 4,	$C, 0, $53, $EC
		dc.b $F4, 2, 0,	$57, $C
byte_CB31:	dc.b 2			; ACT 2
		dc.b 4,	$C, 0, $53, $EC
		dc.b $F4, 6, 0,	$5A, 8
byte_CB3C:	dc.b 2			; ACT 3
		dc.b 4,	$C, 0, $53, $EC
		dc.b $F4, 6, 0,	$60, 8
byte_CB31X:	dc.b 2			; ACT 4
		dc.b 4, $C, 0, $53, $EC	
		dc.b $F4, $A, 0, $80, 6	
byte_CB3CX:	dc.b 2			; ACT 5
		dc.b 4, $C, 0, $53, $EC	
		dc.b $F4, 6, 0, $89, 7	
byte_CB3CXX:	dc.b 2			; ACT 6
		dc.b 4, $C, 0, $53, $EC	
		dc.b $F4, 6, 0, $8F, 7	
byte_CB47:	dc.b $D			; Oval
		dc.b $E4, $C, 0, $70, $F4
		dc.b $E4, 2, 0,	$74, $14
		dc.b $EC, 4, 0,	$77, $EC
		dc.b $F4, 5, 0,	$79, $E4
		dc.b $14, $C, $18, $70,	$EC
		dc.b 4,	2, $18,	$74, $E4
		dc.b $C, 4, $18, $77, 4
		dc.b $FC, 5, $18, $79, $C
		dc.b $EC, 8, 0,	$7D, $FC
		dc.b $F4, $C, 0, $7C, $F4
		dc.b $FC, 8, 0,	$7C, $F4
		dc.b 4,	$C, 0, $7C, $EC
		dc.b $C, 8, 0, $7C, $EC
		dc.b 0
; ---------------------------------------------------------------------------

byte_CB8A:	dc.b 7	;  FINAL | FINALOR
		dc.b $F8, 5, 0, $14, $E4	; F
		dc.b $F8, 1, 0, $20, $F4	; I
		dc.b $F8, 5, 0, $2E, $FC	; N
		dc.b $F8, 5, 0, 0, $C		; A
		dc.b $F8, 5, 0, $26, $1C	; L
		dc.b $F8, 5, 0, $32, $2C	; O
		dc.b $F8, 5, 0, $3A, $3C	; R
; ---------------------------------------------------------------------------
; Sprite mappings - "GAME OVER"	and "TIME OVER"
; ---------------------------------------------------------------------------
Map_obj39:
		include	"_maps\obj39.asm"