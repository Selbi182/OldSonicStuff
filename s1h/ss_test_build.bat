@echo off

derecmp.exe ec sslay_u sslayout

asm68k /o op+ /o os+ /o ow+ /o oz+ /o oaq+ /o osq+ /o omq+ /p /o ae- sonic1.asm, s1erz.bin
fixheadr.exe s1built.bin

pause
@echo on
s1erz.bin