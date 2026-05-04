@echo off
title HStartup Task Remover

net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~0' -Verb RunAs"
    exit /b
)

echo ===========================================
echo =                                         =
echo =         HStartup Task Remover           =
echo =                                         =
echo ===========================================
echo.
echo This will remove the task for HStartup
echo You can setup HStartup again at any moment you'd like.
echo.
echo Press ENTER to remove the task... 
echo (Or close this window to cancel)
echo.
pause >nul

echo.
echo Removing the custom startup task...
schtasks /delete /tn "HStartupTask" /f >nul 2>&1

if %errorlevel% equ 0 (
    echo [SUCCESS] Task removed successfully.
    echo.
    echo You can now safely delete the software.
) else (
    echo An error ocurred: Could not find the task "HStartupTask".
    echo.
    echo It looks like the task was already deleted or never created.
)

echo.
echo Press any key to exit.
pause >nul
exit
