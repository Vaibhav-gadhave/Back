#!/bin/bash
#Purpose : 
#Created date :  03:44:24 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start
echo "hi vaibhav"
free -h
sync; echo 3 > /proc/sys/vm/drop_caches
free -h
rm -rf /tmp/*
rm -rf /var/tmp/*
echo "temp file also cleared"
echo "Thanks"
#End
