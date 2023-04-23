#!/bin/bash
#Purpose : 
#Created date :  2021-01-02 03:23:44 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

vim --version 1>/dev/null 2>&1
if [[ $? -eq 0 ]]
then 
	echo "Already vim installed"
else 
	sudo yum install vim -y
fi
wget --version 1>/dev/null 2>&1
if [[ $? -eq 0 ]]
then 
	echo "Already wget installed"
else
	sudo yum install wget -y
fi

#End
