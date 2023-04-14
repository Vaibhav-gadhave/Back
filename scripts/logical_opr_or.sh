#!/bin/bash
#Purpose : 
#Created date :  2020-10-28 04:27:33 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

read -p "Enter your first no : " m
read -p "Enter your secound no : " c

if test $m -le 20 -o $c -ge 50
then
	echo -e "statement is true : "
else
	echo -e "statement is fale, try again "
fi


#End
