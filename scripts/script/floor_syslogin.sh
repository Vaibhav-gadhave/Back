#!/bin/bash

PASS1="F!0orStrike@2021#"

read -p "Enter IP Address : " hip

sshpass -p "$PASS1" ssh -o StrictHostKeyChecking=no root@$hip
