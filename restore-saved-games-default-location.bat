@echo off
taskkill /f /im explorer.exe
timeout /t 2 /nobreak >nul
if not exist "%UserProfile%\Saved Games" mkdir "%UserProfile%\Saved Games"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /t REG_SZ /d "C:\Users\%USERNAME%\Saved Games" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{4C5C32FF-BB9D-43B0-B5B4-2D72E54EAAA4}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Saved Games" /f
attrib +r -s -h "%USERPROFILE%\Saved Games" /S /D
timeout /t 1 /nobreak >nul
start explorer.exe
