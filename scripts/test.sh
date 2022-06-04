#!/bin/sh

To="vvgadhave@gmail.com"
ram_free=$(free -mt | grep Total: | awk '{print $4}')

if [ $ram_free -le 1000 ]
then
	echo "sending mail"
	echo "Subject:warning " | sendmail $TO
fi	
