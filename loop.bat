@echo off
setlocal EnableExtensions EnableDelayedExpansion



set BaseDir=C:\Users\Tester\Desktop\adb\timelog

for %%F in ("%BaseDir%\*.*")do (
	set file=%%~F
	echo !file!
	set /A i=1
	set /a timeCounter=0


for /F "usebackq tokens=1*delims=*" %%a in ("!file!") do (

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


set /a timeInMinutes=!timeCounter!*100
set /a hours=!timeInMinutes!/60
echo Hours: !hours:~0,1!.!hours:~1,2!
echo Total time for !build! is !hours:~0,1!.!hours:~1,2! hours or !timeCounter! minutes
echo.


pause
echo.




	)
rem pause



rem set "file=testHours.txt"
rem set /A i=1
rem set /a timeCounter=0



rem for /F "usebackq tokens=1*delims=*" %%a in ("%file%") do (

rem 	set timeVar=%%b 
rem 	set currentHour=%%b
rem 	set currentHour=!currentHour:~0,2!
rem 	set currentMinute=%%b
rem 	set currentMinute=!currentMinute:~3,4!
rem 	set /a currentTime=!currentHour!*60
rem 	set /a currentTime=!currentTime!+!currentMinute!

rem 	set build=%%a
rem 	set build=!build:~6,5!

rem 	set /a divnumber=!i!/2
rem 	set /a sum=!divnumber!*2

rem 	if !i! NEQ !sum! (
rem 		set /a prevHour=!currentHour!
rem 		set /a prevMinute=!currentMinute!
rem 		set /a prevTime=!prevHour!*60
rem 		set /a prevTime=!prevTime!+!prevMinute!
rem 	)
rem 	if !i! EQU !sum! (
rem 		set /a timeDifference= currentTime - prevTime
rem 		set /a timeCounter=timeCounter + timeDifference
rem 	)

rem 	set /A i+=1
rem )


rem set /a timeInMinutes=!timeCounter!*100
rem SET /A hours=!timeInMinutes!/60
rem ECHO Hours: %hours:~0,1%.%hours:~1,2%
rem echo.

rem echo Total time for !build! is %hours:~0,1%.%hours:~1,2% hours or !timeCounter! minutes
rem echo.


rem pause

