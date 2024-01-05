#!/bin/bash
#Purpose : 
#Created date :  2021-01-02 03:19:22 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

cnt=1
for each_server in $(cat listofservers.txt)
do
	each "$cnt. working on ${each_server}"
	scp install.sh root@{each_server}:/tmp
	ssh root@{each_server} "sh /tmp/install.sh"
done

#End
