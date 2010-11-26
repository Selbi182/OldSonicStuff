@echo off
echo ============================================
echo Sonic Erazor is building...
echo S1HL Sound Driver Mode on!
echo ============================================
echo.

asm68k /q /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin

mkdir sound\Driver\output sound\Driver\output\uncompressed sound\Driver\output\compressed

set USEANSI=n
sound\Driver\as\asl -gnuerrors -c -A -xx sound\Driver\smps.asm
sound\Driver\as\p2bin sound\Driver\smps.p sound\Driver\output\uncompressed\smpsbuilt.bin -r 0x-0x

BankAligner.exe

copy sound\Driver\output\uncompressed\smpsbuilt.bin sound\Driver\z80_S1HL_unc.bin
derecmp kc sound\Driver\output\uncompressed sound\Driver\output\compressed
copy sound\Driver\output\compressed\smpsbuilt.bin sound\Driver\z80_S1HL.bin

del sound\Driver\smps.p
rmdir /s /q sound\Driver\output



echo.
echo ============================================
asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin
fixheadr.exe s1erz.bin
rem copy s1erz.bin ..\s1erz.bin
echo ============================================
echo Built! Press any button to play.
echo ============================================
pause
@echo on
s1erz.bin