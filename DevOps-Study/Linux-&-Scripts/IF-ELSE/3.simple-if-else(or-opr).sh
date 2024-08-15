#!/bin/bash
#Created date :  2024-08-14 10:31:54 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
echo -e "Enter the value of A which will be greater than 20 OR value of B which will be less than 50 \n"
read -p "Enter one number " A
read -p "Enter secound number " B

if [ $A -gt 20 -o $B -lt 50 ]
then
	echo -e "Statement is true"
else
	echo -e "Statement is false"
fi


#End
