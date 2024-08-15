#!/bin/bash
#Created date :  2024-08-15 09:10:12 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

for baba in 1 3 5 6 8 9 23 4 56 7 89 99
do
	if [ $baba -eq 23 ]
	then
		continue
	fi
	echo -e "$baba"
done

#End
