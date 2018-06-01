@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "file=test.txt"
set /A i=0

for /F "usebackq tokens=1*delims=*" %%a in ("%file%") do (
set timeVar=%%b 
set timeInt=!timeVar::=!
set build=%%a
set build=!build:~6,5!
echo !build!
echo !timeInt! is at index !i!
set /a prevTime=!timeInt!
echo previous time is !prevTime!
if !i!==0 (
	echo Don't include this value
) else (
	set /a timeDifference= timeInt - prevTime
	echo time difference is !timeDifference!
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