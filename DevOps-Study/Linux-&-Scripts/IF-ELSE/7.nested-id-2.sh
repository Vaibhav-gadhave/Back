#!/bin/bash
#Created date :  2024-08-14 11:19:34 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
echo -e "Welcome Students"
read -p "Enter Physics Marks " p
read -p "Enter Maths Marks " m
read -p "Enter Chemistry Marks " c

if test "$p" -gt 35 -a "$m" -gt 35 -a "$c" -gt 35 ; then
    echo "You have passed, please study more."      
    if test "$p" -gt 50 -a "$m" -gt 50 -a "$c" -gt 50 ; then
        echo "You are an average student."
        if test "$p" -gt 90 -a "$m" -gt 90 -a "$c" -gt 90 ; then
            echo "You are intelligent."
        else
            echo "Keep working hard to reach the top!"
        fi
    else
        echo "You have passed but are below average in at least one subject."
    fi
else
    echo "You have failed, please try harder."
fi

echo "Thank you all"
#End
