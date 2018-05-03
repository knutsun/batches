@echo off
adb kill-server
adb connect 172.27.0.54
adb devices
pause