#!/bin/bash
#Purpose : 
#Created date :  2020-10-28 05:05:07 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

echo -e "Please enter four numbers as A,B,C,D in space : "
read -r a
read -r b
read -r c
read -r d

if test $a -gt $b -a $a -gt $c -a $a -gt $d ; then
	echo -e "$a A is big "
elif test $b -gt $c -a $b -gt $d ; then
	echo -e "$b B is big "
elif test $c -gt $d ; then
	echo -e "$c C is big" 
else	
	echo -e "$d D is big"
fi

#End
