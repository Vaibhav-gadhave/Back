#!/bin/bash
#Created date :  2024-08-13 03:31:30 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
echo "Please enter the name of services for checking status"
read service
status="$(systemctl status $service | awk 'NR==3 {print $2}')"

echo -e "The service is $status "
echo "Thanks"
#End
