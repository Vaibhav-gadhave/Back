#!/bin/bash
#Purpose : 
#Created date :  06:29:45 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start
read -p "Enter service for action :" service
read -p "Enter start or stop for service :" action

echo "Your entered service is $service"
if [ "${action}" == "start" ]
then
	echo "service is starting"
	systemctl start $service
	systemctl status $service | awk 'NR==3 {print$2}'
fi

if [ "${action}" == "stop" ]
then
	echo "service is stoping"
	systemctl stop $service
	systemctl status $service | awl 'NR==3 {print$2}'
fi
#End
