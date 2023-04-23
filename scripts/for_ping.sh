#!/bin/bash
#Purpose : 
#Created date :  2020-10-28 06:11:22 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

for i in `cat hostfile`
do
	ping -c 2 $i >> /tmp/pingresults
	valid=`echo $?`
	if [ $valid -gt 1 ]
	then
		echo -e "\033[105m$i host is not rechable \033[0m"
	else
		echo -e  "\033[104m$i host is up \033[0m" 
	fi
done

#End
