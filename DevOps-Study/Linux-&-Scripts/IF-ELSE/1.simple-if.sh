#!/bin/bash
#Created date :  2024-08-14 09:38:56 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter first number " a
read -p "Enter secound number " b

if [ $a -gt $b ] 
then
	echo "First number is Greater"
fi

if [ $b -gt $a ] 
then
	echo "Secound number is Greater"
fi

echo "Thanks"

#End
