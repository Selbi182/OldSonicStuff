@echo off
echo ============================================
echo Sonic Erazor is building...
echo S1HL Sound Driver Mode on!
echo ============================================
echo.

set USEANSI=n
as\asl -gnuerrors -c -A -xx smps.asm
as\p2bin smps.p output\uncompressed\smpsbuilt.bin -r 0x-0x
derecmp kc output\uncompressed output\compressed
copy output\compressed\smpsbuilt.bin z80.bin
copy output\uncompressed\smpsbuilt.bin smpsbuilt_uncompressed.bin
del smps.p

asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin
fixheadr.exe s1erz.bin
copy s1erz.bin ..\s1erz.bin
echo ============================================
echo Builded! Press any button to play.
echo ============================================
pause
@echo on
s1erz.bin