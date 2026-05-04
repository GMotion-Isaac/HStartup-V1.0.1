@echo off
setlocal enabledelayedexpansion
title HStartup Installer

net session >nul 2>&1
if %errorLevel% neq 0 (
    cls
    echo.
    echo HStartup requires your permission to schedule the task that is in charge 
    echo of starting the logic, please accept the UAC prompt!
    echo.
    for /L %%i in (5,-1,1) do (
        <nul set /p "=Requesting UAC in %%i... "
        timeout /t 1 >nul
        echo | set /p ="
    )
    powershell start -verb runas '"%~0"' & exit /b
)

pushd "%~dp0"
set "src=HSInstallAssets"
set "dst=HStartupAssets"

cls
echo.
echo   HHHHH  HHHHH   SSSSSSSSS
echo   HHHHH  HHHHH  SSSSSSSSSS
echo   HHHHHHHHHHHH  SSSS
echo   HHHHHHHHHHHH   SSSSSSSSS
echo   HHHHH  HHHHH        SSSS
echo   HHHHH  HHHHH  SSSSSSSSSS
echo   HHHHH  HHHHH   SSSSSSSSS
echo FREE STARTUP SOUND CUSTOMIZER
echo -------------------------------
echo HStartup Setup Program
echo.

timeout /t 1 /nobreak >nul

attrib -h "%~dp0%src%\*" /s /d >nul 2>&1

if not exist "%src%\logic.vbs" (
    start "" wscript.exe "%src%\HS-Troubleshooter.vbs" "crit" "Download failed: logic.vbs is missing from the source folder."
    goto :error
)
if not exist "%src%\HSsound.wav" (
    start "" wscript.exe "%src%\HS-Troubleshooter.vbs" "crit" "Download failed: HSsound.wav is missing from the source folder."
    goto :error
)

if not exist "%dst%" mkdir "%dst%"

echo [1/3] Downloading logic.vbs...
copy /y "%src%\logic.vbs" "%dst%\logic.vbs" >nul
timeout /t 1 /nobreak >nul

echo [2/3] Downloading HSsound.wav...
copy /y "%src%\HSsound.wav" "%dst%\HSsound.wav" >nul
timeout /t 1 /nobreak >nul

copy /y "%src%\HS-Troubleshooter.vbs" "%dst%\HS-Troubleshooter.vbs" >nul

echo [3/3] Scheduling task...
schtasks /create /tn "HStartupTask" /tr "wscript.exe \"%cd%\%dst%\logic.vbs\"" /sc onlogon /it /f >nul

if %errorLevel% neq 0 (
    start "" wscript.exe "%src%\HS-Troubleshooter.vbs" "crit" "Failed to schedule the task. Check your Antivirus or run this as administrator."
    goto :error
)

echo Waiting for PowerShell to respond...
powershell -Command "$setting = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries; Set-ScheduledTask -TaskName 'HStartupTask' -Settings $setting" >nul

cls
echo.
echo  HHHHH  HHHHH   SSSSSSSSS
echo  HHHHH  HHHHH  SSSSSSSSSS
echo  HHHHHHHHHHHH  SSSS
echo  HHHHHHHHHHHH   SSSSSSSSS
echo  HHHHH  HHHHH        SSSS
echo  HHHHH  HHHHH  SSSSSSSSSS
echo  HHHHH  HHHHH   SSSSSSSSS
echo.
echo Setup success!
echo Running test...
start "" wscript.exe "%cd%\%dst%\logic.vbs"

timeout /t 10
popd
exit

:error
cls
echo.
echo An error ocurred.
echo Please check the popup window for details.
echo.
pause
popd
exit
