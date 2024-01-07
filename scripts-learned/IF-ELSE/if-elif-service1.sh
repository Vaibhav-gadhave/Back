#!/bin/bash
#Created date :  2024-01-07 10:16:51 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "Here in this script we are going to turn services On and Off\n"
read -p "Please enter the name of service: " service
read -p "Do you want to check wether the service is Active or Deactive (yes or no): " statuss

if [ "${statuss}" == "yes" ]
then	
	systemctl status docker | awk 'NR==3{print $2}'
fi

if [ "${statuss}" == "no" ]
then
	echo -e "ok"
fi

read -p "Do you wnat to turn it ON or OFF (On or OFF or keep):" action

if [ "${action}" == "On" ]
then	
	echo -e "Starting the service"
	systemctl start $service
	sleep 5
        systemctl status $service 

elif [ "${action}" == "Off" ]
then	
	echo -e "Stopping the service"
	systemctl stop $service
	sleep 5
	systemctl status $service

elif [ "${action}" == "keep" ]
then
	echo -e "keeping the script as it is"

else
	echo -e "invalid option"
fi

#End
