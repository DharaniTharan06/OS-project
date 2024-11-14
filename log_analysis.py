import subprocess

def analyze_logs():
    print("Analyzing kernel logs for errors...")
    
    # List of log files to analyze
    log_files = ['critical_logs_2.txt', 'error_logs_2.txt']
    
    for log_file_name in log_files:
        print(f"Reading from {log_file_name}...")
        with open(log_file_name, 'r') as log_file:
            logs = log_file.readlines()
        
        # Analyze each line for errors and rectify if needed
        for line in logs:
            
            if "SDDM" in line:
                print("SDDM error detected, rectifying...")
                subprocess.call(["./rectify_alert.sh"])  # Calls your shell script to rectify SDDM error
            elif "NetworkManager" in line:
                print("NetworkManager error detected, rectifying...")
                subprocess.call(["./rectify_alert.sh"])  # Calls your shell script to rectify NetworkManager error
            elif "Plasma" in line:
                print("Plasma error detected, rectifying...")
                subprocess.call(["./rectify_alert.sh"])  # Calls your shell script to rectify Plasma error
            elif "kernel" in line:
                print("Kernel error detected, rectifying...")
                subprocess.call(["./rectify_alert.sh"])  # Calls your shell script to rectify Kernel error

if __name__ == "__main__":
    analyze_logs()

