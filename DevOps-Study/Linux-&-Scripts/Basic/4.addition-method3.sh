#!/bin/bash
#Created date :  2024-08-13 02:38:09 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
# bc is being used here to perform arithmetic operations, potentially involving floating-point numbers or more complex calculations.

read -p "Enter the first number " a
read -p "Enter the secound number " b

result=`expr $a + $b | bc`
echo -e "The addition is $result"
echo "Thank you"

#End
