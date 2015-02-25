@echo off
echo ============================================
echo Sonic ERaZor is building...
echo ============================================

asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin

echo.
echo ============================================
echo Built, press any button to play!
echo ============================================
pause
@echo on
s1erz.bin