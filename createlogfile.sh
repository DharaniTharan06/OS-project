#!/bin/bash

# Set the log file path
LOG_FILE="logfile.log"

# Function to log messages
log_message() {
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] $1" >> "$LOG_FILE"
}

# Check if the script is run with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

# Create the log file if it doesn't exist
touch "$LOG_FILE"

# Set appropriate permissions for the log file
chmod 644 "$LOG_FILE"

# Example usage
log_message "Script started"
log_message "This is a sample log entry"
log_message "Script completed"

echo "Logs have been written to $LOG_FILE"