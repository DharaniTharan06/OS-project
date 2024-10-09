#!/bin/bash
# Unified kernel log management script

echo "Kernel Log Manager"
echo "Select an option:"
echo "1. View logs"
echo "2. Detect errors"
echo "3. Detect critical logs"
read -p "Enter choice [1-3]: " choice

case $choice in
  1)

echo "Viewing kernel logs in real-time... Press 'q' to quit."

# Trap SIGINT (Ctrl + C) and other termination signals for graceful exit
trap "echo 'Exiting...'; stty echo; exit" SIGINT SIGTERM

# Disable input buffering to capture keypress instantly
stty -echo -icanon time 0 min 0

# Start dmesg in a subshell
sudo dmesg -wH &

# Monitor for keypress 'q' to exit
while true; do
    key=$(dd bs=1 count=1 2>/dev/null)
    if [[ "$key" == "q" ]]; then
        echo "Exiting..."
        kill %1  # Kill the background `dmesg` process
        stty echo  # Restore terminal settings
        exit 0
    fi
done

    ;;
  2)
    echo "Detecting errors..."
    sudo dmesg | grep -iE "error|fail|critical|panic|segfault"
    ;;
  3)
    echo "Detecting critical logs..."
    sudo dmesg | grep -iE "critical|emergency|panic|alert"
    ;;
  *)
    echo "Invalid option"
    ;;
esac
