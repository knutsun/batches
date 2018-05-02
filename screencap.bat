@echo off

echo Screencap batch

set /p folder= Folder?
set /a result=%folder%

mkdir %result%

cd %result%

set /p name= Name?

if "%name%"=="" (
	set name="Gen1_image"
)

adb shell screencap /sdcard/%name%.png

adb pull /sdcard/%name%.png

adb shell rm /sdcard/%name%.png


pause

