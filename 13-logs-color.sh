#!/bin/bash


# # \033 or \e: Escape character.


# Basic Styles:
# Style Code	Description
# 0	Reset/Normal
# 1	Bold/Bright
# 4	Underline
# 7	Invert colors
# Foreground Color Codes:
# Color	Code
# Black	30
# Red	31
# Green	32
# Yellow	33
# Blue	34
# Magenta	35
# Cyan	36
# White	37

log_info() {
    echo -e "\033[32m[INFO] $1\033[0m"   # Green for info
}

log_warning() {
    echo -e "\033[33m[WARNING] $1\033[0m" # Yellow for warnings
}

log_error() {
    echo -e "\033[1;4;31m[ERROR] $1\033[0m"   # Red for errors
}

log_info "System is running smoothly."
log_warning "Disk space is getting low."
log_error "System failure!"