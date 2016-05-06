@echo off

Bin\asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- MyTest.asm, ItsSomething.bin
REM rompad.exe TMSS.bin 255 0
REM fixheadr.exe TMSS.bin

pause

start ItsSomething.bin