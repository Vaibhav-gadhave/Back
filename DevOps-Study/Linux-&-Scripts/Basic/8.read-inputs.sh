#!/bin/bash
#Created date :  2024-08-13 03:17:12 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

read -p "Please enter your name " name
read -sp "Please enter password, Dont worry password will be not be seen " pass 
echo -e "$pass" > /tmp/pass.txt

echo -e "My name is $name, and i am great leader"
echo "Password stored at /tmp/pass.txt"
echo "Thanks"

#End
