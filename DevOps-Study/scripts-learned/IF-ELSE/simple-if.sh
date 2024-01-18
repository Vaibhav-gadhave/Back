#!/bin/bash
#Created date :  2024-01-07 10:05:59 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter the value of A:- " A
read -p "Enter the value of B:- " B

if [ $A -eq $B ]
then
	echo -e "A is equal to B"
fi

if [ $A -ne $B ]
then
	echo -e "A is not equal to B"
fi

#End
