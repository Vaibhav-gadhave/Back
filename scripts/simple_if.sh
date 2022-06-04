#!/bin/bash
#Purpose : 
#Created date :  05:18:09 PM IST
#Modified date : To check A is equals to B or not
#Author: Vaibhav Gadhave
#Start
read -p "Enter the value of A " a
read -p "Enter the value of b " b

if [ $a == $b ]
then
   echo "a is equal to b"
fi

if [ $a != $b ]
then
   echo "a is not equal to b"
fi
#End
