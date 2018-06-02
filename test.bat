@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "file=test.txt"
set /A i=0
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
if !i!==0,2,4,6 (
	set /a prevTime=!currentTime!
	echo.
) else (
	set /a timeDifference= currentTime - prevTime
	set /a timeCounter=timeCounter + timeDifference
	echo time difference is !timeDifference!
	echo total time is !timeCounter!
	echo.
)
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