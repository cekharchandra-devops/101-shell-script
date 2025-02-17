#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You are not the root user"
    exit 1
fi

dnf list installed mysql #> /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "mysql is already isntalled and nothing to do"
else
	dnf install mysql -y
	if [ $? -ne 0 ]; then
	   echo "mysql is not installed. please check"
	else
	   echo " mysql is successfully installed."
	fi
fi

dnf list installed git #> /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo "git is already isntalled and nothing to do"
else
	dnf install git -y
	if [ $? -ne 0 ]; then
	   echo "git is not installed. please check"
	else
	   echo " git is successfully installed."
	fi
fi