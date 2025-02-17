#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "all arguments: $@"
echo "list of arguments: $*" # all arguments in one string
echo "number of arguments: $#" # number of arguments
echo "exit status of last command: $?" # exit status of last command
echo "process id of current shell: $$" # process id of current shell
sleep 100 & # background command
echo "process id of last background command: $!" # process id of last background command
