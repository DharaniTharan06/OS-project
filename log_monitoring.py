import subprocess

def monitor_logs():
    try:
        print("Starting log monitoring using logview.sh...")

        subprocess.call("./logview.sh");

    except subprocess.CalledProcessError as e:
        print("An error occurred while running logview.sh:")
        print(e.stderr)
    except FileNotFoundError:
        print("The logview.sh script was not found in the current directory. Please check the path.")

if __name__ == "__main__":
    monitor_logs()

