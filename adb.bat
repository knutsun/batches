@echo off

mode con:cols=70 lines=25
color 02

:home
echo:
echo =====================================
echo          *** MENU ***
echo: 
echo 1: Screenshot
echo 2: Video
echo 3: Logcat
echo 33: Clear logcat
echo 4: Install a build
echo 5: Uninstall a build
echo 6: Clear cache and force close app
echo 7: Connect to a device
echo 8: Set sleep timer to 30 seconds
echo 9: Reset sleep timer
echo.
echo a: Connect to AndroidTV
echo f: Connect to FireTV Gen 1 box
echo ff: Connect to FireTV Cube
echo fw: Connect to FireTV Cube wifi
echo e: Exit
echo:
echo =====================================

set /p m=Make a Selection: 
if %m%==1 goto Screenshot
if %m%==2 goto video
if %m%==3 goto logcat
if %m%==4 goto install
if %m%==5 goto uninstall
if %m%==6 goto clear
if %m%==7 goto Connect to a device
if %m%==8 goto sleep
if %m%==9 goto sleepreset
if %m%==33 goto logcatClear
if %m%==a goto android
if %m%==f goto fire
if %m%==ff goto firecube
if %m%==fw goto firecubew
if %m%==e goto exitbat
if %m%==GTR 7 goto no way


:Screenshot
echo Screenshot:
echo Enter name (DO NOT ADD FILE EXTENTION)
set /p shotname= ""
cls
adb shell screencap -p /sdcard/%shotname%.png
pause
adb pull /sdcard/%shotname%.png C:\Users\Tester\Desktop\ADB
echo =====================================
echo *** FILE SAVED TO DESKTOP FOLDER ***
pause
cls
goto home

:Video
cls
set /p folder= Folder: 
set /a result= %folder%
mkdir %result%
cd %result%

set /p file= File: 
set "file=%file%.mp4"
echo.
echo %file% will be saved to folder %folder%
echo.
pause
cls

set maxbytesize=10000000

adb shell screenrecord /sdcard/%file%
adb pull /sdcard/%file%
adb shell rm /sdcard/%file%

cls 

FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA

set /a megabytes = %size% / 1000000

echo Video is %size% bytes
echo Video is ~ %megabytes% MB 
echo.

if %size% LSS %maxbytesize% (
    echo.File is less than 10 MB
    echo.
    echo =====================================
    echo *** FILE SAVED TO FOLDER %result% ***
    echo.
    pause
    echo.
) ELSE (
    echo.File is greater than 10 MB
    echo.
    echo Do you want to compress this file?
    echo.File will be compressed. . .
    echo.
    pause

    ffmpeg -i %file% -b:v 1000k -bufsize 10000k condensed_%file%
    del %file% 
    ren condensed_%file% %file%
    echo.
    echo =====================================
    echo *** FILE SAVED TO FOLDER %result% ***
    echo.


)
FOR /F "usebackq" %%A IN ('%file%') DO set sizeNew=%%~zA
    
set /a megabytesNew = %sizeNew% / 1000000
echo %file% compressed to %sizeNew% bytes
echo %file% compressed to ~ %megabytesNew% MB
echo.
pause

cd ..
move %result%  C:\Users\Tester\Desktop\ADB\
cls
goto home

:logcat
echo Enter Log File name (DO NOT ADD FILE EXTENTION)
set /p logname= ""
cls
pause
adb logcat -d  > C:\Users\Tester\Desktop\ADB\%logname%.txt 
echo =====================================
echo *** FILE SAVED TO DESKTOP FOLDER LABELED 'ADB' ***
pause
cls
goto home

:logcatClear
echo Clear logcat
adb logcat -c
echo Logcat has been cleared
pause
cls
goto home

:install
cd C:\adb
cls
echo *** MAKE SURE THE BUILD IS IN THE ADB BUILD FOLDER! ***
echo =====================================
echo:
echo Build Names
dir /b C:\ADB\builds
echo:
echo =====================================
set /p build= ""
cls
adb install -r c:\adb\builds\%build%
pause
cls
goto home
 
:uninstall
cd C:\adb
cls
echo *** Builds installed ***
echo:
adb shell pm list packages -3 disney
echo:
echo *** ENTER JUST THE BRAND NAME BELOW ( example: abc, watchdc ) ***
echo:
echo =====================================
set /p brand= ""
cls
adb uninstall com.disney.datg.videoplatforms.android.amazon.kindle.%brand%
adb uninstall com.disney.datg.videoplatforms.android.%brand%
pause
cls
goto home

:clear
cd C:\adb
cls
echo *** Builds installed *** 
echo:
adb shell pm list packages -3 disney
echo:
echo *** ENTER JUST THE BRAND NAME BELOW ( example: abc, watchdc ) ***
echo:
echo =====================================
set /p brand= ""
cls
echo: *** CLEARING FIRE TV BUILD ***
adb shell pm clear com.disney.datg.videoplatforms.android.amazon.kindle.%brand%
echo:
echo: *** CLEARING ANDROID TV BUILD ***
adb shell pm clear com.disney.datg.videoplatforms.android.%brand%
pause
cls
goto home


:sleep
cd C:\adb
cls
adb shell settings put secure sleep_timeout 30000
echo Sleep timer reset to 30 seconds
pause
cls
goto home

:sleepreset
cd C:\adb
cls
adb shell settings put secure sleep_timeout 0
echo Sleep timer reset to infinity
pause
cls
goto home

:android
cd C:\adb
cls
@echo off
adb kill-server
adb start-server
adb connect 172.27.4.42
adb devices
adb shell getprop ro.build.mktg.fireos
adb shell getprop ro.build.version.release
echo.
pause
cls
goto home

:fire
cd C:\adb
cls
@echo off
adb kill-server
adb connect 172.27.5.21
adb devices
adb shell getprop ro.build.mktg.fireos
adb shell getprop ro.build.version.release
echo.
pause
cls
goto home

:firecube
cd C:\adb
cls
@echo off
adb kill-server
adb start-server
adb connect 172.27.5.56
adb devices
adb shell getprop ro.build.mktg.fireos
adb shell getprop ro.build.version.release
echo.
pause
cls
goto home

:firecubew
cd C:\adb
cls
@echo off
adb kill-server
adb start-server
adb connect 172.27.5.55
adb devices
adb shell getprop ro.build.mktg.fireos
adb shell getprop ro.build.version.release
echo.
pause
cls
goto home

:exitbat
EXIT

:no way
echo:
echo *** OPTION NOT AVAILABLE, TRY AGAIN ***
pause
cls
goto home
