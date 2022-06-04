#!/bin/bash
#Purpose : 
#Created date :  2020-10-28 04:20:39 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

read -p "Enter your maths marks : " m
read -p "Enter your physics marks : " p
read -p "Enter your chemestry marks : " c

if test $m -ge 35 -a $p -ge 35 -a $c -ge 35
then
	echo -e "Congrats you are pass in all subjects : "
else
	echo -e "You have less marks in subjects \" God bless you \" "
fi


#End
