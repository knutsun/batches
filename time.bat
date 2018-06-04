@echo off


set build=""

echo ~~~Time on Builds~~~
echo.

:menu
echo Which build?
echo.
echo 1: 4.1.0
echo 2: 4.1.2
echo 3: 4.2.0
echo.
set /p m=Make a Selection: 
echo.
if %m%==1 (
set build=4.1.0
goto recordTime
)
if %m%==2 (
set build=4.1.2
goto recordTime
)
if %m%==3 (
set build=4.2.0
goto recordTime
)


:recordTime
cls
echo 1: FireTV
echo 2: AndroidTV
echo.
set /p p=Which platform? 
echo.
if %p%==1 (
	set platform=FireTV 
)
if %p%==2 (
	set platform=AndroidTV 
)
echo Selected build is %build% on platform %platform%
echo.
cls
echo 1: start
echo 2: end 
echo.
set /p selection= Start time or end time? 
if %selection%==1 goto recordStartTime
if %selection%==2 goto recordEndTime

:recordStartTime
echo Build %build% on %platform% start *%time:~0,5%>> testHours.txt
pause
echo.
cls
goto menu

:recordEndTime
echo Build %build% on %platform% end *%time:~0,5%>> testHours.txt
pause
echo.
cls
goto menu


pause