#!/bin/bash
#Purpose : 
#Created date :  2020-10-29 06:16:34 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

num=1
while true
do
	echo "$num"
		if [ $num -eq 10 ]
	then
 		break
		fi
	num=$((num+1))
done

#End
