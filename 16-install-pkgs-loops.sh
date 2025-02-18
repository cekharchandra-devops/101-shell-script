#!/bin/bash

user_id=$(id -u)

validate_user(){
    if [ $1 -ne 0 ]; then
        log_error "please run the script with root preveledges"
        exit 1;
    fi
}

usage(){
    log_error "Usage: $1     <package1> <package2> <package3> ..."
    exit 1;
}

validate_and_install(){

    dnf list installed $1
    if [ $? -ne 0 ]; then
        log_warning "$1 is isntalling...."
        dnf install $1 -y
        if [ $? -ne 0 ]; then
            log_error "$1 package not installed. please provid valid package names..."
        else
            log_info "*****$1 package is installed successfully******"
        fi
    else
        log_warning "$1 already isntalled...."
    fi
}

G=[32m
Y=[33m
R=[31m
N=[0m

#\033 or \e we can use 


log_info() {
    echo -e "\033$G[INFO] $1\033$N"   # Green for info
}

log_warning() {
    echo -e "\033[33m[WARNING] $1\033[0m" # Yellow for warnings
}

log_error() {
    echo -e "\033[7;31m[ERROR] $1\033[0m"   # Red for errors
}



validate_user $user_id

if [ $# -eq 0 ]; then
    usage $0
    exit 1;
fi


for package in $@
do
    validate_and_install $package
done