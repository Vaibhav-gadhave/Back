#!/bin/bash
#Created date :  2024-01-07 05:57:01 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
echo -e "Enter first no "
read -r a
echo -e "Enter secound no "
read -r b

if [ $a -gt $b ]
then 
	echo -e "Your no1 is greater than no2 "
else	
	echo -e "The no1 is not greater than no2 "
fi

#End
