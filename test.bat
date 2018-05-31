@echo off
setlocal EnableExtensions EnableDelayedExpansion

set i=0
for /f "tokens=1*delims=-" %%a in (testHours.txt) do (
	set timeVar=%%b
	set timeInt=!timeVar::=!
	rem set /a tempIndex=1
	rem set prevTime=[tempIndex] !timeInt!
	rem set build=%%a
	rem echo !build!
	rem set dontInclude=Build
	rem set replaceWith=
	rem set build=%build:dontInclude=!replaceWith!% 
	rem echo !build!
	rem echo !timeVar!
	rem set timeVariable=[!i!] !timeVar::=!
	set /a totalTime= timeInt - prevTime
	rem echo !totalTime! >> hours.txt
	rem echo !timeVariable!
	set prevTime=!timeVar::=!
	rem echo previous is: !prevTime!
	set calcForBuild=!totalTime!
	echo !calcForBuild!
	set /A i+=1

)
pause