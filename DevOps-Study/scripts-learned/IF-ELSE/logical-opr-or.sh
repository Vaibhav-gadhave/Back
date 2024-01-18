#!/bin/bash
#Created date :  2024-01-07 03:55:22 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter one number" A
read -p "Enter secound number" B

if test $A -gt 20 -o $B -lt 50
then
	echo -e "Statement is true"
else
	echo -e "Statement is false"
fi

#End
