#!/bin/bash
#Purpose : 
#Created date :  date +%Y-%m-%d  %r
#Modified date : 
#Author: Vaibhav Gadhave
#Start
x=$(ls)
time=$(date +"%Y-%m-%d")
echo -e "\nmy list is $x\n"
ls > $time.txt

#date +"%Y-%m-%d  %r"

#End
