#!/bin/bash
#Purpose : 
#Created date :  06:29:05 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start
read -p "Enter the service name :" service
read -p "Enter the action start or stop :" action

if [ "${action}" == "start" ]
then
	echo "We are starting the $service"
	systemctl start $service
fi
 
if [ "${action}" == "stop" ]
then
	echo "We are stoping the $service"
	systemctl stop $service
fi

status="$(systemctl status $service | awk 'NR==3 {print$2}')"
echo "The service status is $status"
#End
