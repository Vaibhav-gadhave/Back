#!/bin/bash
#Created date :  2024-01-11 04:02:54 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p "Enter one number : " num1

while true
do
	echo -e "$num1"
	if [ $num1 -eq 20 ]
	then
		break
	fi
	num1=$((num1+1))
	
done
#End
