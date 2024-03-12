#!/bin/bash
#Created date :  2024-01-11 03:55:30 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "How much times do want to print the number: " 
read -r num1

while [ $num1 -lt 100 ]
do
	echo -e "\n$num1"
	num1=$((num1+1))
done


#End
