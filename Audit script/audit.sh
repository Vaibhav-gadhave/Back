#!/bin/bash

read -p "Enter Desk No: " DSK
AETH=$(nmcli connection show --active | grep -E "enp|eth|ens|em|enp0s29u1u4|enp4s0|VodafoneMobileWiFi-B72D" | awk '{print $1}') &> /dev/null
NCS=$(cat /etc/sysconfig/network-scripts/ifcfg-${AETH} | grep -i BOOTPROTO | grep -w "dhcp" &> /dev/null && echo "DHCP" || echo "STATIC") &> /dev/null
KRNL=$(uname -r | awk -F . '{print $1}') &> /dev/null
OSVE=$(cat /etc/redhat-release | sed -n 's/ (Core)//gp') &> /dev/null
SMAC=$(ifconfig | grep -w "ether" | awk '{print $2}' | tr -d "\n" | awk '{print}') &> /dev/null
SHOST=$(hostname -s) &> /dev/null
SIPADDR=$(hostname -I) &> /dev/null
OSVE6=$(cat /etc/redhat-release | sed -n 's/ (Final)//gp') &> /dev/null
SMAC6=$(ifconfig | grep -i HWaddr | awk '{print $5}' | tr -d "\n" | awk '{print}') &> /dev/null
RAM=$(free -h | awk 'NR==2{print $2}') &> /dev/null
PROC=$(cat /proc/cpuinfo | awk 'NR==5 {print $2,$3,$4,$5,$6,$7}') &> /dev/null
HDD1=$(lsblk | grep -i disk | awk 'NR==1{print $4}') &> /dev/null
HDD2=$(lsblk | grep -i disk | awk 'NR==2{print $4}') &> /dev/null
HDD3=$(lsblk | grep -i disk | awk 'NR==3{print $4}') &> /dev/null
HDD4=$(lsblk | grep -i disk | awk 'NR==4{print $4}') &> /dev/null

cat /home/vaibhav/Downloads/hostsentry.csv | grep -w "DESK NO,OS VERSION,MAC Address,Hostname,IP Address,Connection Type,RAM,PROCESSOR,HDD1,HDD2,HDD3,HDD4" &> /dev/null || echo "DESK NO,OS VERSION,MAC Address,Hostname,IP Address,Connection Type,RAM,PROCESSOR,HDD1,HDD2,HDD3,HDD4" >> /home/vaibhav/Downloads/hostsentry.csv

if [ $KRNL == 4 ]
   then
echo -e "${DSK},${OSVE},${SMAC},${SHOST},${SIPADDR},${NCS},${RAM},${PROC},${HDD1},${HDD2},${HDD3},${HDD4}" >> /home/vaibhav/Downloads/hostsentry.csv
else
echo -e "${DSK},${OSVE6},${SMAC6},${SHOST},${SIPADDR},${RAM},${PROC},${HDD1},${HDD2},${HDD3},${HDD4}" >> /home/vaibhav/Downloads/hostsentry.csv
   fi

