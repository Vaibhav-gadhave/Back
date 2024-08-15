#!/bin/bash
#Created date :  2024-08-15 09:06:10 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter the first and last number " no1 no2
read -p "Enter the number which you  dont want in between " no3

for each in $(seq $no1 $no2)
do
	if [ $each -eq $no3 ]
	then
	       continue
	fi
echo "$each"
done
echo "Thanks"
#End
