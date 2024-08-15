#!/bin/bash
#Created date :  2024-08-15 11:21:48 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "This is my Calculator"

select option in Add Sub Multi Div Quit
do
	case $option in
		Add)
			read -p "Enter the first number " no1
			read -p "Enter the secound number " no2
			echo -e "The Addition is $(($no1+$no2))"
			;;
		Sub)
                        read -p "Enter the first number " no1
                        read -p "Enter the secound number " no2
                        echo -e "The Substration is $(($no1-$no2))"
                        ;;
		Multi)
                        read -p "Enter the first number " no1
                        read -p "Enter the secound number " no2
                        echo -e "The Multiplication is $(($no1*$no2))"
                        ;;
		Div)
                        read -p "Enter the first number " no1
                        read -p "Enter the secound number " no2
                        echo -e "The division is $(($no1/$no2))"
                        ;;
		Quit)
                        echo -e "Thanks for using Calculator"
			exit
                        ;;
		*)
                        echo -e "Invalid Argument"
			exit
                        ;;
	esac
done

	


#End
