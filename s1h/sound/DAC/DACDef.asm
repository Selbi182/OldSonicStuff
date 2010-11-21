; ===========================================================================
;	Definitions
; ===========================================================================
                ; sample $81 - Kick
DacDef0:	dc.w	((($8000+(DacPCM0-(DacPCM0&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM0-(DacPCM0&$FFFF8000)))&$FF00)>>8)    ; location of the PCM in the ROM, change DacPCM* acording to the pcm number.
                dc.w	$CF02	; size of the pcm sample, divided by $20 and byteswapped. Format: $BBSS = $SSBB unless its $BBS so it will be $0SBB
                dc.b	$06 ; pitch, change it into something lower
                dc.w	(((DacPCM0/$100)&$FF)<<8)+(((DacPCM0/$100)&$FF00)>>8)	; something to do with the rom bank. again, change DacPCM into the pcm number
                dc.b	$00  ; unused
                ; sample $82 - Snare
DacDef1:	dc.w	((($8000+(DacPCM1-(DacPCM1&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM1-(DacPCM1&$FFFF8000)))&$FF00)>>8)
                dc.w	$7E07
                dc.b	$06
                dc.w	(((DacPCM1/$100)&$FF)<<8)+(((DacPCM1/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $83- Go!
DacDef2:	dc.w	((($8000+(DacPCM2-(DacPCM2&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM2-(DacPCM2&$FFFF8000)))&$FF00)>>8)
                dc.w	$8E06
                dc.b	$10
                dc.w	(((DacPCM2/$100)&$FF)<<8)+(((DacPCM2/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $84- Hand Clap
DacDef3:	dc.w	((($8000+(DacPCM3-(DacPCM3&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM3-(DacPCM3&$FFFF8000)))&$FF00)>>8)
                dc.w	$EF04
                dc.b	$06
                dc.w	(((DacPCM3/$100)&$FF)<<8)+(((DacPCM3/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $85- Crash Cymbal
DacDef4:	dc.w	((($8000+(DacPCM4-(DacPCM4&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM4-(DacPCM4&$FFFF8000)))&$FF00)>>8)
                dc.w	$d010
                dc.b	$08
                dc.w	(((DacPCM4/$100)&$FF)<<8)+(((DacPCM4/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $86- Ride Cymbal
DacDef5:	dc.w	((($8000+(DacPCM5-(DacPCM5&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM5-(DacPCM5&$FFFF8000)))&$FF00)>>8)    ; location of the PCM in the ROM, change DacPCM* acording to the pcm number.
                dc.w	$FD09
                dc.b	$10
                dc.w	(((DacPCM5/$100)&$FF)<<8)+(((DacPCM5/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $87- Muffled Snare
DacDef6:	dc.w	((($8000+(DacPCM1-(DacPCM1&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM1-(DacPCM1&$FFFF8000)))&$FF00)>>8)
                dc.w	$7E07
                dc.b	$08
                dc.w	(((DacPCM1/$100)&$FF)<<8)+(((DacPCM1/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $88- Tom High
DacDef7:	dc.w	((($8000+(DacPCM7-(DacPCM7&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM7-(DacPCM7&$FFFF8000)))&$FF00)>>8)
                dc.w    $640d
                dc.b	$20
                dc.w	(((DacPCM7/$100)&$FF)<<8)+(((DacPCM7/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $89- Tom Mid
DacDef8:	dc.w	((($8000+(DacPCM7-(DacPCM7&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM7-(DacPCM7&$FFFF8000)))&$FF00)>>8)
                dc.w	$640d
                dc.b	$1C
                dc.w	(((DacPCM7/$100)&$FF)<<8)+(((DacPCM7/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $8A- Tom Low
DacDef9:	dc.w	((($8000+(DacPCM7-(DacPCM7&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM7-(DacPCM7&$FFFF8000)))&$FF00)>>8)
                dc.w	$640d
                dc.b	$19
                dc.w	(((DacPCM7/$100)&$FF)<<8)+(((DacPCM7/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $8B- Tom Floor
DacDefA:	dc.w	((($8000+(DacPCM7-(DacPCM7&$FFFF8000)))&$FF)<<8)+((($8000+(DacPCM7-(DacPCM7&$FFFF8000)))&$FF00)>>8)
                dc.w	$640d
                dc.b	$16
                dc.w	(((DacPCM7/$100)&$FF)<<8)+(((DacPCM7/$100)&$FF00)>>8)
                dc.b	$00
                ; sample $8C
DacDefB:	dc.w	$00
                dc.w	$00
                dc.b	$00
                dc.w	$00
                dc.b	$00
                ; sample $8D
DacDefC:	dc.w	$00
                dc.w	$00
                dc.b	$00
                dc.w	$00
                dc.b	$00
                ; sample $8E
DacDefD:	dc.w	$00
                dc.w	$00
                dc.b	$00
                dc.w	$00
                dc.b	$00
                ; sample $8F
DacDefE:	dc.w	$00
                dc.w	$00
                dc.b	$00
                dc.w	$00
                dc.b	$00
; =============================================================
; Sample locations
; =============================================================
DacPCM0:	incbin	sound\dac\86.bin
                even
DacPCM1:	incbin	sound\dac\81.bin
                even
DacPCM2:	incbin	sound\dac\AA.bin
                even
DacPCM3:        incbin  sound\dac\8f.bin
                even
DacPCM4:        incbin  sound\dac\88.bin
                even
DacPCM5:        incbin  sound\dac\89.bin
                even
DacPCM6:        incbin  sound\dac\87.bin
                even
DacPCM7:        incbin	sound\dac\snar5.raw
                even