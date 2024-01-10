#!/bin/bash
#Created date :  2024-01-10 05:03:29 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
echo -e "Please enter number in sequence "
read -p "Please enter first and last number " no1 no2
read -p "Please enter number which you want to skip " no3

for each in $(seq $no1 $no2)
do
	if [ $each -eq $no3 ]
	then
		break
	fi
	echo -e "$each"
done
#End
