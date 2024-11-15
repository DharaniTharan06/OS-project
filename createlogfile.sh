#!/bin/bash

# Set the log file path
LOG_FILE="logfile.log"
SUMMARY_FILE="summary.csv"

# Function to log messages
log_message() {
    local message_type="$1"  # First argument as the message type (Error, Warning, Info)
    local message="$2"       # Second argument as the actual log message
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Write to the log file with timesta
    echo "[$timestamp] $message_type: $message" >> "$LOG_FILE"

    # Also append to the summary file for Gnuplot analysis
    echo "$timestamp, $message_type" >> "$SUMMARY_FILE"
}

# Check if the script is run with root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

# Create the log and summary files if they don't exist
touch "$LOG_FILE"
touch "$SUMMARY_FILE"

# Set appropriate permissions for the log file
chmod 644 "$LOG_FILE"

# Set header for the summary CSV if it's empty
if [[ ! -s $SUMMARY_FILE ]]; then
    echo "timestamp, message_type" > "$SUMMARY_FILE"
fi

log_message "Info" "Script started"
log_message "Info" "This is a sample log entry"
log_message "Error" "An error occurred while executing the script"
log_message "Warning" "This is a sample warning"
log_message "Info" "Script completed"

echo "Logs have been written to $LOG_FILE and summary to $SUMMARY_FILE"
