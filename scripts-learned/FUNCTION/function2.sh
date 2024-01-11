#!/bin/bash
#Created date :  2024-01-11 10:49:08 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "This script is used to take backup from source to current directory"
set `pwd`
destination=$1

echo -e "Please enter your Source"
read -r source

echo -e "We are transfering the backup" 
Backup () {
	cp -rv $source $destination	
}

echo -e "This was your Source \n $source"
echo -e "This was your Destination \n $destination" 

Backup 

#End
