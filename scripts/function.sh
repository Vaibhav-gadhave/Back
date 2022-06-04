#!/bin/bash
#Purpose : 
#Created date :  2020-11-01 05:26:54 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

function Backup ()
{
	if [ -f $1 ]
	then
		backup="/run/media/vaibhavg/Backup/PC/$(basename ${1}).$(date +%F).$$"
		echo "Taking backup from $1 to $backup"
		cp $1 $backup
	fi
}

Backup /etc/fstab

#End
