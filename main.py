import subprocess
import csv
import log_monitoring
import log_rectification
import log_analysis
import send_email

def run_workflow():
    while True:
        # Display the options menu
        print("\nSelect an option:")
        print("1. Log Monitoring")
        print("2. Log Rectification")
        print("3. Log Analysis")
        print("4. Send Email")
        print("5. Read summary.csv")
        print("6. Exit")

        # Get user input for the option
        choice = input("Enter your choice: ")

        if choice == '1':
            print("Starting log monitoring...")
            log_monitoring.monitor_logs()

        elif choice == '2':
            print("Rectifying logs...")
            log_rectification.rectify_logs()

        elif choice == '3':
            print("Analyzing logs...")
            log_analysis.analyze_logs()

        elif choice == '4':
            print("Sending email...")
            send_email.send_email()

        elif choice == '5':
            read_summary_csv()

        elif choice == '6':
            print("Exiting...")
            break  # Exit the loop and end the program

        else:
            print("Invalid choice. Please try again.")

def read_summary_csv():
    try:
        with open('summary.csv', 'r') as csv_file:
            reader = csv.reader(csv_file)
            # Print each row of the CSV file
            print("\nContents of summary.csv:")
            for row in reader:
                print(row)

    except FileNotFoundError:
        print("summary.csv file not found. Please make sure it exists in the current directory.")
    except Exception as e:
        print(f"An error occurred while reading the CSV file: {e}")

if __name__ == "__main__":
    run_workflow()

