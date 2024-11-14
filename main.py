import subprocess
import log_monitoring  # Replace with the actual filename if necessary
import log_rectification
import log_analysis
import send_email

def run_workflow():
    print("Starting log monitoring...")
    log_monitoring.monitor_logs()  
    
    #print("Rectifying errors...")
    #log_rectification.rectify_logs()  
    
    print("Analyzing logs...")
    log_analysis.analyze_logs()  
    print("Sending email...")
    send_email.send_email() 
    print("Process completed successfully.")

if __name__ == "__main__":
    run_workflow()

