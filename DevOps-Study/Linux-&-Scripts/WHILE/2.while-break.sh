#!/bin/bash
#Created date :  2024-08-15 09:34:43 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p "Enter from which you want to start the sequence " no1
read -p "Enter from which you want to end the sequence " no2
read -p "Enter from which you want to break the sequence " no3

while true
do
	echo -e "\n $no1"
	if [ $no1 -eq $no3 ]
	then
		break
	fi
	no1=$(($no1+1))
done

#End
