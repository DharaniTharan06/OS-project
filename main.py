import subprocess
import log_monitoring  # Replace with the actual filename if necessary
import log_rectification
import log_analysis
import send_email

def monitor_logs():
    print("Starting log monitoring...")
    log_monitoring.monitor_logs()

def rectify_logs():
    print("Rectifying errors...")
    log_rectification.rectify_logs()

def analyze_logs():
    print("Analyzing logs...")
    log_analysis.analyze_logs()

def send_email_alert():
    print("Sending email...")
    send_email.send_email()

def run_workflow():
    while True:
        print("\nSelect a workflow option:")
        print("1. Log Monitoring")
        print("2. Log Rectification")
        print("3. Log Analysis")
        print("4. Send Email")
        print("5. Run Complete Workflow")
        print("6. Exit")

        choice = input("Enter choice: ")

        if choice == '1':
            monitor_logs()
        elif choice == '2':
            rectify_logs()
        elif choice == '3':
            analyze_logs()
        elif choice == '4':
            send_email_alert()
        elif choice == '5':
            monitor_logs()
            rectify_logs()
            analyze_logs()
            send_email_alert()
            print("Process completed successfully.")
        elif choice == '6':
            print("Exiting...")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    run_workflow()

