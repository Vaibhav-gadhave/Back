#!/bin/bash
#Created date :  2024-08-15 09:17:10 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

systemno=$RANDOM

read -p "give me trials :" num2
for each in $(seq 1 $num2)
do
read -p "This is your chance no $each, Guess my no " userno
if [ $systemno -eq $userno ] 
then
	echo -e "You are correct"
else 
	echo -e "You are wrong"
fi
done

echo -e "Right number was $systemno"
echo "Thanks"

#End
