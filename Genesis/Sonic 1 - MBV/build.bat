@echo off
rem include.exe sonic1.asm s1comb.asm

REM ::: automatic recompression of data - disabled by default because it's slow
REM ::: remove "REM" from the lines below to re-enable it
REM derecmp.exe nc artnem_u artnem
REM derecmp.exe kc artkos_u artkos
REM derecmp.exe ec mapeni_u mapeni
REM derecmp.exe ec map16_u map16
REM derecmp.exe kc map256_u map256
REM derecmp.exe ec sslay_u sslayout

rem snasm68k.exe -emax 0 -p -o ae- s1comb.asm, s1built.bin
asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1mbv.bin
rem rompad.exe s1built.bin 255 0
fixheadr.exe s1mbv.bin
pause
s1mbv.bin