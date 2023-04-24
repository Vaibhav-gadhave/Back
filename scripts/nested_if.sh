#!/bin/bash
#Purpose : 
#Created date :  2020-10-29 11:18:31 AM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

read -p "Enter your maths marks : " m
read -p "Enter your physics marks : " p
read -p "Enter your chemestry marks : " c

if test $m -ge 35 -a $p -ge 35 -a $c -ge 35
then
		echo -e "Congrats you are pass in all subjects : "
		total=`expr $m + $p + $c`
		avg=`expr $total / 3`
		echo -e "The total marks obtained are $total "
		echo -e "The total average obtained are $avg "
		
		if test $avg -ge 75 
		then
			echo -e "Congrats you got distinction"
		elif test $avg -ge 60 -a $avg -lt 75
		then
			echo -e "Congrats you are first class"
		elif test $avg -ge 50 -a $avg -lt 60
		then
			echo -e "You are secound class"
		elif test $avg -ge 35 -a $avg -lt 50
		then
			echo -e "You are third class"
		 fi
		 	
else
        echo -e "You are failed \" God bless you \" "
		fi


#End
