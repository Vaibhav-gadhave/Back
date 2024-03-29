#!/bin/bash
#Created date :  2024-01-05 01:17:27 PM
#Modified date : 
#Author: Vaibhav Gadhave

# Special Variables
# $# = No. of parameters given to script
# $@ = List of parameters given to script
# $0 = Name of current program (script)
# $1, $2.. = Parameter 1, 2 and so on..
# $? = Exit value of last command run

# please enter 2 numbers with space after running script

echo -e "Name of current script is $0"

echo -e "Parameters are $1 and $2"

echo -e "Number of parameter given to script is $#"

echo -e "List of given paramaters are $@"

echo -e "Exit value of last command is $?"

echo -e "Stores the PID of the most recently executed background process :- $!"

echo "'$*' output is $*"

#End
