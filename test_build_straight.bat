@echo off
echo ============================================
echo Sonic ERaZor (Straight) is building...
echo ============================================

asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1_straight.asm, s1erz_straight.bin

echo.
echo ============================================
echo Built, press any button to play!
echo ============================================
pause
@echo on
s1erz_straight.bin