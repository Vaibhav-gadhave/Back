#!/bin/bash
#Purpose : 
#Created date :  03:51:54 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start
read -p "Enter one no " a
read -p "Enter second no " b

result=`expr "$a + $b" | bc`
echo -e "Your addition of $a and $b is $result" 

#End
