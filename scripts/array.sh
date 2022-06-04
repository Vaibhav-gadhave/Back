#!/bin/bash
#Purpose : 
#Created date :  2020-10-30 07:19:59 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start
<< mycomment 

NAME[0]="vaibhav"
NAME[1]="suraj"
NAME[2]="rishab"
NAME[3]="sangam"
NAME[4]="nikhil"
NAME[5]="rajesh"

mycomment

Friends=(vaibhav rishab suraj sangam nikhil rajesh)


echo "Best Friend : ${Friends[2]}"
echo "Best helping nature : ${Friends[5]}"
echo "First Method: ${Friends[*]}"
echo "Second Method: ${Friends[@]}"
echo "Third Method: ${#Friends[@]}"

#End
