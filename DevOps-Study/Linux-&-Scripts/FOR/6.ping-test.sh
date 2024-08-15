#!/bin/bash
#Created date :  2024-08-15 09:11:09 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter the ip address for hostname to which you want to ping " ip
read -p "Enter the number how much times you want to ping " no1

for ping in $(seq 1 $no1)
do
	echo -e "\n\n$ping"
	ping -c 1 $ip
done

#End
