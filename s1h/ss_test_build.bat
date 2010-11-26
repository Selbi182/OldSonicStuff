@echo off
echo ============================================
echo Sonic Erazor is building...
echo Compressing Special Stage layouts...
echo ============================================
echo.
derecmp.exe ec sslay_u sslayout

asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin
fixheadr.exe s1built.bin

echo ============================================
echo Built! Press any button to play.
echo ============================================
pause
@echo on
s1erz.bin