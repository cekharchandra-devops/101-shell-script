#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
NO_OF_DAYS=${3:-14}
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
#check source and destination provided


log_info() {
    echo -e "\033$G $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033$N"  # Green for info
}

log_warning() {
    echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m"  # Yellow for warnings
}

log_error() {
    echo -e "\033[7;31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m"  # Red for errors
}

# check source and destination provided
# if not provided, exit the script
# if provided, check the source and destination are valid or not
# find the files older than 14 days
# if files are not empty, zip the files and move to destination

if [ $# -lt 2 ]; then
    log_error "USAGE:: $0 <source> <destination> <days(optional)>"
    exit 1;
fi

if [ ! -d $SOURCE_DIR ]; then
    log_error "$SOURCE_DIR doesnt exit... provide valid source path"
    exit 1;
fi

if [ ! -d $DEST_DIR ]; then
    log_error "$DEST_DIR doesnt exit... provide valid destination path"
    exit 1;
fi

Files=$(find ${SOURCE_DIR} -name "*.log" -mtime +$NO_OF_DAYS)
if [ ! -z "$Files" ]; then
    log_info "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    if [ -f $ZIP_FILE ]; then
        log_info "successfullhy zipped files older than $NO_OF_DAYS"
        #remove the files after zipping
        while IFS= read -r log_file
        do
            log_info "deleting files: $log_file"
            rm -rf $log_file
        done <<< $Files
    else
        log_error "Zipping the files failed"
        exit 1
    fi
else
    log_error "NO Files found"
    exit 1
fi

# ./19-backup-logs.sh /var/log /tmp 14
# we can copy the script to /usr/local/bin and run the script from anywhere
# cp 19-backup-logs.sh /usr/local/bin/backup-logs
# chmod +x /usr/local/bin/backup-logs
# backup-logs /var/log /tmp 14