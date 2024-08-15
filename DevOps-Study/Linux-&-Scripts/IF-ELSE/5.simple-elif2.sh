#!/bin/bash
#Created date :  2024-08-14 09:47:51 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "Enter your age "
read -r age

if test "$age" -gt 100 ; then
    echo -e "you are a ghost"
elif test "$age" -gt 50 ; then
    echo -e "you are respectful"
    echo -e "Do exercise everyday"
elif test "$age" -gt 25 ; then
    echo -e "you are a gentleman"
    echo -e "Dont eat fast food"
elif test "$age" -gt 10 ; then
    echo -e "you are young"
    echo -e "Work everyday"
else
    echo -e "You are small"
fi

#End
