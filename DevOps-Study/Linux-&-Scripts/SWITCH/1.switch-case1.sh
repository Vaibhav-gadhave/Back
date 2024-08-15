#!/bin/bash
#Created date :  2024-08-15 11:07:31 AM
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
                echo "The substraction of $no1 and $no2 is $(($no1 - $no2))"
                ;;
        Multiplication)
                echo "The multiplication of $no1 and $no2 is $(($no1 * $no2))"
                ;;
        Division)
                echo "The division of $no1 and $no2 is $(($no1 / $no2))"
                ;;
        Quit)
                echo "Thanks for using Calculator "
		exit
		;;	
        *)
                echo "Invalid Argument"
		exit
                ;;
esac
done
		
#End
