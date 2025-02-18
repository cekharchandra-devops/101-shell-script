
#!/bin/bash

<<comment

by default , shell redirects success outputs to file
ls -l > output.txt --> writes the logs info to file
lsss -l > output.txt--> dispaly error message on cli itself

1 for success
2 for error

ls -l 1>output.txt --> It redirects logs to output.txt only if the command executes successfully( it doesnt redirect failed/error )
ls -l 2>output.txt --> It redirects logs to output.txt only if the command fails to execute.(it doesnt redirect success message)
ls -l &>output.txt --> It redirects logs to output.txt regardless of success or failure

the above commands replace existing logs if file already have logs.

ls -l &>>output.txt --> It redirects/appends logs to output.txt regardless of success or failure

log_file : /var/log/shell-script/script-name-<timestamp>.log

comment

LOGS_DIR="/var/log/shell-script"
LOG_FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
LOG_FILE=${LOGS_DIR}/${LOG_FILE_NAME}-${TIMESTAMP}.log

mkdir -p "$LOGS_DIR"

user_id=$(id -u)

validate_user(){
    if [ $1 -ne 0 ]; then
        log_error "please run the script with root preveledges"
        exit 1; 
    fi
}

validate_and_install(){

    dnf list installed $1 &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        log_warning "$1 is isntalling...."
        dnf install $1 -y &>>$LOG_FILE
        if [ $? -ne 0 ]; then
            log_error "$1 package not installed. please provid valid package names..."
            exit 1;
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

# log_info() {
#     echo -e "\033$G $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033$N"  &>>"$LOG_FILE" # Green for info
# }

# log_warning() {
#     echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m" &>>"$LOG_FILE" # Yellow for warnings
# }

# log_error() {
#     echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m" &>>"$LOG_FILE"  # Red for errors
# }



log_info() {
    echo -e "\033$G $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033$N"  | tee -a "$LOG_FILE" # Green for info
}

log_warning() {
    echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m" | tee -a "$LOG_FILE" # Yellow for warnings
}

log_error() {
    echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m" | tee -a "$LOG_FILE"  # Red for errors
}

validate_user $user_id

if [ $# -eq 0 ]; then
    echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR]provide packages as args to the script to install\033[0m"
    exit 1;
fi

for package in $@
do
    validate_and_install $package
done
