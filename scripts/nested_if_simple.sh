#!/bin/bash
#Purpose : 
#Created date :  2020-10-29 11:36:48 AM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

echo -e "***************Please use positive no***************"

read -p "Enter the first value " a
read -p "Enter the first value " b

if [ $a == $b -a $a -gt 0 -a $b -gt 0 ]
then
	   echo "a is equal to b"
   elif [ $a -gt $b -a $a -gt 0 -a $b -gt 0 ]
   then
	      echo "a is greater than b"
      elif [ $a -lt $b -a $a -gt 0 -a $b -gt 0 ]
      then
	         echo "a is less than b"
else
	echo -e "\n***************Its a negative no************"
fi

#End
