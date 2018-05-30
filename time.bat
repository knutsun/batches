@echo off


set build=""

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
goto Recordtime1
)
if %m%==2 (
set build=4.1.2
goto Recordtime1
)
if %m%==3 (
set build=4.2.0
goto Recordtime1
)


:Recordtime1
cls
echo Selected build is %build%
echo 1: start
echo 2: end 
set /p selection= Start time or end time? 
if %selection%==1 goto recordStartTime
if %selection%==2 goto recordEndTime

:recordStartTime
echo Build %build% start -%time:~0,5% >> testHours.txt
pause
echo.
cls
goto menu

:recordEndTime
echo Build %build% end -%time:~0,5% >> testHours.txt
pause
echo.
cls
goto menu


pause