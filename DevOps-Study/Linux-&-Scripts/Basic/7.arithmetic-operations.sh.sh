#!/bin/bash
#Created date :  2024-08-13 03:10:35 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
read -p "Enter one number: " num1
read -p  "Enter another number: " num2

echo -e "Addition of $num1 and $num2 is `expr "$num1 + $num2" | bc` "
echo -e "Substraction of $num1 and $num2 is `expr "$num1 - $num2" | bc` "
echo -e "Division of $num1 and $num2 is `expr "$num1 / $num2" | bc` "
echo -e "Multiplication of $num1 and $num2 is `expr "$num1 * $num2" | bc` "
echo -e "Thanks"

#End
