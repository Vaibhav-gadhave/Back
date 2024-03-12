#!/bin/bash
#Created date :  2024-01-11 04:56:42 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
echo -e "Enter the number of which you want table"
read -r a
b=1

while [ $b -le 10 ]
do
	result=$((a*b))
	echo -e "$a x $b = $result"
	b=$(($b+1))
done
#End
