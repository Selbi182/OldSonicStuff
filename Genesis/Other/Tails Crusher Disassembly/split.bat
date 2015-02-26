@echo off

echo =======================================
echo Tails Crusher - Splitting Data
echo =======================================
echo.
if exist art\Art1_Normal.bin goto AlreadySplitted 
echo Put in the ROM in this directory (make sure it's called COMPRESS.BIN).
echo Press start to begin the splitting process.

pause
echo.
if not exist COMPRESS.BIN goto ROMNotFound

echo Creating Folders...
@echo on
mkdir art palette sound
@echo off
echo Done.
echo.

echo Now splitting data...
@echo on
split.exe COMPRESS.BIN SplitData.txt
@echo off
echo All data successfully splitted.
echo.

echo You can now use this disassembly. Have fun. =)
echo.
pause
exit

:ROMNotFound
echo COMPRESS.BIN not found. Make sure you have it named excactly like this.
echo Then try again.
echo.
pause
exit

:AlreadySplitted
echo You already splitted the ROM. You don't need to do it twice.
echo.
pause
exit