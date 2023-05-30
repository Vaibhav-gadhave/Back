@echo off

set "interfaceName=Ethernet"
set "subnetMask=255.255.0.0"
set "defaultGateway=192.168.0.1"
set "dnsServer1=1.1.1.1"
set "dnsServer2=8.8.8.8"

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    for /f "tokens=1 delims= " %%b in ("%%a") do (
        set "dynamicIP=%%b"
        goto :next
    )
)

:next

netsh interface ip set address name="%interfaceName%" static %dynamicIP% %subnetMask% %defaultGateway% 1

echo Static IP address configuration applied successfully.
pause
