#!/bin/bash
#Created date :  2024-01-05 01:09:55 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
# Please enter two number with space after running script

echo -e "The two number entered are: $1 and $2 "

result=`expr "$1 + $2" | bc`
echo "Addition of $1 and $2 is $result"

#End 
