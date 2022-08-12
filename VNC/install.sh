#!/bin/bash
clear
echo  -e "\033[32;5mInstalling VNC on `hostname`.....\033[0m"
sleep 5

cp /root/vnc-setup.tar.gz / ; cd /
/bin/tar -zxvf vnc-setup.tar.gz ; clear

echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '##########################(100%)\r'
echo -ne '\n'

echo  -e "\033[32;5mInstallation completed.....\033[0m"
sleep 3
clear
echo -e "\033[32;5mPerforming cleanup.....\033[0m"

rm -rf vnc-setup.tar.gz

sleep 5
clear
echo -e "\033[32mPlease reboot to complete the installation.\033[0m" 
