@echo off

echo Creating Ghost local User 
set username=Ghost
set password=Ghost@123#
set fullname="Ghost VFX"

net user %username% %password% /add /fullname:%fullname%
net localgroup  %username% /add

echo Running command: Set-DNSClientServerAddress 'Wi-Fi' -ServerAddresses ('192.168.0.10','1.1.1.1')
powershell -Command "Set-DNSClientServerAddress 'Wi-Fi' -ServerAddresses ('192.168.0.10','1.1.1.1')"
echo Running command: Add-Computer -DomainName 'ghostvfx.lan' -Restart
powershell -Command "Add-Computer -DomainName 'ghostvfx.lan' -Restart"
