#!/bin/bash
#Created date :  2024-01-07 06:15:15 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "Enter your age "
read -r age

if test $age -gt 18 ; then
	echo -e "you are young"
	if test $age -gt 25 ; then
	       echo -e "you are gentle man"
        	if test $age -gt 50 ; then
			echo -e "you are respectfull"
	else
	echo -e "you are not respectfull"	
	fi

	else
	echo -e "you are not gentlemen"
        fi

	else 
	echo -e "you are baccha"
	fi	

#End
