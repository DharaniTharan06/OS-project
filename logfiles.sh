#!/bin/bash
# Real-time kernel log viewer with error and critical log separation
# Press 'q' to quit

ERROR_FILE="error_logs.log"
CRITICAL_FILE="critical_logs.log"

echo "Viewing kernel logs in real-time... Press 'q' to quit."
echo "Errors will be saved to $ERROR_FILE"
echo "Critical logs will be saved to $CRITICAL_FILE"
    
# Trap SIGINT (Ctrl + C) for graceful exit
trap "echo 'Exiting...'; exit" SIGINT SIGTERM

# Clear previous logs
> "$ERROR_FILE"
> "$CRITICAL_FILE"

# Start sudo dmesg in the background
sudo dmesg -wH &

# Capture sudo dmesg's process ID
DMESG_PID=$!

# Separate logs into error and critical files in the background
sudo dmesg  | grep -i "error" | tee -a "$ERROR_FILE" &
sudo dmesg  | grep -i "critical" | tee -a "$CRITICAL_FILE" &

# Infinite loop to check for keypress
while true; do
    # Use timeout to check if 'q' was pressed without blocking the log output
    if read -t 1 -n 1 key; then
        if [[ "$key" == "q" ]]; then
            echo "Exiting..."
            kill $DMESG_PID  # Kill the background `sudo dmesg` process
            pkill -P $$  # Kill all child processes started by this script (greps and tee commands)
            exit 0
        fi
    fi
done
