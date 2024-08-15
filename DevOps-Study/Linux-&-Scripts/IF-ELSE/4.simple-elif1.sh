#!/bin/bash
#Created date :  2024-08-14 09:47:51 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter the value of A " A
read -p "Enter the value of B " B
read -p "Enter the value of C " C
read -p "Enter the value of D " D

if [ $A -gt $B -a $A -gt $C -a $A -gt $D ]
then
	echo "A is Greater"
elif [ $B -gt $C -a $B -gt $D ]
then
	echo "B is Greater"
elif [ $C -gt $D ]
then
	echo "C is Greater"
else
	echo "D is Greater"
fi

echo "Thanks"
#End
