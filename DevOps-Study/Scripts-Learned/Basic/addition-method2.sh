#!/bin/bash
#Created date :  2024-01-05 01:09:55 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p "Enter one number :" num1
read -p "Enter secound number" num2

result=`expr $num1 + $num2 | bc`
echo "Addition is $result"

#End 
