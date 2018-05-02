@echo off
setlocal

set /p folder= Folder? 
set /a result= %folder%

mkdir %result%

cd %result%

set /p file= File? 

set "file=%file%.mp4"

echo %file%
pause
cls

set maxbytesize=10000000

adb shell screenrecord /sdcard/%file%

adb pull /sdcard/%file%

adb shell rm /sdcard/%file%

cls 

FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA

set /a megabytes = %size% / 1000000

echo Video is %megabytes% MB 

echo Video is %size% bytes

echo.

pause

cls

if %size% LSS %maxbytesize% (
    echo.File is less than 10 MB
    echo.No condensing required
    echo.
) ELSE (
    echo.File is greater than 10 MB
    echo.Condensing required
    echo.

    ffmpeg -i %file% -b:v 1000k -bufsize 10000k condensed_%file%
)

pause
