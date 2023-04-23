#!/bin/bash
#Purpose : 
#Created date :  2020-10-30 05:35:24 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

read -p "Enter number 1 " no1
read -p "Enter number 2 " no2

select opt in Addition Subtraction multiplication division quit
do
	case $opt in
	Addition)
		echo "The addition of $no1 and $no2 is $((no1+no2))"
		;;
        Subtraction)
                result=`expr "$no1 + $no2" | bc`
		echo "The subtraction of $no1 and $no2 is $result"
		;;
        multiplication)
                echo "The multiplication of $no1 and $no2 is $((no1*no2))"
		;;
        division)
		result=`expr "$no1 / $no2" | bc`
                echo -e "The division of $no1 and $no2 is $result"
		;;	
	quit) 	
		echo "Thanks for using calculator "
		exit
		;;
	*) 
		echo "Invalid argument"
		;;
	esac	
done


#End
