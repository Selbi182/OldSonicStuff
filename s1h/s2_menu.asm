;===============================================================================
; Menu do Sonic 2 No Sonic 1 reprogramado por Esrael L. G. Neto
; [ Início ]
;
; O código deste menu foi desenvolvido para funcionar com
; o disassembly do Sonic 1 feito por -> drx (www.hacking-cult.org)
; 
; Se estiver usando um disassembly diferente modifique os jumps no final do 
; código para que aponte para as rotinas equivalentes.
; 
; Para pode utilizar este menu basta fazer a seguinte modificação no código 
; original:
; Localize o label  -> loc_3242 adicione -> jmp     Level_Select_Menu
; O código deve ficar como abaixo
;               ......................
; loc_3242:
;		tst.b	($FFFFFFE0).w
;		beq.w	PlayLevel	
;		btst	#6,($FFFFF604).w 
;		beq.w	PlayLevel	  		
;		jmp     Level_Select_Menu ; <- Carrega o Menu do Sonic 2	
;		moveq	#2,d0		
;		bsr.w	PalLoad		 
;               ...............
;
; Não esqueça de incluir este asm em seu código com a diretiva include:
;               include 's2_menu.asm'
;===============================================================================  
Slow_Motion_Flag      equ $FFFFFFE1
Debug_Mode_Flag       equ $FFFFFFE2

Level_Select_Menu_snd   = $0091
Emerald_Snd             = $0093
Ring_Snd                = $00B5
Volume_Down             = $00E0
Stop_Sound              = $00E4
;-------------------------------------------------------------------------------
Level_Select_Menu:
                move.b  #Stop_Sound,d0
                bsr     Menu_Play_Music
                bsr     Menu_Pal_FadeFrom
                move    #$2700,SR
                move.w  ($FFFFF60C).w,d0
                andi.b  #$BF,d0
                move.w  d0,($00C00004)
                bsr     Menu_ClearScreen
                lea     ($00C00004),A6
                move.w  #$8004,(A6)
                move.w  #$8230,(A6)
                move.w  #$8407,(A6)
                move.w  #$8230,(A6)
                move.w  #$8700,(A6)
                move.w  #$8C81,(A6)
                move.w  #$9001,(A6)
                lea     ($FFFFAC00).w,A1
                moveq   #$00,d0
                move.w  #$00FF,d1
Offset_0x026ACA:
                move.l  d0,(A1)+
                dbra    D1,Offset_0x026ACA
                lea     ($FFFFB000).w,A1
                moveq   #$00,d0
                move.w  #$07FF,d1
Offset_0x026ADA:
                move.l  d0,(A1)+
                dbra    D1,Offset_0x026ADA
                clr.w   ($FFFFDC00).w
                move.l  #$FFFFDC00,($FFFFDCFC).w
                move.l  #$42000000,($00C00004)
                lea     (Menu_Font),A0
                bsr     Menu_NemesisDec
                move.l  #$52000000,($00C00004)
                lea     (Level_Icons),A0
                jsr     Menu_NemesisDec
;-------------------------------------------------------------------------------                
; Carrega o Mapeamento do Fundo Sonic/Miles               
;-------------------------------------------------------------------------------
                lea     ($FFFF0000),A1
                lea     (Menu_Mappings),A0
                move.w  #$6000,d0
                bsr     Menu_EnigmaDec
                lea     ($FFFF0000),A1
                move.l  #$60000003,d0
                moveq   #$27,d1
                moveq   #$1B,d2
                bsr     Menu_ShowVDPGraphics
;-------------------------------------------------------------------------------                
; Carrega o Texto do Menu de Seleção de Fases               
;-------------------------------------------------------------------------------
                lea     ($FFFF0000),A3
                move.w  #$045F,d1
Offset_0x026B4E:
                move.w  #$0000,(A3)+
                dbra    D1,Offset_0x026B4E
                lea     ($FFFF0000),A3
                lea     (Menu_Level_Select_Text),A1
                lea     (Menu_Text_Positions),A5
                moveq   #$00,d0
                move.w  #$0009,d1  ; Quantidade de textos a ser carregada e posição do Sound Test
Menu_Loop_Load_Text:
                move.w  (A5)+,d3
                lea     $00(A3,d3),A2
                moveq   #$00,d2
                move.b  (A1)+,d2
                move.w  D2,d3
Offset_0x026B7A:
                move.b  (A1)+,d0
                move.w  d0,(A2)+
                dbra    D2,Offset_0x026B7A
                move.w  #$000D,d2
                sub.w   D3,d2
                bcs.s   Offset_0x026B92
Offset_0x026B8A:
                move.w  #$0000,(A2)+
                dbra    D2,Offset_0x026B8A
Offset_0x026B92:
                move.w  #$0011,(A2)       ; Load "1"
                lea     $0050(A2),A2
                move.w  #$0012,(A2)       ; Load "2"
                lea     $0050(A2),A2
                move.w  #$0013,(A2)       ; Load "3"
                dbra    D1,Menu_Loop_Load_Text
;-------------------------------------------------------------------------------                
                moveq   #$0E,d1
                lea     $FFFFFBA0(A2),A2
Menu_Clear_Act_x:                                               ; Limpa os números dos acts não usados e carrega o "*" do Sound Test
                move.w  #$0000,(A2)                            ; Load " "
                lea     $0050(A2),A2
                dbra    D1,Menu_Clear_Act_x
                lea     $FFFFFF10(A2),A2
                move.w  #$001A,(A2)          ; Load "*"
;-------------------------------------------------------------------------------
; Carrega o Mapeamento das Asas onde são mostrados os ícones
;------------------------------------------------------------------------------- 
                lea     (Wings_Mappings),A0
                lea     ($FFFF0670),A1
                move     #$06,d1
Menu_Loop_Next_Line:
                move     #$09,d0
Menu_Loop_Load_Wings:
                move.w   (A0)+,(A1)+
                dbra     d0,Menu_Loop_Load_Wings
                add.w    #$3C,A1
                dbra     D1,Menu_Loop_Next_Line
;-------------------------------------------------------------------------------                
; Carrega o Mapeamento dos ícones               
;-------------------------------------------------------------------------------                                    
                lea     ($FFFF08C0),A1
                lea     (Icons_Mappings),A0
                move.w  #$0090,d0
                bsr     Menu_EnigmaDec
                lea     ($FFFF0000),A1
                move.l  #$40000003,d0
                moveq   #$27,d1
                moveq   #$1B,d2
                bsr     Menu_ShowVDPGraphics
;-------------------------------------------------------------------------------                
                moveq   #$00,d3
                bsr     Offset_0x027040
                clr.w   ($FFFFFF70).w
                clr.w   ($FFFFFE40).w
                clr.b   ($FFFFF711).w
                clr.w   ($FFFFF7F0).w
;------------------------------------------------------------------------------- 
		clr.l	($FFFFF7B8).w	; clear RAM adresses $F7B8 to $F7BA
	;	move.w	#$0000,($FFFFF7B8).w	; Inicializa os quadros das animações do menu
	;	move.w	#$0000,($FFFFF7B9).w	; Inicializa o contador das animações do menu 
		jsr	Dynamic_Menu           ; Chama a rotina de animação
;-------------------------------------------------------------------------------

                moveq   #$14,d0
                bsr     Menu_PalLoad1
                lea     ($FFFFFB40).w,A1
                lea     ($FFFFFBC0).w,A2
                moveq   #$07,d1
Offset_0x026C26:
                move.l  (A1),(A2)+
                clr.l   (A1)+
                dbra    D1,Offset_0x026C26
                move.b  #Level_Select_Menu_snd,d0
                bsr     Menu_Play_Music
                moveq   #$00,d0
                jsr     Menu_LoadPLC2
                move.w  #$0707,($FFFFF614).w
                clr.w   ($FFFFFFDC).w
                clr.l   ($FFFFEE00).w
                clr.l   ($FFFFEE04).w
                clr.w   ($FFFFFF0C).w
                clr.w   ($FFFFFF0E).w
                move.b  #$18,($FFFFF62A).w
                bsr     Menu_DelayProgram
                move.w  ($FFFFF60C).w,d0
                ori.b   #$40,d0
                move.w  d0,($00C00004)
                bsr     Menu_Pal_FadeTo
Menu_Main_Loop:
                move.b  #$18,($FFFFF62A).w
                bsr     Menu_DelayProgram
                move    #$2700,SR
                moveq   #$00,d3
                bsr     Offset_0x026ED8
                bsr     Offset_0x026DEC
                move.w  #$6000,d3
                bsr     Offset_0x027048
                move    #$2300,SR
                jsr     Dynamic_Menu
                bsr     Menu_RunPLC
                btst    #$04,($FFFFF604).w
                beq.s   Offset_0x026CC6
                move.w  #$0001,($FFFFFFD8).w
Offset_0x026CC6:
                move.b  ($FFFFF605).w,d0
                or.b    ($FFFFF607).w,d0
                andi.b  #$80,d0
                bne.s   Offset_0x026CD8
                bra     Menu_Main_Loop
Offset_0x026CD8:
                move.w  ($FFFFFF82).w,d0
                add.w   d0,d0
                move.w  Menu_Level_Select_Array(PC,d0),d0
                bmi     Menu_Game_Reset
                cmpi.w  #$0600,d0
                beq     Menu_Ending_Sequence
                cmpi.w  #$5555,d0
                beq     Menu_Main_Loop
                cmpi.w  #$4000,d0
                bne     Menu_Load_Level
                move.b  #$10,($FFFFF600).w
                clr.w   ($FFFFFE10).w
                move.b  #$03,($FFFFFE12).w
                move.b  #$03,($FFFFFEC6).w
                moveq   #$00,d0
                move.w  d0,($FFFFFE20).w
                move.l  d0,($FFFFFE22).w
                move.l  d0,($FFFFFE26).w
                move.w  d0,($FFFFFED0).w
                move.l  d0,($FFFFFED2).w
                move.l  d0,($FFFFFED6).w
                move.l  #$00001388,($FFFFFFC0).w
                move.l  #$00001388,($FFFFFFC4).w
                move.w  ($FFFFFF72).w,($FFFFFF70).w
                rts
Menu_Game_Reset:
                move.b  #$0000,($FFFFF600).w
                rts
Menu_Ending_Sequence:
                move.b	#$18,($FFFFF600).w
	;	move.w	#$0600,($FFFFFE10).w
	;	jmp	PlayLevel
		rts
Menu_Level_Select_Array:
                dc.w    $0000,$0001,$0002
                dc.w    $0100,$0101,$0102
                dc.w    $0200,$0201,$0202
                dc.w    $0300,$0301,$0302
                dc.w    $0400,$0401,$0402
                dc.w    $0500,$0501,$0103
                dc.w    $0502,$4000,$0600
                dc.w    $FFFF
Menu_Load_Level:
                andi.w  #$3FFF,d0
                move.w  d0,($FFFFFE10).w
                move.b  #$0C,($FFFFF600).w
                move.b  #$03,($FFFFFE12).w
                move.b  #$03,($FFFFFEC6).w
                moveq   #$00,d0
                move.w  d0,($FFFFFE20).w
                move.l  d0,($FFFFFE22).w
                move.l  d0,($FFFFFE26).w
                move.w  d0,($FFFFFED0).w
                move.l  d0,($FFFFFED2).w
                move.l  d0,($FFFFFED6).w
                nop
                nop
                move.l  #$00001388,($FFFFFFC0).w
                move.l  #$00001388,($FFFFFFC4).w
                move.b  #Volume_Down,d0
                bsr     Menu_Play_Music     
                moveq   #$00,d0
                move.w  d0,($FFFFFF8A).w
                move.w  d0,($FFFFFFDC).w
                rts
Offset_0x026DEC:
                move.b  ($FFFFF605).w,d1
                andi.b  #$03,d1
                bne.s   Offset_0x026DFC
                subq.w  #$01,($FFFFFF80).w
                bpl.s   Offset_0x026E32
Offset_0x026DFC:
                move.w  #$000B,($FFFFFF80).w
                move.b  ($FFFFF604).w,d1
                andi.b  #$03,d1
                beq.s   Offset_0x026E32
                move.w  ($FFFFFF82).w,d0
                btst    #$00,d1
                beq.s   Offset_0x026E1C
                subq.w  #$01,d0
                bcc.s   Offset_0x026E1C
                moveq   #$15,d0     ; Último item após apertar para cima
Offset_0x026E1C:
                btst    #$01,d1
                beq.s   Offset_0x026E2C
                addq.w  #$01,d0
                cmpi.w  #$0016,d0   ; Verifica qual o último item da lista
                bcs.s   Offset_0x026E2C
                moveq   #$00,d0
Offset_0x026E2C:
                move.w  d0,($FFFFFF82).w
                rts
Offset_0x026E32:
                cmpi.w  #$0015,($FFFFFF82).w ; se o item for igual muda as funções de esquerda e direita 
                bne.s   Offset_0x026E9C
                move.w  ($FFFFFF84).w,d0
                move.b  ($FFFFF605).w,d1
                btst    #$02,d1
                beq.s   Offset_0x026E4E
                subq.b  #$01,d0
                bcc.s   Offset_0x026E4E
                moveq   #$7F,d0
Offset_0x026E4E:
                btst    #$03,d1
                beq.s   Offset_0x026E5E
                addq.b  #$01,d0
                cmpi.w  #$0080,d0
                bcs.s   Offset_0x026E5E
                moveq   #$00,d0
Offset_0x026E5E:
                btst    #$06,d1
                beq.s   Offset_0x026E6C
                addi.b  #$10,d0
                andi.b  #$7F,d0
Offset_0x026E6C:
                move.w  d0,($FFFFFF84).w
                andi.w  #$0030,d1
                beq.s   Offset_0x026E9A
                move.w  ($FFFFFF84).w,d0
                addi.w  #$0080,d0
                bsr     Menu_Play_Music 
                lea     (Code_Debug_Mode),A0   
                lea     (Code_All_Emeralds),A2 
                lea     ($FFFFFF0A).w,A1
                moveq   #$01,d2
                bsr     Menu_Code_Test 
Offset_0x026E9A:
                rts
Offset_0x026E9C:
                move.b  ($FFFFF605).w,d1
                andi.b  #$0C,d1
                beq.s   Offset_0x026EB2
                move.w  ($FFFFFF82).w,d0
                move.b  Menu_Left_Right_Select(PC,d0),d0
                move.w  d0,($FFFFFF82).w
Offset_0x026EB2:
                rts
Menu_Left_Right_Select:                   
                dc.b    $0F,$10,$11,$12,$12,$12,$13,$13,$13,$14,$14,$14,$15,$15,$15
                dc.b    $00,$01,$02,$03,$06,$09,$0C
Offset_0x026ED8:
                lea     ($FFFF0000),A4
                lea     (Menu_Text_Highlight),A5
                lea     ($00C00000),A6
                moveq   #$00,d0
                move.w  ($FFFFFF82).w,d0
                lsl.w   #$02,d0
                lea     $00(A5,d0),A3
                moveq   #$00,d0
                move.b  (A3),d0
                mulu.w  #$0050,d0
                moveq   #$00,d1
                move.b  $0001(A3),d1
                add.w   D1,d0
                lea     $00(A4,d0),A1
                moveq   #$00,d1
                move.b  (A3),d1
                lsl.w   #$07,d1
                add.b   $0001(A3),d1
                addi.w  #$C000,d1
                lsl.l   #$02,d1
                lsr.w   #$02,d1
                ori.w   #$4000,d1
                swap.w  D1
                move.l  D1,$0004(A6)
                moveq   #$0E,d2    ; Quantidade de letras a selecionar (Highlight)
Offset_0x026F28:                
                move.w  (A1)+,d0
                add.w   D3,d0
                move.w  d0,(A6)
                dbra    D2,Offset_0x026F28
                addq.w  #$02,A3
                moveq   #$00,d0
                move.b  (A3),d0
                beq.s   Offset_0x026F6C
                mulu.w  #$0050,d0
                moveq   #$00,d1
                move.b  $0001(A3),d1
                add.w   D1,d0
                lea     $00(A4,d0),A1
                moveq   #$00,d1
                move.b  (A3),d1
                lsl.w   #$07,d1
                add.b   $0001(A3),d1
                addi.w  #$C000,d1
                lsl.l   #$02,d1
                lsr.w   #$02,d1
                ori.w   #$4000,d1
                swap.w  D1
                move.l  D1,$0004(A6)
                move.w  (A1)+,d0
                add.w   D3,d0
                move.w  d0,(A6)
Offset_0x026F6C:
                cmpi.w  #$0015,($FFFFFF82).w  ; Se for igual seleciona o número do Sound Test
                bne.s   Offset_0x026F78
                bsr     Offset_0x026F7A
Offset_0x026F78:
                rts
Offset_0x026F7A:
                move.l  #$49C60003,($00C00004) ; Posição dos números do Sound Test
                move.w  ($FFFFFF84).w,d0
                move.b  d0,d2
                lsr.b   #$04,d0
                bsr.s   Offset_0x026F90
                move.b  D2,d0
Offset_0x026F90:
                andi.w  #$000F,d0
                cmpi.b  #$0A,d0
                bcs.s   Offset_0x026F9E
                addi.b  #$04,d0
Offset_0x026F9E:
                addi.b  #$10,d0
                add.w   D3,d0
                move.w  d0,(A6)
                rts
;-------------------------------------------------------------------------------                
Menu_Code_Test: 
                move.w  ($FFFFFF0C).w,d0
                adda.w  d0,A0
                move.w  ($FFFFFF84).w,d0
                cmp.b   (A0),d0
                bne.s   Menu_Reset_Debug_Mode_Code_Counter
                addq.w  #$01,($FFFFFF0C).w
                tst.b   $0001(A0)
                bpl.s   Menu_All_Emeralds_Code_Test 
                move.w  #$0101,(A1)
                bra     Menu_Set_Debug_Flag 
Menu_Reset_Debug_Mode_Code_Counter: 
                move.w  #$0000,($FFFFFF0C).w
Menu_All_Emeralds_Code_Test: 
                move.w  ($FFFFFF0E).w,d0
                adda.w  d0,A2
                move.w  ($FFFFFF84).w,d0
                cmp.b   (A2),d0
                bne.s   Menu_Reset_All_Emerald_Code_Counter 
                addq.w  #$01,($FFFFFF0E).w
                tst.b   $0001(A2)
                bpl.s   Menu_Code_Not_0xFF 
                tst.w   D2
                bne.s   Menu_Set_All_Emeralds 
Menu_Set_Debug_Flag: 
                move.b  #$01,(Slow_Motion_Flag).w
                move.b  #$01,(Debug_Mode_Flag).w
                move.b  #Ring_Snd,d0
                bsr     Menu_Play_Music 
                bra.s   Menu_Reset_All_Emerald_Code_Counter 
Menu_Set_All_Emeralds: 
                move.w  #$0006,($FFFFFE56).w
                move.b  #Emerald_Snd,d0
                bsr     Menu_Play_Music 
Menu_Reset_All_Emerald_Code_Counter: 
                move.w  #$0000,($FFFFFF0E).w
Menu_Code_Not_0xFF: 
                rts               
Code_Debug_Mode: 
                dc.b    $01,$09,$09,$02,$01,$01,$02,$04,$FF
Code_All_Emeralds: 
                dc.b    $04,$01,$02,$06,$FF
;-------------------------------------------------------------------------------                 
Offset_0x027040:
                bsr     Offset_0x026F7A
                bra     Offset_0x027050
Offset_0x027048:
                bsr     Offset_0x026ED8
                bra     Offset_0x027050
Offset_0x027050:
                move.w  ($FFFFFF82).w,d0
                lea     (Menu_Icon_List),A3
                lea     $00(A3,d0),A3
                lea     ($FFFF08C0),A1
                moveq   #$00,d0
                move.b  (A3),d0
                lsl.w   #$03,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   D1,d0
                lea     $00(A1,d0),A1
                move.l  #$4B360003,d0        ; Posição Horizontal dos Ícones
                moveq   #$03,d1
                moveq   #$02,d2
                bsr     Menu_ShowVDPGraphics 
                lea     (Icon_Palettes),A1  
                moveq   #$00,d0
                move.b  (A3),d0
                lsl.w   #$05,d0
                lea     $00(A1,d0),A1
                lea     ($FFFFFB40).w,A2
                moveq   #$07,d1
Offset_0x027098:                
                move.l  (A1)+,(A2)+
                dbra    D1,Offset_0x027098
                rts
;-------------------------------------------------------------------------------                            
Dynamic_Menu:                           
                subq.b  #$01,($FFFFF7B9).w          ; Decrementa em 1 o Tempo
                bpl.s   Exit_Dinamic_Menu            ; Se for maior ou igual a 0 sai da função
                move.b  #$07,($FFFFF7B9).w          ; Inicializa o tempo de duração de cada frame
                move.b  ($FFFFF7B8).w,d0            ; Carrega o Id do Frame Atual em D0
                addq.b  #$01,($FFFFF7B8).w          ; Carrega o próximo frame em $FFFFFFB8
                andi.w  #$001F,d0
                move.b  Sonic_Miles_Frame_Select(PC,d0),d0  ; Carrega o Id do frame em D0
              ; muls.w  #$0140,d0                   ; Multiplica o Id pelo tamanho em bytes de cada frame
                lsl.w   #$06,d0
                lea     ($00C00000),A6
                move.l  #$40200000,$0004(A6)
                lea     (Sonic_Miles_Spr),A1
                lea     $00(A1,d0),A1
                move.w  #$0009,d0                   ; Tiles-1 a serem carregados por vez 
Menu_Loop_Load_Tiles:
                move.l  (A1)+,(A6)
                move.l  (A1)+,(A6)     
                move.l  (A1)+,(A6)     
                move.l  (A1)+,(A6)     
                move.l  (A1)+,(A6)     
                move.l  (A1)+,(A6)
                move.l  (A1)+,(A6)
                move.l  (A1)+,(A6)
                dbra    d0,Menu_Loop_Load_Tiles
Exit_Dinamic_Menu:                
                rts              
Sonic_Miles_Frame_Select:     
                dc.b    $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
                dc.b    $05,$0A
                dc.b    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
                dc.b    $0A,$05   
                ; 0 = 0000000000  ; 1 = 0101000000  ; 2 = 1010000000 ; 3 = 1111000000
;------------------------------------------------------------------------------                  
__ = $00
_A = $1E
_B = $1F
_C = $20
_D = $21
_E = $22    
_F = $23
_G = $24
_H = $25
_I = $26
_J = $27
_K = $28
_L = $29
_M = $2A
_N = $2B
_O = $2C
_P = $2D
_Q = $2E
_R = $2F
_S = $30
_T = $31
_U = $32
_V = $33
_W = $34
_X = $35
_Y = $36
_Z = $37
_st = $1A ; star
_cC = $1B ; (C)
_dot = $1D ; .
_Ddot = $1C ; :
;-------------------------------------------------------------------------------  
Icon_Palettes: 
                dc.w    $0000,$0000,$0048,$006A,$008E,$00CE,$0EEE,$00E0
                dc.w    $00A4,$0082,$0062,$0000,$0E86,$0026,$0E42,$0C00
                dc.w    $0000,$0000,$0420,$0820,$0C00,$0E60,$0A00,$0000
                dc.w    $0E00,$0000,$0000,$0000,$0444,$0666,$0AAA,$0EEE
                dc.w    $0000,$0204,$0026,$0248,$046A,$048C,$06CE,$0002
                dc.w    $0000,$0220,$0040,$0060,$0080,$02A0,$06E0,$0A0C
                dc.w    $0000,$0000,$0A00,$0660,$0C80,$0EC0,$006A,$0008
                dc.w    $028A,$00AE,$004C,$006E,$0060,$0066,$00C0,$00CA
                dc.w    $0000,$0000,$0CE2,$0000,$0480,$0240,$0EEE,$04AC
                dc.w    $006A,$0026,$0842,$0620,$0400,$0000,$0000,$0000
                dc.w    $0000,$0000,$0EEE,$0ECA,$0E86,$0E64,$0E42,$06AE
                dc.w    $048A,$0268,$0246,$0024,$0888,$0444,$000E,$0008
                dc.w    $0000,$0000,$0A26,$0C48,$0E8C,$00CE,$00C4,$0080
                dc.w    $0C00,$0000,$0EEE,$0EEA,$0EC8,$006E,$004A,$0028
                dc.w    $0000,$0000,$0048,$006A,$008E,$00CE,$0EEE,$00E0
                dc.w    $00A4,$0082,$0062,$0808,$0A4A,$0026,$0626,$0404
                dc.w    $0000,$0000,$0EEE,$0ECA,$0E86,$0E64,$0E42,$06AE
                dc.w    $048A,$0268,$0246,$0024,$0888,$0444,$000E,$0008
                dc.w    $0000,$0000,$0048,$006A,$008E,$00CE,$0EEE,$00E0
                dc.w    $00A4,$0082,$0062,$0400,$0E86,$006E,$0E42,$0C00
                dc.w    $0000,$0000,$0CE2,$08C0,$0480,$0240,$0EEE,$02AC
                dc.w    $006A,$0026,$0AA6,$0000,$060A,$0408,$0204,$0000
                dc.w    $0000,$0000,$0C06,$0C0A,$0C6E,$0068,$008A,$0000
                dc.w    $02CE,$00EC,$00AE,$006E,$0EEE,$0000,$000E,$00C4
                dc.w    $0000,$0000,$0EEE,$0AAA,$0000,$0666,$0444,$0E40
                dc.w    $0C00,$0800,$00CE,$028E,$000E,$0084,$0062,$0020
                dc.w    $0000,$0000,$0004,$0044,$0084,$0088,$00A8,$00AC
                dc.w    $006C,$002C,$0028,$0006,$0666,$0888,$0CCC,$0EEE
                dc.w    $0000,$0000,$06CE,$04AC,$028A,$0068,$0046,$00E8
                dc.w    $00C4,$0080,$0040,$0EEE,$0C00,$0EC0,$0860,$0000
                dc.w    $0000,$0000,$0E64,$0E86,$0EA8,$0ECA,$0EEE,$0000
                dc.w    $00AE,$006E,$0E22,$00E0,$0000,$0000,$0000,$0000
                dc.w    $0000,$0E20,$004E,$006E,$0048,$008C,$00CE,$08EE
                dc.w    $0800,$0400,$0000,$0EE8,$0E80,$0E60,$0000,$0000
                dc.w    $0000,$0000,$0A22,$0C42,$0000,$0E66,$0EEE,$0AAA
                dc.w    $0888,$0444,$08AE,$046A,$000E,$0000,$00EE,$0000
                dc.w    $0000,$0000,$0A22,$0C42,$0000,$0E66,$0EEE,$0AAA
                dc.w    $0888,$0444,$08AE,$046A,$000E,$0000,$00EE,$0000
;-------------------------------------------------------------------------------  
Menu_Icon_List: 
                dc.b    $00,$00,$00,$0E,$0E,$0E,$06,$06,$06,$0B,$0B,$0B,$0D,$0D,$0D,$09
                dc.b    $09,$09,$04,$10,$0F,$11
;-------------------------------------------------------------------------------                 
Menu_Text_Highlight:                  
                dc.w    $0306,$0324,$0306,$0424,$0306,$0524,$0706,$0724
                dc.w    $0706,$0824,$0706,$0924,$0B06,$0B24,$0B06,$0C24
                dc.w    $0B06,$0D24,$0F06,$0F24,$0F06,$1024,$0F06,$1124
                dc.w    $1306,$1324,$1306,$1424,$1306,$1524,$032C,$034A
                dc.w    $032C,$044A,$032C,$054A,$072C,$0000,$0B2C,$0000
                dc.w    $0F2C,$0000,$132C,$134A
;-------------------------------------------------------------------------------                
Menu_Text_Positions:                   
                dc.w    $00F6,$0236,$0376,$04B6,$05F6,$011C,$025C,$039C
                dc.w    $04DC,$061C
;-------------------------------------------------------------------------------                          
Menu_Level_Select_Text: 
                dc.b    $0E,_G,_R,_E,_E,_N,__,_H,_I,_L,_L,__,__,__,__,__ ; _N,_I,_G,_H,_T,__,_H,_I,_L,_L,__,__,__,__,__
                dc.b    $0E,_L,_A,_B,_Y,_R,_I,_N,_T,_H,__,__,__,__,__,__ ; _O,_L,_D,__,_S,_T,_O,_N,_E,__,__,__,__,__,__
                dc.b    $0E,_M,_A,_R,_B,_L,_E,__,__,__,__,__,__,__,__,__ ; _H,_O,_T,__,_G,_R,_O,_U,_N,_D,__,__,__,__,__
                dc.b    $0E,_S,_T,_A,_R,__,_L,_I,_G,_H,_T,__,__,__,__,__ ; _N,_I,_G,_H,_T,__,_L,_I,_F,_E,__,__,__,__,__
                dc.b    $0E,_S,_P,_R,_I,_N,_G,__,_Y,_A,_R,_D,__,__,__,__ ; _P,_A,_R,_T,_Y,__,__,__,__,__,__,__,__,__,__
                dc.b    $0E,_S,_C,_R,_A,_P,__,_B,_R,_A,_I,_N,__,__,__,__ ; _D,_E,_A,_T,_H,__,_E,_G,_G,__,_S,_T,_A,_T,_dot
                dc.b    $0E,_F,_I,_N,_A,_L,__,__,__,__,__,__,__,__,__,__ ; _F,_I,_N,_A,_L,__,_R,_O,_U,_N,_D,__,__,__,__   
                dc.b    $0E,_S,_P,_E,_C,_I,_A,_L,__,_S,_T,_A,_G,_E,__,__
                dc.b    $0E,_E,_N,_D,__,__,__,__,__,__,__,__,__,__,__,__
                dc.b    $0E,_M,_U,_S,_I,_C,__,_B,_O,_X,__,__,__,_st,__,__                 
;-------------------------------------------------------------------------------
Wings_Mappings: 
                dc.w    $6000,$6000,$6000,$604D,$604E,$684E,$684D,$6000,$6000,$6000   
;Wings_Line_1:                 
                dc.w    $604F,$6050,$6051,$6052,$6053,$6853,$6852,$6851,$6850,$684F
;Wings_Line_2:
                dc.w    $6054,$6055,$6056,$6057,$6057,$6057,$6057,$6856,$6855,$6854
;Wings_Line_3:
                dc.w    $6058,$6059,$605A,$6057,$6057,$6057,$6057,$685A,$6859,$6858
;Wings_Line_4:
                dc.w    $605B,$605C,$605D,$6057,$6057,$6057,$6057,$685D,$685C,$685B
;Wings_Line_5:
                dc.w    $6000,$605E,$605F,$6060,$6061,$6062,$6063,$6064,$685E,$6000
;Wings_Line_6:
                dc.w    $6000,$6000,$6065,$6066,$6067,$6867,$6866,$6865,$6000,$6000 
;-------------------------------------------------------------------------------    
Menu_Palette:
                incbin  'data\menu\menu.pal'            
Menu_ClearScreen:
                jmp     ClearScreen
Menu_ShowVDPGraphics:                
                jmp     ShowVDPGraphics                
Menu_NemesisDec: 
                jmp     NemDec  
Menu_LoadPLC2:      
                jmp     LoadPLC2
Menu_RunPLC:                    
                jmp     RunPLC_RAM                           
Menu_EnigmaDec
                jmp     EniDec
Menu_Pal_FadeTo:
                jmp     Pal_FadeTo
Menu_Pal_FadeFrom:
                jmp     Pal_FadeFrom     
Menu_Play_Music:
                jmp     PlaySound  
Menu_PalLoad1:
                jmp     PalLoad1
Menu_DelayProgram:
                jmp     DelayProgram
;-------------------------------------------------------------------------------
Menu_Font:
                incbin  'data\menu\menufont.nem' 
Level_Icons:
                incbin  'data\menu\levelico.nem'   
Menu_Mappings:
                incbin  'data\menu\menubg.eni'
Icons_Mappings:
                incbin  'data\menu\iconsmap.eni'
Sonic_Miles_Spr:                                         
                incbin  'data\menu\soncmils.dat'   
;===============================================================================
; Menu do Sonic 2 No Sonic 1 reprogramado por Esrael L. G. Neto
; [ Fim ]
;===============================================================================