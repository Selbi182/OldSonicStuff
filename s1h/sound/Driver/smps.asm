;
;  DZ80 V3.4.1 Z80 Disassembly of z80nodata.bin
;  2007/09/18 15:48
;

;
;  Sonic 1 Z80 Driver disassembly by Puto.
;  Should be assembled with AS (though it should be easily portable to other assemblers if necessary).
;
	cpu z80
	listing off
	phase	0

AlignValueZ80 = 10h

DAC_Panning	equ	1FFDh		; I *THINK* this is for the panning of the DAC. I'm not sure though, so don't quote me on this. 
Sample_to_Play	equ	1FFFh		; Sample to play, the 68K will move into this locatiton whatever sample that's supposed to be played.
SampleFinish    equ     1FFAh           ; O 68k checa esse endereço para não fazer mais pedidos de samples durante a reprodução do sample que deverá ser totalmente reproduzido.
YM2612_A0	equ	4000h		; The location where the Z80 needs to move shit over in order to play it with the DAC.
ROM_Bank	equ	6000h		; This location points to the ROM bank which the Z80 has access to (by default in S1, 7, aka $78000)
DAC1_Location   equ     8000h				;81
DAC2_Location   equ     8214h				;82
DAC3_Location   equ     8CB8h				;83
DAC4_Location   equ     91B7h				;84
DAC5_Location   equ     96A6h				;85
DAC6_Location   equ     00A174h				;86
DAC7_Location   equ     00A81Bh				;87
DAC8_Location   equ     00AB9Ah				;88
DAC9_Location   equ     00B0E9h				;89
DACA_Location   equ     00B6ADh				;8A
DACB_Location   equ     00C061h				;8B
DACC_Location   equ     00D288h				;8C
DACD_Location   equ     00D8AAh				;8D
DACE_Location   equ     00E205h				;8E
DACF_Location   equ     00ED41h				;8F
DAC10_Location  equ     00FC85h				;90
DAC11_Location  equ     00F4E0h				;91
DAC12_Location	equ	00F840h				;92
DAC13_Location  equ     9706h				;93
DAC14_Location  equ     9B8Dh				;94
DAC15_Location  equ     8000h				;95
DAC16_Location  equ     8476h				;96
DAC17_Location  equ     00DE8Dh				;97
DAC18_Location  equ     9907h				;98
DAC19_Location  equ     00A173h				;99
DAC1A_Location  equ     00AA30h				;9A
DAC1B_Location  equ     00AFE0h				;9B
DAC1C_Location  equ     00B4B2h				;9C
DAC1D_Location  equ     00B6B6h				;9D
DAC1E_Location  equ     00C012h				;9E
DAC1F_Location  equ     00C544h				;9F
DAC20_Location  equ     00EBB6h				;A0
DAC21_Location  equ     00EF08h				;A1
DAC22_Location  equ     8000h				;A2
DAC23_Location  equ     9870h				;A3
DAC24_Location  equ     00F678h				;A4
DAC25_Location  equ     00F879h				;A5
DAC26_Location  equ     00BDA9h				;A6
DAC27_Location  equ     00C496h				;A7
DAC28_Location  equ     00FA7Ah				;A8
DAC29_Location  equ     00D1B9h				;A9
DAC2A_Location  equ     00EC4Ch				;AA
DAC2B_Location  equ     00F6F2h				;AB
DAC2C_Location  equ     00FCDEh				;AC
DAC2D_Location  equ     00FE92h				;AD
DAC2E_Location  equ     00FE92h				;AE
DAC2F_Location  equ     00FE92h				;AF
DAC30_Location  equ     008000h				;B0
DAC31_Location  equ     00861Ch				;B1
DAC32_Location	equ	008E18h				;B2
DAC33_Location	equ	009564h				;B3
DAC34_Location	equ	009B86h				;B4
DAC35_Location	equ	009B86h				;B5
DAC36_Location	equ	009FEFh				;B6
DAC37_Location	equ	009FEFh				;B7
DAC38_Location	equ	009FEFh				;B8
DAC39_Location	equ	00B268h				;B9

DAC1_Size       equ     0213h
DAC2_Size       equ     0AA3h
DAC3_Size       equ     04FEh
DAC4_Size       equ     04EEh
DAC5_Size       equ     005Fh
DAC6_Size       equ     06A6h
DAC7_Size       equ     037Eh
DAC8_Size       equ     054Eh
DAC9_Size       equ     05C3h
DACA_Size       equ     09B3h
DACB_Size       equ     1226h
DACC_Size       equ     0621h
DACD_Size       equ     095Ah
DACE_Size       equ     0B3Ah
DACF_Size       equ     0794h
DAC10_Size      equ     02CEh
DAC11_Size      equ     01FFh
DAC12_Size	equ	040Dh
DAC13_Size	equ	0486h 
DAC14_Size      equ     046Ch
DAC15_Size      equ     0475h
DAC16_Size      equ     0DBDh
DAC17_Size      equ     0BD2h
DAC18_Size      equ     086Bh
DAC19_Size      equ     08BCh
DAC1A_Size      equ     05A7h
DAC1B_Size      equ     04C8h
DAC1C_Size      equ     0203h
DAC1D_Size      equ     095Bh
DAC1E_Size      equ     0531h
DAC1F_Size      equ     2671h
DAC20_Size      equ     0351h
DAC21_Size      equ     076Fh
DAC22_Size      equ     186Fh
DAC23_Size      equ     2538h
DAC24_Size      equ     0200h
DAC25_Size      equ     0200h
DAC26_Size      equ     06ECh
DAC27_Size      equ     0D22h
DAC28_Size      equ     0417h
DAC29_Size      equ     0CD3h
DAC2A_Size      equ     0AA5h
DAC2B_Size      equ     05EBh
DAC2C_Size      equ     0310h
DAC2D_Size      equ     0160h
DAC2E_Size      equ     0160h
DAC2F_Size      equ     0160h
DAC30_Size      equ     0608h
DAC31_Size      equ     0410h
DAC32_Size	equ	074Ch
DAC33_Size	equ	0622h
DAC34_Size	equ	0469h
DAC35_Size	equ	0469h
DAC36_Size	equ	1280h
DAC37_Size	equ	1280h
DAC38_Size	equ	1280h
DAC39_Size	equ	03DFh
;
Z80Driver_Start:	
	di				; Disable interrupts
	di
	di
	ld	sp,1FFCh		; Initialize the stack pointer at address 1FFCh (though it isn't actually used throughout the whole driver)
	ld	ix,YM2612_A0		; ix=4000h
	xor	a			; a=0
	ld	(DAC_Panning),a		; 1FFDh=0
	ld	(Sample_to_Play),a	; 1FFFh=0
Z80_InitLoadBank: ; isso carrega o banco inicialmente, é importante lembrar de NÃO remover isso para evitar problemas.
	ld	a,1			; a=1
	ld	(ROM_Bank),a		; 6000h=1
	ld	b,8             	; b=8
	ld	a,0		        ; a = 0, o banco correto será definido depois.
	
Z80_Init_Loop:	
	ld	(ROM_Bank),a		; O banco aqui não foi definido, mas isso não interfere em nada pois o banco será definido depois.
	rrca				; rotate right circular register a (whatever the fuck that means, I think it shifts right anyway)
	djnz	Z80_Init_Loop		; decrement and loop if not zero
	jr	Load_Sample		; branch to Load_Sample


	db	0			; I have no idea what all this data's for...
	db	1
	db	2
	db	4
	db	8
	db	10h
	db	20h
	db	40h
	db	80h
	db	0FFh
	db	0FEh
	db	0FCh
	db	0F8h
	db	0F0h 
	db	0E0h 
	db	0C0h 

Load_Sample:	
        xor      a                      ; a = 0
        ld      (SampleFinish),a        ; sempre que um sample terminar de ser reproduzido, 00 deverá ser carregado em $A01FFA
	ld	hl,Sample_to_Play	; Load the address 1FFFh to register hl.

Wait_for_DAC_Request:	
	ld	a,(hl)			; a = Current sample to play.
	or	a			; if a == 0
	jp	p,Wait_for_DAC_Request	; Loop until we get a request to play a DAC sample
	sub	81h			; Subtract 81h from the obtained DAC value.
	ld	(hl),a			; Load the subtracted value to 1FFFh (eh?)
	ld	de,0			; de = 0
	ld	iy,PCM_Table		; Load the PCM Table to index register iy.
;-------------------------------------------------------------------------------	
        and     a, 00F0h
        rra                             ; rotacionar o bits 5 vezes
        rra
        rra
        rra
        rra     
        ld      b, a                    ; carregar em b o valor de a
        ld      a, (1FFFh)
;-------------------------------------------------------------------------------        
        sla	a			; Arithmetically shift left, 3 times (a=a*8)
	sla	a
	sla	a
;	ld	b,0			; b = 0
	ld	c,a			; c = a
	add	iy,bc			; Add the contents of bc (word formed from b and c) to index register iy, to get to the proper slot in the table
S1HLZ80_ChangeBank: ; essa rotina define o banco que o DAC sample irá usar
	ld	a,1			; a=1
	ld	(ROM_Bank),a		; 6000h=1
	ld	b,8             	; b=8
	ld	a,(iy+6)		; a = iy+6, iy+6 é o byte $06 no PCM_Table, ele define o banco
	
Z80_ChangeBank_Loop:	
	ld	(ROM_Bank),a		; 6000h = iy+6, isso irá definir o banco para o sample que será reproduzido
	rrca				; rotate right circular register a (whatever the fuck that means, I think it shifts right anyway)
	djnz	Z80_ChangeBank_Loop
; Final do modificador de banco, continuar carregando o sample:
        ld      a,(iy+7)                ; Definição se o sample deverá ser totalmente reproduzido
        ld      (SampleFinish),a
	ld	e,(iy+0)		; e = iy
	ld	d,(iy+1)		; d = iy+1 (de = location of the DAC sample)
	ld	c,(iy+2)		; c = iy+2
	ld	b,(iy+3)		; b = iy+3 (bc = size of the DAC sample)
	exx				; Switches to an alternate set of data registers
	ld	d,80h			; d = 80h
	ld	hl,DAC_Panning		; Load address 1FFDh into register pair hl
	ld	(hl),d			; Move 80h onto address 1FFDh
	ld	(ix+0),2Bh		; Move 2Bh onto the address pointed to by ix (4000h, I believe)
	ld	e,2Ah			; e = 20h
	ld	c,(iy+4)		; c = iy+4 (pitch of the DAC sample)
	ld	(ix+1),d		; 4001h = 80h
	ld	(hl),0			; 1FFDh = 0
	exx				; Switch back to the normal registers
	ld	h,0			; h = 0
PlayPCM_Loop:	
	ld	a,(de)			; a = (de) 
	and	0F0h			; a = a & F0h
	rrca				; Shift-right 4 times with rotation (Divide by 16/10h)
	rrca
	rrca
	rrca
	add	a,22h			; a = a+22h
	ld	l,a			; l = a
	ld	a,(hl)			; a = (Contents of 1FFDh) 
	exx				; Switch to alternate registers
	add	a,d			; a = a+d
	ld	d,a			; d = a
	ld	(hl),l			; 1FFDh = l
	ld	(ix+0),e		; 4000h = e
	ld	(ix+1),d		; 4001h = d
	ld	(hl),h			; 1FFDh = h 
	ld	b,c			; b = c (Load pitch into register b)
loop_8E:	
	djnz	loop_8E			; Decrement b, jump if not 0 to loop_8E	(This slows down the rate at which samples are played by intentionally lagging the Z80 at this point. Removing this and the similar comparison at loop_A4 causes all samples to play with a pitch of 1)
	exx				; Switch to normal registers
	ld	a,(de)			; a = (de)
	and	0Fh			; a = a & 0Fh
	add	a,22h			; a = a + 22h
	ld	l,a			; l = a
	ld	a,(hl)			; a = 1FFDh
	exx				; Switch to alternate registers
	add	a,d			; a = a + d
	ld	d,a			; d = a
	ld	(hl),l			; 1FFDh = l
	ld	(ix+0),e		; 4000h = e
	ld	(ix+1),d		; 4001h = d
	ld	(hl),h			; 1FFDh = h
	ld	b,c			; b = c
loop_A4:	
	djnz	loop_A4			; Decrement b, jump if not 0 to loop_A4 (Read the loop_8E comment for more info)
	exx				; Switch to normal registers
	ld	a,(Sample_to_Play)	; Load the sample we're playing onto register a
	bit	7,a			; Test bit 7 of register a
	jp	nz,Load_Sample		; Jump if not 0 to Load_Sample
	inc	de			; Increment de (Location of the DAC sample)
	dec	bc			; Decrement bc (Size of DAC sample)
	ld	a,c			; a = c
	or	b			; a = a or b
	jp	nz,PlayPCM_Loop		; Jump if a!=0 to PlayPCM_Loop
	jp	Load_Sample		; Finished playing the PCM sample, so now jump back to Load_Sample


; Index dos samples DAC
;	
; Funcionamento desses ponteiros:
;	dw	DAC_Location	; Localização do sample no banco
;	dw	DAC1_Size       ; Tamanho do sample
;	dw	000Bh		; Velocidade (maior valor, mais lento, menor, mais rápido)
;	db	24h             ; Localização do banco (multiplicar por $10000 para obter localização real)
;	db      00h             ; Define se o sample deve ser totalmente reproduzido (00 = Não, 01 = Sim)


PCM_Table:
	dw	DAC1_Location	; 01 - Dance Kick (Sonic Advance 3)
	dw	DAC1_Size
	dw	000Bh		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACF_Location	;  Sonic 3 Snare sample
	dw	DACF_Size
	dw	0003h		; Pitch = 17h
	db	AlignValueZ80
	db	00h

	;dw	DAC2_Location	; 02 - Open Snare sample (The Hybrid Front)
	;dw	DAC2_Size
	;dw	0010h		; Pitch = 1h
	;db	AlignValueZ80
	;db	00h
	
	dw	DAC3_Location	; 03 - Sonic 2 Beta Synth Drum
	dw	DAC3_Size
	dw	000Ah		; Pitch = 1Bh
	db	AlignValueZ80
	db      00h
	
	dw	DAC4_Location	; 04 - Clap (Sonic 3 - Sample $8F)
	dw	DAC4_Size
	dw	0008h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC15_Location
	dw	DAC15_Size
	dw	000Dh
	db	AlignValueZ80+1h
	db      00h
	
	dw	DAC6_Location	; Kick sample
	dw	DAC6_Size
	dw	0017h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC7_Location	; Kick sample
	dw	DAC7_Size
	dw	0039h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC8_Location	; Kick sample
	dw	DAC8_Size
	dw	0006h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC9_Location	; Kick sample
	dw	DAC9_Size
	dw	0012h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	;dw	DACA_Location	; Kick sample
	;dw	DACA_Size
	;dw	000Bh		; Pitch = 17h
	;db	AlignValueZ80
	;db      00h
	
	;dw	DACB_Location	; Kick sample
	;dw	DACB_Size
	;dw	0004h		; Pitch = 17h
	;db	AlignValueZ80
	;db      00h

	dw	DACC_Location	; Kick sample		$8A	tom
	dw	DACC_Size
	dw	0005h		; Pitch = 17h
	db	AlignValueZ80
	db      00h

	dw	DACC_Location	; Kick sample		$8B	tom
	dw	DACC_Size
	dw	0003h		; Pitch = 17h
	db	AlignValueZ80
	db      00h

	dw	DACC_Location	; Kick sample		$8C	tom
	dw	DACC_Size
	dw	0001h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACD_Location	; Kick sample
	dw	DACD_Size
	dw	0003h		; Pitch = 17h
	db	AlignValueZ80
	db      00h

	;dw	DAC2A_Location			; C2 - Can't Let Her Get Away sample
	;dw	DAC2A_Size
	;dw	0006h
	;db	AlignValueZ80+2h
	;db      00h

	dw	DACF_Location	
	dw	DACF_Size
	dw	0003h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACF_Location	;  Sonic 3 Snare sample
	dw	DACF_Size
	dw	0003h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC10_Location	; Sonic 3 Kick sample
	dw	DAC10_Size
	dw	0003h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC3_Location	;  #11# Kick sample
	dw	DAC3_Size
	dw	000Eh		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC3_Location	;  #12$ Kick sample
	dw	DAC3_Size
	dw	0014h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC3_Location	; #13# Kick sample
	dw	DAC3_Size
	dw	0018h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC8_Location	; #14# Kick sample
	dw	DAC8_Size
	dw	001Eh		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC8_Location	; #15# Kick sample
	dw	DAC8_Size
	dw	0024h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DAC8_Location	; #16# Kick sample
	dw	DAC8_Size
	dw	0017h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACC_Location	; #17# Kick sample
	dw	DACC_Size
	dw	0014h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACC_Location	; #18# Kick sample
	dw	DACC_Size
	dw	0006h		; Pitch = 17h
	db	14h
	db      00h
	
	dw	DACC_Location	; #19# Kick sample
	dw	DACC_Size
	dw	0016h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACD_Location	; #1A# Kick sample
	dw	DACD_Size
	dw	0009h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACD_Location	; #1B# Kick sample
	dw	DACD_Size
	dw	0014h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACD_Location	; #1C# Kick sample
	dw	DACD_Size
	dw	0021h		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw	DACF_Location	;  Sonic 3 Snare (2nd pitch) 
	dw	DACF_Size
	dw	0005h		; Pitch = 17h
	db	AlignValueZ80
	db      00h

	dw	DAC11_Location	; Ristar basic Snare (Sample ID=10)
	dw	DAC11_Size
	dw	0017h		; Pitch = 17h
	db	AlignValueZ80
	db      00h

	dw	DAC12_Location	; Ristar basic Snare (Sample ID=10)
	dw	DAC12_Size
	dw	000Ch		; Pitch = 17h
	db	AlignValueZ80
	db      00h

	dw	DAC12_Location	; Ristar basic Snare (Sample ID=10)
	dw	DAC12_Size
	dw	000Ch		; Pitch = 17h
	db	AlignValueZ80
	db      00h
	
	dw      DAC5_Location
	dw      DAC5_Size
	dw      0008h
	db	AlignValueZ80
	db      00h
	
	dw      DAC13_Location	;  Sample A2
	dw      DAC13_Size
	dw      0007h
	db	AlignValueZ80
	db      00h
	
	dw      DAC13_Location	;	Sample A3 (Variação do A2)
	dw      DAC13_Size
	dw      000Bh
	db	AlignValueZ80
	db      00h
	
	dw      DAC13_Location	;	Sample A4 (Variação #2 do A2)
	dw      DAC13_Size
	dw      000Ch
	db	AlignValueZ80
	db      00h
	
	dw      DAC13_Location
	dw      DAC13_Size
	dw      0008h
	db	AlignValueZ80
	db      00h
	
	dw      DAC14_Location		; #A6 Sonic 3 Has Passed Synth Drum 1
	dw      DAC14_Size
	dw      000Ah
	db	AlignValueZ80
	db      00h
	
	dw      DAC14_Location		; #A7 Sonic 3 Has Passed Synth Drum 1
	dw      DAC14_Size
	dw      000Eh
	db	AlignValueZ80
	db      00h
	
	dw      DAC14_Location		; #A8 Sonic 3 Has Passed Synth Drum 1
	dw      DAC14_Size
	dw      0016h
	db	AlignValueZ80
	db      00h
	
	dw      DAC14_Location		; #A9 Sonic 3 Has Passed Synth Drum 1
	dw      DAC14_Size
	dw      001Ah
	db	AlignValueZ80
	db      00h
	
	dw	DAC16_Location			; Crash Cymbal - Sonic Advance 3
	dw	DAC16_Size
	dw	000Fh
	db	AlignValueZ80+1h
	db      00h

	dw	DAC17_Location			; Choir 'Oooh!' 1
	dw	DAC17_Size
	dw	000Fh
	db	AlignValueZ80+2h
	db      00h

	dw	DAC17_Location			; Choir 'Oooh!' 2
	dw	DAC17_Size
	dw	000Fh
	db	AlignValueZ80+2h
	db      00h
	
	dw	DAC17_Location			; Choir 'Oooh!' 3
	dw	DAC17_Size
	dw	000Fh
	db	AlignValueZ80+2h
	db      00h
	
	dw	DAC18_Location			; Parte 1 da sequência da Palmtree Panic Past
	dw	DAC18_Size
	dw	000Ah
	db	AlignValueZ80+1h
	db      00h

	dw	DAC19_Location			; Parte 2 da sequência da Palmtree Panic Past
	dw	DAC19_Size
	dw	000Ah
	db	AlignValueZ80+1h
	db      00h
	
	dw	DAC1A_Location			; Parte 3 da sequência da Palmtree Panic Past
	dw	DAC1A_Size
	dw	000Ah
	db	AlignValueZ80+1h
	db      00h

	dw	DAC1B_Location			; Knuckles Chaotix Snare
	dw	DAC1B_Size
	dw	001Bh
	db	AlignValueZ80+1h
	db      00h
	
	dw	DAC1C_Location			; Knuckles Chaotix Kick
	dw	DAC1C_Size
	dw	0016h
	db	AlignValueZ80+1h
	db      00h
        	
	dw	DAC1D_Location			; Crackers Snare
	dw	DAC1D_Size
	dw	000Ah
	db	AlignValueZ80+1h
	db      00h

	dw	DAC1E_Location			; Michael Jackson's "IN THE CLOSET" Snare
	dw	DAC1E_Size
	dw	000Dh
	db	AlignValueZ80+1h
	db      00h

	dw	DAC1F_Location			; Choir usado na música "Sonic Advance 3 - Chaos Angel Act 1"
	dw	DAC1F_Size
	dw	000Fh
	db	AlignValueZ80+1h
	db      00h

	dw	DAC20_Location			; Sonic 1 Kick
	dw	DAC20_Size
	dw	000Fh
	db	AlignValueZ80+1h
	db      00h
	
	dw	DAC21_Location			; Sonic 1 Snare
	dw	DAC21_Size
	dw	0001h
	db	AlignValueZ80+1h
	db      00h
	
	dw	DAC22_Location			; #FALA# 'Okay!' - Sonic Advance 3
	dw	DAC22_Size
	dw	0001h
	db	AlignValueZ80+2h
	db      01h

	dw	DAC23_Location			; #FAlA# All Right! - Sonic Advance 3
	dw	DAC23_Size
	dw	0001h
	db	AlignValueZ80+2h
	db      01h

	dw	DAC24_Location			; Marry Me (Dreams Come True) Kick
	dw	DAC24_Size
	dw	0007h
	db	AlignValueZ80+1h
	db      00h

	dw	DAC25_Location			; Marry Me (Dreams Come True) Kick - Versão Editada
	dw	DAC25_Size
	dw	0007h
	db	AlignValueZ80+1h
	db      00h

	dw	DAC26_Location			; Sonic 3 "GO!"
	dw	DAC26_Size
	dw	000Dh
	db	AlignValueZ80+2h
	db      00h

	dw	DAC27_Location			; Voice Synth Drum
	dw	DAC27_Size
	dw	000Ah
	db	AlignValueZ80+2h
	db      00h

	dw	DAC27_Location			; Voice Synth Drum - Afinação 2
	dw	DAC27_Size
	dw	000Dh
	db	AlignValueZ80+2h
	db      00h
	
	dw	DAC27_Location			; Voice Synth Drum - Afinação 3
	dw	DAC27_Size
	dw	000Dh
	db	AlignValueZ80+2h
	db      00h

	dw	DAC28_Location			; "Clap!" - Alternativo
	dw	DAC28_Size
	dw	000Dh
	db	AlignValueZ80+1h
	db      00h
	
	dw	DAC29_Location			; #FALA# 'Yes!' - Sonic CD
	dw	DAC29_Size
	dw	0006h
	db	AlignValueZ80+2h
	db      01h

	dw	DAC2A_Location			; C2 - Can't Let Her Get Away sample
	dw	DAC2A_Size
	dw	0006h
	db	AlignValueZ80+2h
	db      00h
	
	dw	DAC2B_Location			; C3 - Can't Let Her Get Away sample
	dw	DAC2B_Size
	dw	0006h
	db	AlignValueZ80+2h
	db      00h

	dw	DAC2C_Location			; Sample C4 - Chaotix Snare modificado
	dw	DAC2C_Size
	dw	0026h
	db	AlignValueZ80+2h
	db        00h

	dw	DAC2D_Location			; Sample C5 - Bate-Lata (Sonic 3 Sample 84/8A-8B)
	dw	DAC2D_Size
	dw	001Ah
	db	AlignValueZ80+1h
	db        00h

	dw	DAC2E_Location			; Sample C6 - Bate-Lata (Variação 1 - Mais grave)
	dw	DAC2E_Size
	dw	002Ah
	db	AlignValueZ80+1h
	db        00h

	dw	DAC2F_Location			; Sample C7 - Bate-Lata (Variação 1 - Mais grave)
	dw	DAC2F_Size
	dw	003Eh
	db	AlignValueZ80+1h
	db        00h
	
	dw	DAC30_Location			; Sample C8 - Dance Kick 2 (Dance Kick mais forte)
	dw	DAC30_Size
	dw	00010h
	db	AlignValueZ80+3h
	db        00h
	
	dw	DAC31_Location			; Sample C9 - Michael Jackson's Moonwalker Snare
	dw	DAC31_Size
	dw	0001Ch
	db	AlignValueZ80+3h
	db        00h
	
	dw	DAC32_Location			; Sample CA - Sonic 2's Scratch
	dw	DAC32_Size
	dw	00008h
	db	AlignValueZ80+3h
	db        00h
	
	dw	DAC33_Location			; Sample CB - Sonic 3's Sample 9B - Special Stage Snare
	dw	DAC33_Size
	dw	00010h
	db	AlignValueZ80+3h
	db        00h
		
	dw	DAC34_Location			; Sample CC - Bongo #1
	dw	DAC34_Size
	dw	00002h
	db	AlignValueZ80+3h
	db        00h
			
	dw	DAC35_Location			; Sample CD - Bongo #2
	dw	DAC35_Size
	dw	00006h
	db	AlignValueZ80+3h
	db        00h
				
	dw	DAC36_Location			; Sample CE - Ohh #1
	dw	DAC36_Size
	dw	00010h
	db	AlignValueZ80+3h
	db        00h
					
	dw	DAC37_Location			; Sample CF - Ohh #2
	dw	DAC37_Size
	dw	00012h
	db	AlignValueZ80+3h
	db        00h
	
	dw	DAC38_Location			; Sample CF - Ohh #2
	dw	DAC38_Size
	dw	00012h
	db	AlignValueZ80+3h
	db        00h
					
	dw	DAC39_Location			; Sample D0 - Ohh #3
	dw	DAC39_Size
	dw	0000Ch
	db	AlignValueZ80+3h
	db        00h
	
; Agora isso não é mais usado:

;DAC_Sample1:	binclude	"Samples/DAC1.bin"
;DAC_Sample1_End:

;DAC_Sample2:	binclude	"Samples/DAC2.bin"
;DAC_Sample2_End:

;DAC_Sample3:	binclude	"Samples/DAC3.bin"
;DAC_Sample3_End:

EndOfDriver:
	if MOMPASS==2
		if $ > 1FFCh
			fatal "The driver is too big; the maximum size it can take is 1FFCh. It currently takes \{EndOfDriver}h bytes. You won't be able to use this thing."
		else
			message "Uncompressed driver size: \{EndOfDriver}h bytes."
		endif

	;	shared	Sample3_Pitch	; Share this symbol externally (might be useful the timpani pitch changes)

		cpu 68000	; AS can't really add $A00000 in Z80, since the Z80 can't handle anything > $FFFF, so set it to 68K mode for this message.
	;	message	"The timpani pitch byte is \{Sample3_Pitch}h (or alternatively, in 68K notation, $\{Sample3_Pitch+$A00000})."
	;	message "Remember to set that in loc_71CAC."
	endif
	end
;

