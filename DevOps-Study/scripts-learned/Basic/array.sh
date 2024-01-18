#!/bin/bash
#Created date :  2024-01-05 04:47:11 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

Friends=(vaibhav rishab suraj sangam nikhil rajesh)


echo "Best Friend : ${Friends[2]}"
echo "Best helping nature : ${Friends[5]}"
echo "First Method: ${Friends[*]}"
echo "Second Method: ${Friends[@]}"
echo "Third Method: ${#Friends[@]}"

#End
