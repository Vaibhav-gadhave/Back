#!/bin/bash
#Purpose : 
#Created date :  2020-10-30 05:36:55 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

read -p "Enter one number : " no1
read -p "Enter secound number : " no2

echo "1. Addition"
echo "2. Subtraction"
echo "3. Division"
echo "4. Multiplication"
echo "5. Quit"
read -r ch

case $ch in 
1) echo "Addition is `expr $no1 + $no2`"  ;;
2) echo "Subtraction is `expr $no1 - $no2`";;
3) echo "Division is `expr $no1 / $no2`" ;;
4) echo "Multiplication is `expr $no1 \* $no2`" ;;
5) echo "Thanks for using Calculator `exit`" ;;
*) echo "Invald argument"

esac



#End
