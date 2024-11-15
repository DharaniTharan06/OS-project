import subprocess

def analyze_logs():
    try:
        print("Starting log analysis...")

        # Running createlogfile.sh script with sudo
        print("Running createlogfile.sh with sudo...")
        result = subprocess.run(
            ["sudo", "bash", "./createlogfile.sh"],  # Run with sudo
            capture_output=True,
            text=True,
            check=True
        )
        
        # Print the output of the createlogfile.sh script
        print("createlogfile.sh output:")
        print(result.stdout)

        # Check if there was any error output from createlogfile.sh
        if result.stderr:
            print("Errors encountered during createlogfile.sh:")
            print(result.stderr)

        # Running parsefile_gnu.sh script with sudo
        print("Running parsefile_gnu.sh with sudo...")
        result = subprocess.run(
            ["sudo", "bash", "./parsefile_gnu.sh"],  # Run with sudo
            capture_output=True,
            text=True,
            check=True
        )
        
        # Print the output of the parsefile_gnu.sh script
        print("parsefile_gnu.sh output:")
        print(result.stdout)

        # Check if there was any error output from parsefile_gnu.sh
        if result.stderr:
            print("Errors encountered during parsefile_gnu.sh:")
            print(result.stderr)

    except subprocess.CalledProcessError as e:
        print(f"An error occurred while running one of the shell scripts:\n{e.stderr}")
        print("Full output from the failed script:")
        print(e.output)  # This will show the full output including error message from the shell script
    except FileNotFoundError:
        print("The shell script was not found in the current directory. Please check the path.")

if __name__ == "__main__":
    analyze_logs()

