import subprocess

def rectify_logs():
    print("Viewing logs...")
    subprocess.call(["./logfiles.sh"])  # Calls your shell script to view the logs
    subprocess.call(["./rectify_alert.sh"])
if __name__ == "__main__":
    rectify_logs()

