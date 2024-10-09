#!/bin/bash

# Create a summary file for Gnuplot
echo "timestamp, error_type" > summary.csv

# Parse the log file
while IFS= read -r line; do
    # Extract timestamp and error type
    timestamp=$(echo "$line" | awk '{print $1 " " $2}')
    if echo "$line" | grep -q "Error"; then
        error_type="Error"
    elif echo "$line" | grep -q "Warning"; then
        error_type="Warning"
    elif echo "$line" | grep -q "Info"; then
        error_type="Info"
    else
        error_type="Unknown"
    fi

    # Append to summary
    echo "$timestamp, $error_type" >> summary.csv
done < logfile.log

echo "Summary created in summary.csv"
