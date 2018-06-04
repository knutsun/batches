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
)
if %m%==2 (
set build=4.1.2
)
if %m%==3 (
set build=4.2.0
)
cls
echo 1: FireTV
echo 2: AndroidTV
echo.
set /p p=Which platform? 
echo.
if %p%==1 (
	set platform=FireTV
	if %build%==4.1.0 (
		set file=FireTV_%build%
	)
	if %build%==4.1.2 (
		set file=FireTV_%build%
	)
	if %build%==4.2.0 (
		set file=FireTV_%build%
	)
)
if %p%==2 (
	set platform=AndroidTV 
	if %build%==4.1.0 (
		set file=AndroidTV_%build%
	)
	if %build%==4.1.2 (
		set file=AndroidTV_%build%
	)
	if %build%==4.2.0 (
		set file=AndroidTV_%build%
	)
)
echo Selected build is %build% on platform %platform%
echo.
cls
goto recordTime

rem if platform and build equ *** then file equ platformBuild.txt

:recordTime
echo 1: start
echo 2: end 
echo.
set /p selection= Start time or end time? 
if %selection%==1 goto recordStartTime
if %selection%==2 goto recordEndTime

:recordStartTime
echo Build %build% on %platform% start *%time:~0,5%>> timelog/%file%.txt
pause
echo.
cls
goto menu

:recordEndTime
echo Build %build% on %platform% end *%time:~0,5%>> timelog/%file%.txt
pause
echo.
cls
goto menu


pause