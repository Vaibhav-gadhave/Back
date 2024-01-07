#!/bin/bash
#Created date :  2024-01-07 06:50:21 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "Hello Wellcome everyone"
read -p "Please enter your maths marks: " M
read -p "Please enter your science marks: " S
read -p "Please enter your biology marks: " B

if [ $M -gt 35 -a $S -gt 35 -a $B -gt 35 ]
then
	echo -e "you are just passed"
	
	if [ $M -gt 50 -a $S -gt 50 -a $B -gt 50 ]
	then
        	echo -e "you are average student"
		if [ $M -gt 90 -a $S -gt 90 -a $B -gt 90 ]
		then
        		echo -e "you are Awesome"
		else
			echo -e "you are not average"
		fi

	else
		echo -e "you are not average student"
	fi

else	
	echo -e "you are not passed"
fi

 
#End
