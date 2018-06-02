@echo off
setlocal EnableExtensions EnableDelayedExpansion


for /f %%a in (text.txt) do set compnumber=%%a
	set /a divnumber=%compnumber%/2
	set /a sum=%divnumber%*2
	if %compnumber% NEQ %sum% goto odds
	if %compnumber% EQU %sum% goto evens

:odds
	echo this number is odds
	pause
	goto :eof
pause

:evens
	echo this number is evens
	pause
	goto :eof

