@echo off
echo ============================================
echo Sonic Erazor is building...
echo ============================================
asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin
fixheadr.exe s1built.bin
copy s1erz.bin I:\genplus\roms\s1erz.bin
echo ============================================
echo Built and copied to SD Card!
echo ============================================
pause