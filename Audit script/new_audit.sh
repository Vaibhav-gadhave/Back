#!/bin/bash

# Prompt the user to enter the desk number
read -p "Enter desk number: " desk_number

# Collect information about the system
processor=$(lscpu | grep "Model name:" | sed -e 's/^[ \t]*//')
ram=$(free -m | awk '/Mem:/ {print $2 " MB"}')
ip_address=$(hostname -I)
graphics_card=$(lspci | grep -i vga | awk '{print $5}')
os_version=$(lsb_release -d | awk -F"\t" '{print $2}')
mac_address=$(ip link | awk '/ether/ {print $2}')
hostname=$(hostname)
hdd1=$(df -h | awk '$NF=="/"{printf "%s/%s\n", $3,$2}')
hdd2=$(df -h | awk '$NF=="/home"{printf "%s/%s\n", $3,$2}')

# Write the information to an Excel sheet
echo -e "Desk Number\tProcessor\tRAM\tIP Address\tGraphics Card\tOS Version\tMAC Address\tHostname\tHDD1\tHDD2" > ~/desk-info.xlsx
echo -e "$desk_number\t$processor\t$ram\t$ip_address\t$graphics_card\t$os_version\t$mac_address\t$hostname\t$hdd1\t$hdd2" >> ~/desk-info.xlsx

# Open the Excel sheet
xdg-open ~/desk-info.xlsx
