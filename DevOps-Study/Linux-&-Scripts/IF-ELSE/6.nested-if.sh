#!/bin/bash
#Created date :  2024-08-14 10:46:42 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "Enter your age "
read -r age

if test "$age" -gt 10 ; then
    echo -e "you are young"

    if test "$age" -gt 25 ; then
        echo -e "you are a gentleman"

        if test "$age" -gt 50 ; then
            echo -e "you are respectful"

            if test "$age" -gt 100 ; then
                echo -e "you are a ghost"
            else
                echo -e "Do exercise everyday"
            fi
        else 
	    echo "Work everyday"
        fi
   else
	echo "Dont eat fast food"
    fi
else
	echo "You are small"
fi

#End
