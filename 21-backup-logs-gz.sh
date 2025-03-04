#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
NO_OF_DAYS=${3:-14}
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")

log_info() {
    echo -e "\033[32m $(date +'%Y-%m-%d %H:%M:%S') [INFO] $1\033[0m"  # Green for info
}

log_warning() {
    echo -e "\033[33m $(date +'%Y-%m-%d %H:%M:%S') [WARNING] $1\033[0m"  # Yellow for warnings
}

log_error() {
    echo -e "\033[31m $(date +'%Y-%m-%d %H:%M:%S') [ERROR] $1\033[0m"  # Red for errors
}

if [ $# -lt 2 ]; then
    log_error "USAGE:: $0 <source> <destination> <days(optional)>"
    exit 1;
fi

if [ ! -d $SOURCE_DIR ]; then
    log_error "$SOURCE_DIR doesn't exist... provide a valid source path"
    exit 1;
fi

if [ ! -d $DEST_DIR ]; then
    log_error "$DEST_DIR doesn't exist... provide a valid destination path"
    exit 1;
fi

Files=$(find ${SOURCE_DIR} -name "*.log" -mtime +$NO_OF_DAYS)
if [ ! -z "$Files" ]; then
    log_info "Files are found"
    TAR_FILE=$DEST_DIR/app-logs-$TIMESTAMP.tar.gz
    tar -czf $TAR_FILE -C $SOURCE_DIR $(find . -name "*.log" -mtime +$NO_OF_DAYS -exec basename {} \;)

    if [ -f $TAR_FILE ]; then
        log_info "Successfully compressed files older than $NO_OF_DAYS days into $TAR_FILE"
        # Remove the files after compressing
        while IFS= read -r log_file
        do
            log_info "Deleting file: $log_file"
            rm -rf "$log_file"
        done <<< "$Files"
    else
        log_error "Compressing the files failed"
        exit 1
    fi
else
    log_error "No files found"
    exit 1
fi

# ./19-backup-logs.sh /var/log /tmp 14
# We can copy the script to /usr/local/bin and run the script from anywhere
# cp 19-backup-logs.sh /usr/local/bin/backup-logs
# chmod +x /usr/local/bin/backup-logs
# backup-logs /var/log /tmp 14