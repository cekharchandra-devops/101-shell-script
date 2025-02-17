#!/bin/bash

logDir="/var/log/hostname"

export logDir # Exporting the variable to make it available in the called script

chmod +x 09-calling.sh

./09-calling.sh