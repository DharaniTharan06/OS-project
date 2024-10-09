#!/bin/bash
# Monitor kernel logs for critical messages and send an email when detected

CRITICAL_FILE="critical_logs.txt"
EMAIL_ADDRESS="your-email@example.com"  # Replace with your email

# Subject for the email alert
EMAIL_SUBJECT="Critical Kernel Log Alert!"

echo "Monitoring kernel logs for critical errors..."
echo "Critical logs will be saved to $CRITICAL_FILE"

# Trap SIGINT (Ctrl + C) for graceful exit
trap "echo 'Exiting...'; exit" SIGINT SIGTERM

# Clear previous logs
> "$CRITICAL_FILE"

# Start sudo dmesg in the background and filter for critical logs
sudo dmesg -wH | grep -i "critical" | tee -a "$CRITICAL_FILE" | while read -r line; do
    # Send an email notification for each critical log entry
    echo "Critical log detected: $line" | mail -s "$EMAIL_SUBJECT" "$EMAIL_ADDRESS"
done
