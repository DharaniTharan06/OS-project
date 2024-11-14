import time
import os

# Function to monitor a single log file
def monitor_log_file(log_file_path):
    try:
        with open(log_file_path, "r") as log_file:
            lines = log_file.readlines()
            for line in lines:
                print(f"{log_file_path}: {line.strip()}")  # Print each log line with file path
    except FileNotFoundError:
        print(f"Error: Log file not found at {log_file_path}")

# Main function to monitor all logs
def monitor_logs():
    start_time = time.time()
    timeout = 1  # Run for 1 minute (60 seconds)

    # Define the log file paths (replace with actual paths)
    log_files = [
        "/home/vboxuser/OS-project/critical_logs.log", 
        "/home/vboxuser/OS-project/error_logs.log"
    ]

    while True:
        if time.time() - start_time > timeout:
            print("Monitoring finished.")
            break
        
        for log_file_path in log_files:
            monitor_log_file(log_file_path)  # Monitor each log file
        time.sleep(1)  # Delay for 1 second before checking again

if __name__ == "__main__":
    monitor_logs()

