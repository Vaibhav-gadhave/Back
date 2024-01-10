#!/bin/bash
#Created date :  2024-01-10 06:00:35 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p "Please enter the host that you need to find " host
read -p "How much time do you want to ping test " no1

for ping in $(seq 1 $no1)
do
	echo -e "\n\n$ping"
	ping -c 1 $host
	
done
#End
