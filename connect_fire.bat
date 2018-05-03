@echo off
adb kill-server
adb connect 172.27.5.21
adb devices
pause