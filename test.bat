@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "file=test.txt"
set /A i=1
set /a timeCounter=0
for /F "usebackq tokens=1*delims=*" %%a in ("%file%") do (
set timeVar=%%b 
set currentTime=!timeVar::=!

set currentHour=%%b
set currentHour=!currentHour:~0,2!
echo current hour is !currentHour!
set currentMinute=%%b
set currentMinute=!currentMinute:~3,4!
echo current minute is !currentMinute!
set /a currentTime=!currentHour!*60
set /a currentTime=!currentTime!+!currentMinute!


set build=%%a
set build=!build:~6,5!
echo !build!
echo.
echo !currentTime! is at index !i!
echo previous time is !currentTime!

set /a divnumber=!i!/2
rem echo div number is !divnumber!
set /a sum=!divnumber!*2
rem echo sum is !sum!

if !i! NEQ !sum! (
	echo ITS ODD
	set /a prevHour=!currentHour!
	set /a prevMinute=!currentMinute!
	rem set /a prevTime=!currentTime!
	echo prev time is !prevHour! and !prevMinute!
	set /a prevTime=!prevHour!*60
	set /a prevTime=!prevTime!+!prevMinute!
	echo prev time is !prevTime!
	echo.
	)
if !i! EQU !sum! (
	echo ITS EVEN
	set /a timeDifference= currentTime - prevTime
	rem set /a timeDifference=((currentHour*60)+currentMinute) - ((prevHour*60)+prevMinute)

	set /a timeCounter=timeCounter + timeDifference
	echo time difference is !timeDifference!
	echo total time is !timeCounter!
	echo.
	)


rem if !i!==!index! (
rem 	set /a prevTime=!currentTime!
rem 	echo prev time is !prevTime!
rem 	echo.
rem ) else (
rem 	set /a timeDifference= currentTime - prevTime
rem 	set /a timeCounter=timeCounter + timeDifference
rem 	echo time difference is !timeDifference!
rem 	echo total time is !timeCounter!
rem 	echo.
rem )

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

rem :odds
rem 	set /a index=0
rem 	echo set to one for odd
rem 	pause
rem 	goto continue

rem :evens
rem 	set /a index=1
rem 	echo set to two for even
rem 	pause
rem 	goto continue
