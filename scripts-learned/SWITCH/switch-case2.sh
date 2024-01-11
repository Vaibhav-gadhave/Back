#!/bin/bash
#Created date :  2024-01-11 12:41:40 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

select option in Addition Substraction Multiplication Division Quit
do
	case $option in
		Addition)
		 	read -p "Enter 1st number: " num1
			read -p "Enter 2nd number: " num2
			echo -e "Your Addition is $((num1+num2))"
			;;

		Substraction)
                        read -p "Enter 1st number: " num1
                        read -p "Enter 2nd number: " num2
                        echo -e "Your Substraction is $((num1-num2))"
                        ;;

                Division)
                        read -p "Enter 1st number: " num1
                        read -p "Enter 2nd number: " num2
                        echo -e "Your Division is $((num1/num2))"
                        ;;

                Multiplication)
                        read -p "Enter 1st number: " num1
                        read -p "Enter 2nd number: " num2
                        echo -e "Your Addition is $((num1*num2))"
                        ;;

                Quit)
                        echo -e "Thank you very much"
			exit
                        ;;

		*)
			echo -e "Invalid Input"
			;;
			
	esac
done



#End
