#!/bin/bash
#Purpose : 
#Created date :  2020-10-29 12:27:30 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

read -p "give me sequence of the number :" num1 num2
read -p "which no should we skip :" num3
for each in $(seq $num1 $num2)
do
	if [ $each -eq $num3 ]
	then
		#continue
		break	
	fi
	echo "$each"
done

#End
