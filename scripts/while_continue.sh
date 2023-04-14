#!/bin/bash
#Purpose : 
#Created date :  2020-10-29 05:46:53 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

opt=y
while [ $opt = y -o $opt = Y ]
do
	read -p "Please enter yhe number : " num
	if [ $num -le 50 ]
	then
		sqr=`expr $num \* $num`
		echo "Square of number provided is $sqr"
	else 
		echo "Number is not in range"
	fi
	
	read -p "Do you want to continue [y/n]: " wish
	if [ $wish = y -o $wish = Y ]
	then
		continue
	else 
		echo "Thanks for exiting"
		exit
	fi
done

#End
