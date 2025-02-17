#!/bin/bash

read -p "Enter your name: " NAME
# -p flag is used to prompt the user for input
read -s -p "Enter your password: " PASSWORD
# -s flag is used to hide the input
# if -p flag is not used, the prompt will be displayed on the next line

echo "Name: $NAME"
echo "Password: $PASSWORD"