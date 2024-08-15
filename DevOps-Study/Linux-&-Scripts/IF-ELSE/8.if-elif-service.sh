#!/bin/bash
#Created date :  2024-08-14 10:00:37 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "Here in this script we are going to turn services On and Off\n"
read -p "Please enter the name of service: " service
read -p "Do you want to check wether the service is Active or Deactive (yes or no): " status

if [ "${status}" == "yes" ]
then
	systemctl status $service | awk 'NR==3 {print $2}'
fi

if [ "${status}" != "yes" ]
then
	echo "ok no problem"
fi

read -p "Do you want to turn it ON or OFF (On or Off or Keep):" action

if [ "${action}" == "On" ]
then
	systemctl start $service 
	sleep 5
	systemctl status $service | awk 'NR==3 {print $2}'
elif [ "${action}" == "Off" ]
then
        systemctl stop $service 
        sleep 5
        systemctl status $service | awk 'NR==3 {print $2}'
elif [ "${action}" == "Keep" ]
then
        systemctl status $service | awk 'NR==3 {print $2}'
else
	echo "Typo Mistake"
fi


#End
