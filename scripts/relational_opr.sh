#!/bin/bash
#Purpose : 
#Created date :  2020-10-27 05:55:36 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

echo -e "Enter first no : \c"
read -r a
echo -e "Enter secound no : \c"
read -r b

test $a -gt $b ; echo -e "If no1 is Greater than no2 : $?" ;
test $a -lt $b ; echo -e "If no1 is Less than no2 : $?" ;
test $a -ge $b ; echo -e "If no1 is Greater than equal to no2 : $?" ;
test $a -le $b ; echo -e "If no1 is Less than equal to no2 : $?" ;
test $a -eq $b ; echo -e "If no1 is equals to no2 : $?" ;
test $a -ne $b ; echo -e "If no1 is not equal to no2 : $?" ;

#End
