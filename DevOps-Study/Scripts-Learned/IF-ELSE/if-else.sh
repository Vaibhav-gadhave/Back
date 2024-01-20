#!/bin/bash
#Created date :  2024-01-07 09:47:47 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter value of A:- " A
read -p "Enter value of B:- " B

if [ $A -gt $B ]
then
	echo -e "A is greater than B "
else	
	echo -e "B is greater than A"
fi

#End
