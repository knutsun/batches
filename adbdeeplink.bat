@echo off

mode con:cols=70 lines=25
color 02

:home
echo:
echo =====================================
echo          *** Deeplink options***
echo: 
echo 1: Link to video
echo 2: Home page
echo 3: All Shows
echo 4: Collection
echo 5: Show Details
echo 6: On Now
echo 7: DCOM
echo.
echo e: Exit
echo:
echo =====================================

set /p m=Make a Selection: 
if %m%==1 goto Link to video
if %m%==2 goto Homelink
if %m%==3 goto All Shows
if %m%==4 goto Collection
if %m%==5 goto Show Details
if %m%==6 goto On Now
if %m%==7 goto DCOM

if %m%==e goto exitbat



:Link to video
echo Leave values empty for a non-specific video
set /p show=Paste Show ID: 
if [%show%]==[] (
	set show=SH553715218
)
set /p video=Paste Video ID: 
if [%video%]==[] (
	set video=VDKA3727119
)
adb shell input text disneychannel/show/%show%/video/%video%
cls
goto home

:Homelink
adb shell input text disneychannel/home/
cls
goto home

:All Shows
adb shell input text disneychannel/allshows/
cls
goto home

:Collection
echo Leave value empty for Love Your Planet collection
set /p collection="Paste Collection ID: "
if [%collection%]==[] (
	set collection=2128622
)
adb shell input text disneychannel/collection/%collection%/
cls
goto home

:Show Details
echo Leave value empty to go to non-specific show details page
set /p show="Paste Show ID: "
if [%show%]==[] (
	set show=SH553715218
)
adb shell input text disneychannel/show/%show%/
cls
goto home

:On Now
adb shell input text disneychannel/live/
cls
goto home

:DCOM
adb shell input text disneychannel/allmovies/
cls
goto home

:exitbat
EXIT