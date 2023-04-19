#!/bin/bash
#Purpose : 
#Created date :  2020-10-30 06:51:54 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

read -p "Enter ip address you want to ping : " ip
until ping -c 3 $ip
do
	echo "Host $ip is still down"
	sleep 1
done

echo "host $ip is up now"

#End
