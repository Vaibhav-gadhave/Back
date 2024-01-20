#!/bin/bash
#Created date :  2024-01-10 05:52:32 AM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 
#!/bin/bash

echo "Enter the text you want to print:"
read user_text

echo "Enter the number of times to repeat the text:"
read num_repeats

for number in $(seq 1 $num_repeats) 
do
    echo "[$number] $user_text"
done


#End
