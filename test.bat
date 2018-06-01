@echo off
setlocal EnableExtensions EnableDelayedExpansion

set i=0
set /a x=0
set /a timeCounter=0
for /f "tokens=1*delims=*" %%a in (test.txt) do (
	call echo %%i%%
	call set array[%%i%%]=%%a
	call set n=%%i%%
	set build=%%a
	set build=!build:~6,5!
	echo !build!
	set timeVar=%%b
	rem echo !timeVar!
	set timeInt=!timeVar::=!
	set /a timeDifference= timeInt - prevTime
	echo time difference is !timeDifference!
	set prevTime=!timeVar::=!
	rem echo %timeCounter%
	set /a timeCounter=timeCounter + !timeDifference!
	echo !timeCounter!
	echo array[%%i%%]
	set /A i+=1

)
pause