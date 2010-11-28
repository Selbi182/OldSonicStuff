@echo off
echo ============================================
echo Sonic Erazor is building...
echo ============================================

asm68k /z /zd /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin

echo.
echo ============================================
echo Built! Press any button to play.
echo ============================================
pause
@echo on
s1erz.bin