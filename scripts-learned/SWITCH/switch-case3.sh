#!/bin/bash
#Created date :  2024-01-11 03:08:52 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter 1st number: " no1
read -p "Enter 2nd number  " no2

echo "1. Addition"
echo "2. Subtraction"
echo "3. Division"
echo "4. Multiplication"
echo "5. Quit"
read -r ch

case $ch in
	1)
		echo -e "Addition of $no1 and $no2 is $((no1+no2))"
		;;
	2)
		echo -e "Substraction of $no1 and $no2 is $((no1-no2))"
		;;
	3)
		echo -e "Division of $no1 and $no2 is $((no1/no2))"
		;;
	4)
		echo -e "Multipication of $no1 and $no2 is $((no1*no2))"
		;;
	5)
		echo -e "Thanks for using Calculator"
		exit
		;;
	*)	
		echo "Invalid Input"
		;;
	esac

#End
