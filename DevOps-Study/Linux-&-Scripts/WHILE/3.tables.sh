#!/bin/bash
#Created date :  2024-08-15 09:43:40 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p "Enter the value of which you want to create a table " no1
read -p "Enter the value till which you want the table " no2
value=1

while [ $value -le $no2 ]
do
	result=$(($no1*$value))
	echo -e "$no1 X $value = $result"
	value=$(($value+1))
done

echo "Thanks"



#End
