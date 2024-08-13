#!/bin/bash
#Created date :  2024-08-13 02:45:03 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "The two numbers are \n $1 $2"
result=`expr "$1 + $2" | bc`

echo -e "The result is $result"
echo "Thanks"

#End
