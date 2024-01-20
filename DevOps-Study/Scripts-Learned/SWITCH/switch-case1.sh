#!/bin/bash
#Created date :  2024-01-11 11:43:21 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Enter one number:- " no1
read -p "Enter secound number:- " no2

select options in Addition Substraction Multiplication Division Quit
do
	case $options in
		Addition)
			echo "The addition of $no1 and $no2 is $(($no1 + $no2))"
			;;
		Substraction)
                        echo "The Substraction of $no1 and $no2 is $(($no1 - $no2))"
                        ;;
		Multiplication)
                        echo "The Multiplication of $no1 and $no2 is $(($no1 * $no2))"
                        ;;
		Division)
			result=`expr $no1 / $no2 | bc`
                        echo "The Division of $no1 and $no2 is $result"
                        ;;
		Quit)
                        echo "Thanks for using Basic Calculator"
			exit
                        ;;
		*)
			echo "Invalid argument"
			;;
	esac
done


#End
