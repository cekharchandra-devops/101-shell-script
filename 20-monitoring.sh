#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 #real projects, it is usually 75


while IFS= read -r line 
do
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTITION is more than $DISK_THRESHOLD, current value: $USAGE. Please check" | mail -s "Disk usage alert" admin@localhost
    fi
done <<< $DISK_USAGE

# send an email to the admin with the disk usage details with the partition name and usage percentage

# echo "Disk usage is more than $DISK_THRESHOLD, current value: $USAGE" | mail -s "Disk usage alert" admin@localhost



# IFS=: This sets the Internal Field Separator (IFS) to an empty value. 
# By default, IFS is set to space, tab, and newline. Setting it to an empty value means that the read command
#  will not split the input line into fields based on whitespace. Instead, it will read the entire line as a single string.


# read -r line is used to read the line from the output of the command. -r flag is used to prevent the backslashes from being interpreted as an escape character.

