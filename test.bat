@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "file=test.txt"
set /A i=1
set /a timeCounter=0
for /F "usebackq tokens=1*delims=*" %%a in ("%file%") do (
set timeVar=%%b 

set currentHour=%%b
set currentHour=!currentHour:~0,2!
set currentMinute=%%b
set currentMinute=!currentMinute:~3,4!
set /a currentTime=!currentHour!*60
set /a currentTime=!currentTime!+!currentMinute!


set build=%%a
set build=!build:~6,5!

set /a divnumber=!i!/2
set /a sum=!divnumber!*2

if !i! NEQ !sum! (
	set /a prevHour=!currentHour!
	set /a prevMinute=!currentMinute!
	set /a prevTime=!prevHour!*60
	set /a prevTime=!prevTime!+!prevMinute!
	)
if !i! EQU !sum! (
	set /a timeDifference= currentTime - prevTime
	set /a timeCounter=timeCounter + timeDifference
	)

set /A i+=1
)

echo total time for !build! is !timeCounter! minutes
echo.
pause