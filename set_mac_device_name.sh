#!/bin/bash
#
# Set Mac Computer Name and Host Name
#
# Description:
#   This script automatically sets the Mac's "Computer Name" and "Local Host Name"
#   based on the currently logged-in user's full name and the Mac model type.
#
# Format:
#   Computer Name: "<User Full Name>'s <Model Suffix>"
#   Host Name:     "<user-full-name>-<Model Suffix>"
#
# Example:
#   If the logged-in user is "Jane Doe" on a MacBook Pro:
#     Computer Name -> "Jane Doe's MBP"
#     Host Name     -> "Jane-Doe-MBP"
#
set -e

# Get the logged-in user
logged_in_user=$(ls -l /dev/console | awk '{ print $3 }')
# Alternative method:
# logged_in_user=$(stat -f%Su /dev/console)

# Get the user's full name and make it host-safe (replace spaces with dashes)
user_full_name=$(dscl . -read /Users/$logged_in_user RealName | cut -d: -f2 | sed -e 's/^[ \t]*//' | grep -v "^$")
user_full_name_host=(${user_full_name// /-})

# Get system information
system_info=$(system_profiler SPHardwareDataType)

# Extract the model name
model_name=$(echo "$system_info" | grep -i "Model Name" | awk '{print $3,$4}')

# Define suffix based on Mac model
if [[ "$model_name" == "MacBook Air" ]]; then
    host_suffix='MBA'
elif [[ "$model_name" == "MacBook Pro" ]]; then
    host_suffix='MBP'
elif [[ "$model_name" == "Mac mini" ]]; then
    host_suffix='Macmini'
elif [[ "$model_name" == "iMac" ]]; then
    host_suffix='iMac'
else
    exit 0
fi

# Format names
computer_name="$user_full_name's $host_suffix"
host_name="${user_full_name_host}-${host_suffix}"

# Apply changes using scutil
/usr/sbin/scutil --set ComputerName "$computer_name"
/usr/sbin/scutil --set LocalHostName "$host_name"

exit 0
