@echo off

:: Disable current user and enable administrator user with password
net user %username% /active:no
net user Administrator $treamland@2023 /active:yes

:: Disable Screenshot
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableSnippingTool" /t REG_DWORD /d 1 /f

:: Disable Wi-Fi/Bluetooth
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowBluetooth" /v "value" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\Settings\AllowWiFi" /v "value" /t REG_DWORD /d 0 /f

:: Disable USB Storage
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v "Start" /t REG_DWORD /d 4 /f

:: Enable Lock Screen after 5 minutes
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t REG_SZ /d 1 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t REG_SZ /d 300 /f

:: Enable Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 0 /f

:: Schedule Windows Update after one week
schtasks /Create /SC WEEKLY /D MON /TN "Windows Update" /TR "cmd /c start /w /b /min wuauclt /detectnow"

echo Configuration changes applied successfully.
pause
