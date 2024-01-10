#!/bin/bash
#Created date :  2024-01-10 06:36:29 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

systemno=$RANDOM
num1=1
read -p "give me trials :" num2
for each in $(seq $num1 $num2)
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

#End
