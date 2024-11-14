import subprocess

def rectify_logs():
    print("Rectifying issues...")
    subprocess.call(["./addlogs.sh"])  # Calls your shell script to add logs
    subprocess.call(["./createlogfile.sh"])  # Calls your shell script to create log files
    subprocess.call(["./logfiles.sh"])  # Calls your shell script for log files operation
    subprocess.call(["./logview.sh"])  # Calls your shell script to view the logs
    subprocess.call(["./parsefile_gnu.sh"])  # Calls your shell script for file parsing

if __name__ == "__main__":
    rectify_logs()

