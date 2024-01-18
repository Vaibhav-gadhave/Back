#!/bin/bash
#Created date :  2024-01-10 05:25:18 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo -e "Please enter number in sequence"
echo -e "Please enter first and last number"
read -r no1 no2
echo -e "Please enter which number you need to remove from list"
read -r no3

for vaibhav in $(seq $no1 $no2)
do
	if [ $vaibhav -eq $no3 ]
	then
		continue
	fi
	echo -e "$vaibhav"
		
done	

echo -e "we have removed $no3 from sequence"
#End
