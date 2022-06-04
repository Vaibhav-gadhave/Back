#!/bin/bash
#Purpose : 
#Created date :  2020-11-01 05:26:54 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

read -p "Enter the source of file/folder you copy to move : " a
read -p "Enter the destination : " b

function Backup ()
{

		echo "Taking backup from $a to $b"
		rsync -av $a $b 
	
}

Backup 

#End
