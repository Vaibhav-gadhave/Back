#!/bin/bash
#Created date :  2024-08-13 04:04:08 PM
#Modified date : 
#Author: Vaibhav Gadhave
#Start 

# Special Variables
# $# = No. of parameters given to script
# $@ = List of parameters given to script
# $0 = Name of current program (script)
# $1, $2.. = Parameter 1, 2 .. 9
# $? = Exit value of last command run
# $* = show all parameters in single line
# $! = show pid of background process
#
# please enter 2 numbers with space after running script

echo -e "Name of current script is $0"

echo -e "Parameters are $1 and $2"

echo -e "Number of parameter given to script is $#"

echo -e "List of given paramaters are $@"

echo -e "Exit value of last command is $?"

echo "'$*' output is $*"

echo "Thanks"
#End
