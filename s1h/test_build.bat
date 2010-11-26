@echo off
echo ============================================
echo Sonic Erazor is building...
echo ============================================
echo.

REM ::: automatic recompression of data - disabled by default because it's slow
REM ::: remove "REM" from the lines below to re-enable it
REM derecmp.exe nc artnem_u artnem
REM derecmp.exe kc artkos_u artkos
REM derecmp.exe ec mapeni_u mapeni
REM derecmp.exe ec map16_u map16
REM derecmp.exe kc map256_u map256
REM derecmp.exe ec sslay_u sslayout

asm68k /z /zd /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin
fixheadr.exe s1built.bin
rem copy s1erz.bin ..\s1erz.bin
echo ============================================
echo Built! Press any button to play.
echo ============================================
pause
@echo on
s1erz.bin