@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "file=test.txt"
set /A i=1
set /a timeCounter=0
for /F "usebackq tokens=1*delims=*" %%a in ("%file%") do (
set timeVar=%%b 
set currentTime=!timeVar::=!
set build=%%a
set build=!build:~6,5!
echo !build!
echo.
echo !currentTime! is at index !i!
echo previous time is !currentTime!

set /a divnumber=!i!/2
rem echo !divnumber!
set /a sum=!divnumber!*2
if !i! NEQ !sum! goto odds
if !i! EQU !sum! goto evens


if !i!==!index! (
	set /a prevTime=!currentTime!
	echo prev time is !prevTime!
	echo.
) else (
	set /a timeDifference= currentTime - prevTime
	set /a timeCounter=timeCounter + timeDifference
	echo time difference is !timeDifference!
	echo total time is !timeCounter!
	echo.
)
:continue
call set array[%%i%%]=%%b
call set n=%%i%%
set /A i+=1
)

rem prints out each line of text file as an array
rem for /L %%i in (1,1,%n%) do call echo %%array[%%i]%% 
rem 	if %%array[%%i]%% == %%array[%%i]%% (
rem 		echo this is it
rem 		pause
rem 	)
pause

:odds
	set /a index=0
	echo set to one for odd
	pause
	goto continue

:evens
	set /a index=1
	echo set to two for even
	pause
	goto continue
