@ECHO OFF

REM // make sure we can write to the file s2built.bin
REM // also make a backup to s2built.prev.bin
IF NOT EXIST s2built.bin goto LABLNOCOPY
IF EXIST s2built.prev.bin del s2built.prev.bin
IF EXIST s2built.prev.bin goto LABLNOCOPY
rem move /Y s2built.bin s2built.prev.bin
rem IF EXIST s2built.bin goto LABLERROR3
REM IF EXIST s2built.prev.bin copy /Y s2built.prev.bin s2built.bin
:LABLNOCOPY

REM // delete some intermediate assembler output just in case
IF EXIST sonic2.p del sonic2.p
IF EXIST sonic2.p goto LABLERROR2
IF EXIST sonic2.h del sonic2.h
IF EXIST sonic2.h goto LABLERROR1

REM // clear the output window
cls


REM // run the assembler
REM // -xx shows the most detailed error output
REM // -c outputs a shared file (sonic2.h)
REM // -A gives us a small speedup
set AS_MSGPATH=win32/msg
set USEANSI=n
"win32/asw" -xx -c -A sonic2.asm

REM // combine the assembler output into a rom
IF EXIST sonic2.p "win32/s2p2bin" sonic2.p s2built.bin sonic2.h

REM // fix some pointers and things that are impossible to fix from the assembler without un-splitting their data
IF EXIST s2built.bin "win32/fixpointer" sonic2.h s2built.bin   off_3A294 MapRUnc_Sonic $2D 0 4   word_728C_user Obj5F_MapUnc_7240 2 2 1  

REM REM // fix the rom header (checksum)
IF EXIST s2built.bin "win32/fixheader" s2built.bin


REM // done -- pause if we seem to have failed, then exit
IF NOT EXIST sonic2.p goto LABLPAUSE
IF EXIST s2built.bin goto LABLSUCCESS

:LABLSUCCESS

IF EXIST sonic2.p del sonic2.p
IF EXIST sonic2.h del sonic2.h
echo.
echo "============================================"
echo " SUCESSFULLY BUILT! Press any key to run... "
echo "============================================"
echo.
pause
@echo on
s2built.bin
exit /b


:LABLPAUSE
pause


exit /b

:LABLERROR1
echo Failed to build because write access to sonic2.h was denied.
pause


exit /b

:LABLERROR2
echo Failed to build because write access to sonic2.p was denied.
pause


exit /b

:LABLERROR3
echo Failed to build because write access to s2built.bin was denied.
pause


