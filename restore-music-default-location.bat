@echo off
taskkill /f /im explorer.exe
timeout /t 2 /nobreak >nul
if not exist "%UserProfile%\Music" mkdir "%UserProfile%\Music"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /t REG_SZ /d "C:\Users\%USERNAME%\Music" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{A0C69A99-21C8-4671-8703-7934162FCF1D}" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Music" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d %%USERPROFILE%%"\Music" /f
attrib +r -s -h "%USERPROFILE%\Music" /S /D
timeout /t 1 /nobreak >nul
start explorer.exe
