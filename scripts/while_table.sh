#!/bin/bash
#Purpose : 
#Created date :  2020-10-28 05:52:24 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

echo -e "Please enter any number you want : \c"
read -r a
c=1

while [ $c -le 10 ]
do
b=`expr $a \* $c`
echo -e "$a * $c = $b"
c=`expr $c + 1`
done

#End
