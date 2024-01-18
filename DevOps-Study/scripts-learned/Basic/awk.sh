#!/bin/bash
#Created date :  2024-01-05 04:50:56 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p "Enter your service : " service
echo "Your entered service is $service"
status="$(systemctl status $service | awk 'NR==3 {print $2}')"
echo -e "your status of $service is \033[92m$status\033[0m"

#End
