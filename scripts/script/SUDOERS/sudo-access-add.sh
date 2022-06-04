#!/bin/bash

if ! [ $(id -u) -eq 0 ]
then
    echo "You do not have permission to execute this script from none root user"
else
	cat /etc/sudoers | grep -w '%admins' &> /dev/null || echo -e "%admins\tALL=(ALL)\tALL" >> /etc/sudoers
	cat /etc/sudoers | grep -w 'anibrain' &> /dev/null || echo -e "anibrain\tALL=(ALL)\tALL" >> /etc/sudoers
	echo "The sudoers entry for local user anibrain and domain groups admins has been added successfully."
fi
