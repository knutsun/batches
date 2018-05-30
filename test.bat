@echo off
setlocal EnableExtensions EnableDelayedExpansion

for /f "tokens=1*delims=*" %%a in (testHours.txt) do ECHO(%%b
	rem for /f "tokens=1*delims=:" %%a in (testHours.txt) do ECHO(%%b
	rem )
	set timeVar = %%b
	echo %%b

)

pause