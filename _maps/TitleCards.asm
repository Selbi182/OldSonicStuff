; ---------------------------------------------------------------------------
; Sprite mappings - zone title cards
; ---------------------------------------------------------------------------

; Map_Obj34:
		dc.w byte_C9FE-Map_obj34	; $00
		dc.w byte_CA2C-Map_obj34	; $01
		dc.w byte_CA5A-Map_obj34	; $02
		dc.w byte_CA7A-Map_obj34	; $03
		dc.w byte_CAA8-Map_obj34	; $04
		dc.w byte_CADC-Map_obj34	; $05
		dc.w byte_CB10-Map_obj34	; $06
		dc.w byte_CB26-Map_obj34	; $07
		dc.w byte_CB31-Map_obj34	; $08
		dc.w byte_CB3C-Map_obj34	; $09
		dc.w byte_CB31X-Map_obj34	; $0A
		dc.w byte_CB3CX-Map_obj34	; $0B
		dc.w byte_CB3CXX-Map_obj34	; $0C
		dc.w byte_CB3CXXX-Map_obj34	; $0D
		dc.w byte_CB3CXXXX-Map_obj34	; $0E
		dc.w byte_CB47-Map_obj34	; $0F
		dc.w byte_CB8A-Map_obj34	; $10
		dc.w byte_CA7AX-Map_obj34	; $11
		dc.w byte_CADCX-Map_obj34	; $12
		dc.w byte_CA7Axx-Map_obj34	; $13


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

byte_CA7Axx	dc.b 6	;  STAR LIGHT | UNREAL
		dc.b $F8, 5, 0, $46, $EC	; U
		dc.b $F8, 5, 0, $2E, $FC	; N
		dc.b $F8, 5, 0, $3A, $C	; R
		dc.b $F8, 5, 0, $10, $1C	; E
		dc.b $F8, 5, 0, 0, $2C		; A
		dc.b $F8, 5, 0, $26, $3C	; L

byte_CAA8:	dc.b 7	;  SPRING YARD | UBERHUB
		dc.b $F8, 5, 0, $46, $DC	; U
		dc.b $F8, 5, 0, 4, $EC		; B
		dc.b $F8, 5, 0, $10, $FC	; E
		dc.b $F8, 5, 0, $3A, $C	; R
		dc.b $F8, 5, 0, $1C, $1C	; H
		dc.b $F8, 5, 0, $46, $2C	; U
		dc.b $F8, 5, 0, 4, $3C		; B

byte_CADC:	dc.b $A	;  SCRAP BRAIN | GREEN HILL
		dc.b $F8, 5, 0, $18, $B4	; G
		dc.b $F8, 5, 0, $3A, $C4	; R
		dc.b $F8, 5, 0, $10, $D4	; E
		dc.b $F8, 5, 0, $10, $E4	; E
		dc.b $F8, 5, 0, $2E, $F4	; N
		dc.b $F8, 0, 0, $56, $4	; Space
		dc.b $F8, 5, 0, $1C, $14	; H
		dc.b $F8, 1, 0, $20, $24	; I
		dc.b $F8, 5, 0, $26, $2C	; L
		dc.b $F8, 5, 0, $26, $3C	; L

byte_CADCX:	dc.b 8	;  SCRAP BRAIN | TUTORIAL
		dc.b $F8, 5, 0, $42, $D4	; T
		dc.b $F8, 5, 0, $46, $E4	; U
		dc.b $F8, 5, 0, $42, $F4	; T
		dc.b $F8, 5, 0, $32, $4	; O
		dc.b $F8, 5, 0, $3A, $14	; R
		dc.b $F8, 1, 0, $20, $24	; I
		dc.b $F8, 5, 0, 0, $2C		; A
		dc.b $F8, 5, 0, $26, $3C	; L

byte_CB10:	dc.b 5			; ZONE
		dc.b $F8, 5, 0, $36, $D2	;P
		dc.b $F8, 5, 0, $26, $E2	;L
		dc.b $F8, 5, 0, 0, $F2		;A
		dc.b $F8, 5, 0, 8, $2		;C
		dc.b $F8, 5, 0, $10, $12	;E

byte_CA7AX:	dc.b $A	;  STAR LIGHT | SCAR NIGHT
		dc.b $F8, 5, 0, $3E, $B4	; S
		dc.b $F8, 5, 0, 8, $C4		; C
		dc.b $F8, 5, 0, 0, $D4		; A
		dc.b $F8, 5, 0, $3A, $E4	; R
		dc.b $F8, 0, 0, $56, $F4	; Space
		dc.b $F8, 5, 0, $2E, $4	; N
		dc.b $F8, 1, 0, $20, $14	; I
		dc.b $F8, 5, 0, $18, $1C	; G
		dc.b $F8, 5, 0, $1C, $2C	; H
		dc.b $F8, 5, 0, $42, $3C	; T
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
byte_CB3CXXX:	dc.b 2			; ACT 7
		dc.b 4,	$C, 0, $53, $EC
		dc.b $F4, 6, 0, $95, 7	
byte_CB3CXXXX:	dc.b 2			; ACT 8
		dc.b 4,	$C, 0, $53, $EC
		dc.b $F4, 6, 0, $9B, 7	
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