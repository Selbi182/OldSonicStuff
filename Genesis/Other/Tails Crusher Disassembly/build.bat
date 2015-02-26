@echo off

echo =======================================
echo Tails Crusher - Building ROM...
echo =======================================

asm68k.exe /p /o ae- TailsCrusher.asm, TailsCrusher_Built.bin
echo.

pause

@echo on
TailsCrusher_Built.bin