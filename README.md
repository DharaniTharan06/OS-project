# 📄 AI-Based Kernel Log Monitoring and Rectification System

An intelligent Operating System project designed to **monitor**, **analyze**, and **automatically rectify** kernel-level log issues using AI-enhanced logic. Built with modular Python scripts, this project ensures proactive system error detection, automated resolution, and real-time admin notifications.

---

## 🚀 Features

* 📜 **Log Monitoring**: Continuously watches system log files (`/var/log/syslog`, `dmesg`, etc.)
* 🤖 **AI-Powered Analysis**: Classifies logs using heuristics or ML models to detect anomalies and errors.
* 🛠️ **Automated Rectification**: Executes predefined shell commands or scripts to resolve identified issues.
* 📧 **Admin Alerts**: Sends real-time email notifications on critical errors and applied fixes.
* 📈 **Modular Structure**: Multiple Python and Shell scripts handle different aspects of the system for scalability and clarity.

---

## 🛠️ Technologies Used

* **Python 3.x**
* **Shell Scripting**
* **Log File Parsing**
* **Basic AI/ML (optional integration)**
* **SMTP (for sending emails)**
* **Crontab / Systemd** for automation
* **Git** for version control

---

## 📁 Folder Structure

```
log-monitoring-ai/
├── analyze_logs.py        # Applies AI/heuristics to detect anomalies
├── config.py              # Stores thresholds, credentials, and rule mappings
├── log_monitor.py         # Monitors logs continuously
├── logview.sh             # Displays recent log info for quick reference
├── main.py                # Main entry script to orchestrate monitoring
├── parsefile_gnu.sh       # Parses logs in GNU/Linux format
├── rectify_alert.sh       # Executes alert-specific rectification
├── rectify_errors.py      # Executes fixes based on error types
├── send_email.sh          # Shell version for sending emails
├── send_mail.py           # Sends email notifications
├── sendmail.sh            # Alternative mail sender (legacy/support)
├── summary.csv            # Stores summary of alerts and rectifications
└── README.md
```

---

## ⚙️ Installation & Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/log-monitoring-ai.git
   cd log-monitoring-ai
   ```

2. **Install Dependencies**

   ```bash
   pip install -r requirements.txt
   ```

3. **Configure `config.py`**

   * Set paths for logs
   * Define thresholds
   * Enter SMTP credentials for email alerts

4. **Make Scripts Executable**

   ```bash
   chmod +x *.py *.sh
   ```

5. **Run Manually or Schedule with Cron**

   * Manual:

     ```bash
     python3 log_monitor.py
     ```
   * Cron (every 5 mins example):

     ```bash
     */5 * * * * /usr/bin/python3 /path/to/log_monitor.py
     ```

---

## 🔒 Example Use Cases

* Detecting hardware errors via `dmesg`
* Monitoring failed SSH login attempts
* Auto-restarting services after crashes
* Notifying sysadmin about disk I/O issues

---

## 📬 Sample Email Alert

> Subject: 🚨 Kernel Alert: Disk Write Error Detected  
> Body:
>
> ```
> An error was detected at [timestamp]
> Type: Disk I/O Error
> Action Taken: Restarted related services
> Log Snippet: [Relevant excerpt]
> ```

---

## 💡 Future Enhancements

* Integrate with advanced NLP models (e.g., GPT) for deeper log interpretation
* Provide a dashboard UI for live monitoring
* Support remote monitoring of multiple systems
* Containerize with Docker for easy deployment

---

## 👨‍💼 Authors & Credits

Developed as part of an academic Operating Systems project to explore the integration of automation and AI in log monitoring and system maintenance.
