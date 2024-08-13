#!/bin/bash
#Created date :  2024-01-05 12:23:24 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

echo "-------------------------------------------------------------------"
echo "########### single quotes #############"
echo -e '$(ls)'

echo "-------------------------------------------------------------------"
echo "########### double quotes #############"
echo -e "$(ls)"

echo "-------------------------------------------------------------------"
echo "########### no quotes #############"
echo -e $(ls)

echo "-------------------------------------------------------------------"
echo "########### Next line #############"
echo -e "i am Devops Engineer\nI study Everyday"

echo "-------------------------------------------------------------------"
echo "########### tab #############"
echo -e "i am Devops Engineer\tI study Everyday"

echo "-------------------------------------------------------------------"
echo "########### vertical tab #############"
echo -e "i am Devops Engineer\vI study Everyday"

echo "-------------------------------------------------------------------"
echo "########### backslash #############"
echo -e "i am Devops Engineer\bI study Everyday"

echo "-------------------------------------------------------------------"
echo "########### alert sound #############"
echo -e "i am Devops Engineer I study Everyday \a"

echo "-------------------------------------------------------------------"
echo "########### color #############"
echo -e "\033[104mi am Devops Engineer I study Everyday\033[0m"

echo "-------------------------------------------------------------------"
echo "########### Quotes  #############"
echo -e "i am Devops Engineer I study Everyday, my favourite number is \$3"

echo "-------------------------------------------------------------------"
echo "   For more info please do {man echo}   "

echo "-------------------------------------------------------------------"
echo "########### don not output tailing new line #############"
echo -n "i am Devops Engineer I study Everyday"
#End
