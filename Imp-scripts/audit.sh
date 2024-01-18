#!/bin/bash

read -p "Enter Desk No: " DSK
KRNL=$(uname -r | awk -F . '{print $1}') &> /dev/null
OSVE=$(cat /etc/redhat-release | sed -n 's/ (Core)//gp') &> /dev/null
RAM=$(free -h | awk 'NR==2{print $2}') &> /dev/null
PROC=$(cat /proc/cpuinfo | awk 'NR==5 {print $2,$3,$4,$5,$6,$7}') &> /dev/null
HDD1=$(lsblk | grep -i disk | awk 'NR==1{print $4}') &> /dev/null
HDD2=$(lsblk | grep -i disk | awk 'NR==2{print $4}') &> /dev/null
HDD3=$(lsblk | grep -i disk | awk 'NR==3{print $4}') &> /dev/null
HDD4=$(lsblk | grep -i disk | awk 'NR==4{print $4}') &> /dev/null

cat /run/media/vaibhavg/Backup/PC/DOCS/scripts/info.csv | grep -w "DESK NO,Kernel,OS_version,RAM,PROCESSOR,HDD1,HDD2,HDD3,HDD4" &> /dev/null || echo "DESK NO,Kernel,OS_version,RAM,PROCESSOR,HDD1,HDD2,HDD3,HDD4" >> /run/media/vaibhavg/Backup/PC/DOCS/scripts/info.csv


echo "deskno,Kernel,OS_version,RAM,Processor,Hdd1,Hdd2,Hdd3,Hdd4" > info.csv
echo "$DSK,$KRNL,$OSVE,$RAM,$PROC,$HDD1,$HDD2,$HDD3,$HDD4" >> info.csv
