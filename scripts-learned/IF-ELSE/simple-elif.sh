#!/bin/bash
#Created date :  2024-01-07 11:53:36 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "Enter the 4 numbers one below the other"
read -r A
read -r B
read -r C
read -r D

if [ $A -gt $B -a $A -gt $C -a $A -gt $C ]
then
	echo -e "A is greater"
elif [ $B -gt $C -a $B -gt $D ]
then
	echo -e "B is greater"
elif [ $C -gt $D ]
then
	echo -e "C is greater"
else
	echo -e "D is greater"
fi

#End
