#!/bin/bash
#Purpose : 
#Created date :  2020-10-27 06:17:47 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

echo -e "Enter first no \c"
read -r a
echo -e "Enter secound no \c"
read -r b

if [ $a -gt $b ]
then 
	echo -e "Your no1 is greater than no2 "
else	
	echo -e "The no1 is not greater than no2 "
fi



#End
