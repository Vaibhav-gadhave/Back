#!/bin/bash
#Purpose : 
#Created date :  2020-10-30 06:50:11 PM IST
#Modified date : 
#Author: Vaibhav Gadhave
#Start

a=0

until [ ! $a -lt 10 ]
do
   echo $a
      a=$(( a+1 ))	
      #   a=`expr $a + 1`       ## also you can use this statement
done


#End
