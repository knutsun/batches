@echo off


:home
echo:
echo =====================================
echo          *** OPTIONS ***
echo: 
echo 1: Screenshot
echo 2: Video
echo 3: Logcat
echo 4: Install a build *** MUST HAVE BUILD INSTALLED IN ADB BUILD FOLDER ***
echo 5: Uninstall a build
echo 6: Clear cache and force close app
echo 7: Connect to a device
echo 8: Set sleep timer to 1 minute
echo 9: Reset sleep timer to not sleep
echo a: Connect to AndroidTV
echo f: Connect to FireTV
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
if %m%==a goto android
if %m%==f goto fire
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
cd
set /p folder= Folder: 
set /a result= %folder%

mkdir %result%

cd %result%
cd
set /p file= File: 

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


if %size% LSS %maxbytesize% (
    echo.File is less than 10 MB
    echo.No condensing required
    echo.
) ELSE (
    echo.File is greater than 10 MB
    echo.Condensing required
    echo.
    pause

    ffmpeg -i %file% -b:v 1000k -bufsize 10000k condensed_%file%
    del %file% 
    ren condensed_%file% %file%
)
cd ..
move %result%  C:\Users\Tester\Desktop\ADB\

echo =====================================
echo *** FILE SAVED TO DESKTOP FOLDER *** 
pause
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

:install
cd C:\adb
cls
echo *** MAKE SURE THE BUILD IS IN THE ADB BUILD FOLDER! ***
echo .APK is already added!
echo =====================================
echo:
echo Build Names
dir /b C:\ADB\builds
echo:
echo =====================================
set /p build= ""
cls
adb install -r c:\adb\builds\%build%.apk
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
adb shell settings put secure sleep_timeout 60000
echo Sleep timer reset to one minute
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
adb connect 172.27.0.54
adb devices
adb shell getprop ro.build.mktg.fireos
adb shell getprop ro.build.version.release
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
pause
cls
goto home

:no way
echo:
echo *** OPTION NOT AVAILABLE, TRY AGAIN ***
pause
cls
goto home
