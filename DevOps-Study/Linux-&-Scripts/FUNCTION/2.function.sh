#!/bin/bash
#Created date :  2024-08-15 10:43:22 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo "This script is to take the backup of your file in current directory "
read -p "Enter the source path" source

set `pwd`
destination=$1

echo "Your Source is $source and destination is $destination"
backup () {
	cp -rv $source $destination
}

backup

echo "We have completed the backup"


#End
