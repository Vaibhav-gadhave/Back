#!/bin/bash
#Created date :  2024-01-05 12:23:24 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo "########### single quotes #############"
echo -e '$(ls)'

echo "########### double quotes #############"
echo -e "$(ls)"

echo "########### no quotes #############"
echo -e $(ls)

echo "########### Next line #############"
echo -e "i am Devops Engineer\nI study Everyday"

echo "########### tab #############"
echo -e "i am Devops Engineer\tI study Everyday"

echo "########### vertical tab #############"
echo -e "i am Devops Engineer\vI study Everyday"

echo "########### backslash #############"
echo -e "i am Devops Engineer\bI study Everyday"

echo "########### alert sound #############"
echo -e "i am Devops Engineer I study Everyday \a"

echo "########### color #############"
echo -e "\033[104mi am Devops Engineer I study Everyday\033[0m"

echo "########### don not output tailing new line #############"
echo -n "i am Devops Engineer I study Everyday"

echo "For more info please do {man echo} "

#End
