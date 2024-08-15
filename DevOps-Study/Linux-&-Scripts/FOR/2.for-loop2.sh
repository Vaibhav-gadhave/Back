#!/bin/bash
#Created date :  2024-08-15 08:57:32 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p  "Enter your name " name
read -p "How much times you need to print your name " num

for each in $(seq 1 $num)
do
	echo "My name is $name, and i am DevOps Engineer"
done
echo "Thanks"

#End
