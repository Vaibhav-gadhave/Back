#!/bin/bash
#Purpose : 
#Created date :  03:40:46 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start
echo '################### with double quotes ########################'
echo "$(ls)"

echo '################### with single #######################'
echo '$(ls)'

echo '################### no quotes ##########################'
echo $(ls)

echo '################### \n ######################'
echo -e "My name is vaibhav\nI am from Pune"

echo '################### \b ######################'
echo -e "My name is vaibhav\bI am from Pune"

echo '################### \t ######################'
echo -e "My name is vaibhav\tI am from Pune"

echo '################### \v ######################'
echo -e "My name is vaibhav\vI am from Pune"

echo '################### \a ######################'
echo -e "My name is vaibhav\aI am from Pune"

echo '################### color ######################'
echo -e "\033[104mMy name is vaibhav I am from Pune\033[0m"

echo '################### \\ ######################'
echo -e "My name is vaibhav\\\nI am from Pune"

echo '################### -n ######################'
echo -n "My name is vaibhav I am from Pune"

echo '################### -ne ######################'
echo -en "My name is vaibhav \nI am from Pune"
#End
