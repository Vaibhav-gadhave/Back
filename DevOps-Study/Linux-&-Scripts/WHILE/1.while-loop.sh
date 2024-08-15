#!/bin/bash
#Created date :  2024-08-15 09:21:38 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p "Enter from which you want to start the sequence " no1
read -p "Enter from which you want to end the sequence " no2
while [ $no1 -le $no2 ]
do
	echo "$no1"
	no1=$(($no1+1))
done
echo "Thanks"
#End
