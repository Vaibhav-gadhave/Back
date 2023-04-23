#!/bin/bash

select opt in addition subtraction division multiplication quit
do
	case $opt in
		addition)
			read -p "Enter num1 " num1
			read -p "Enter num2 " num2
			echo "The addition of $num1 and $num2 is $((num1+num2))"
			;;
		subtraction)
			read -p "Enter num1 " num1
                        read -p "Enter num2 " num2
                        echo "The subtraction of $num1 and $num2 is $((num1-num2))"
                        ;;
		division)
			read -p "Enter num1 " num1
                        read -p "Enter num2 " num2
                        echo "The division of $num1 and $num2 is $((num1/num2))"
                        ;;
		multiplication)
			read -p "Enter num1 " num1
                        read -p "Enter num2 " num2
                        echo "The multiplication of $num1 and $num2 is $((num1*num2))"
                        ;;
		quit)
			echo "Thanks for using calculator"
			exit
			;;
		*) 
			echo "Invalid option"
	esac
done
