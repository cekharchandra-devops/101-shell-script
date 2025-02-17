#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"
B="\e[34m"



validate_root_user() {
    if [ $1 -ne 0 ]; then
        echo -e "$R Run the script with root previledges $N"
        exit 1
    fi
}

validateAndInstall() {
    dnf list installed $1 #> /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo -e "$1 is already isntalled and nothing to do"
    else
        dnf install $1 -y
        if [ $? -ne 0 ]; then
           echo -e "$1 $R is not installed$N. please check"
        else
           echo -e "$1 is $G successfully installed.$N"
        fi
    fi
}

validate_root_user $USERID

validateAndInstall mysql
validateAndInstall git

# dnf list installed mysql #> /dev/null 2>&1

# if [ $? -eq 0 ]; then
# 	echo "mysql is already isntalled and nothing to do"
# else
# 	dnf install mysql -y
# 	if [ $? -ne 0 ]; then
# 	   echo "mysql is not installed. please check"
# 	else
# 	   echo " mysql is successfully installed."
# 	fi
# fi

# dnf list installed git #> /dev/null 2>&1

# if [ $? -eq 0 ]; then
# 	echo "git is already isntalled and nothing to do"
# else
# 	dnf install git -y
# 	if [ $? -ne 0 ]; then
# 	   echo "git is not installed. please check"
# 	else
# 	   echo " git is successfully installed."
# 	fi
# fi