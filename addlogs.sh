#!/bin/bash
# Real-time kernel log viewer with error and critical log separation
# Press 'q' to quit

ERROR_FILE="error_logs_2.txt"
CRITICAL_FILE="critical_logs_2.txt"

# Check if the error and critical log files already exist and remove them
[ -f "$ERROR_FILE" ] && rm "$ERROR_FILE"
[ -f "$CRITICAL_FILE" ] && rm "$CRITICAL_FILE"

# Extract error and critical logs
journalctl | grep  "error" > "$ERROR_FILE"
journalctl | grep  "critical" > "$CRITICAL_FILE"

echo "Error logs have been saved to $ERROR_FILE"
echo "Critical logs have been saved to $CRITICAL_FILE"