@echo off
setlocal

:MENU
cls
echo 1. Delete Task
echo 2. Delete Assets Folder
echo 3. Uninstall All
echo 4. Exit
echo.
set /p c="> "

if "%c%"=="1" goto OP1
if "%c%"=="2" goto OP2
if "%c%"=="3" goto OP3
if "%c%"=="4" exit
goto MENU

:OP1
schtasks /delete /tn "HStartup_Task" /f >nul 2>&1
echo Task Deleted.
pause
exit

:OP2
if exist "%~dp0HStartupAssets" (
    rd /s /q "%~dp0HStartupAssets" >nul 2>&1
    echo Folder Deleted.
) else (
    echo Directory Not Found.
)
pause
exit

:OP3
schtasks /delete /tn "HStartup_Task" /f >nul 2>&1
echo Set fso = CreateObject("Scripting.FileSystemObject") > "%temp%\hsc.vbs"
echo WScript.Sleep 1000 >> "%temp%\hsc.vbs"
echo On Error Resume Next >> "%temp%\hsc.vbs"
echo fso.DeleteFolder("%~dp0"), True >> "%temp%\hsc.vbs"
echo MsgBox "HStartup removed.", 64, "HStartup" >> "%temp%\hsc.vbs"
echo fso.DeleteFile(WScript.ScriptFullName) >> "%temp%\hsc.vbs"
start "" wscript.exe "%temp%\hsc.vbs"
exit