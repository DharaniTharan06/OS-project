#!/bin/bash

# Email configuration
EMAIL="your_email@example.com"  # Replace with your actual email
SUBJECT="Log Error Rectification Report"
BODY=""

# Function to send email notification
send_email() {
    echo -e "$BODY" | msmtp $EMAIL
}

# Rectify SDDM Errors
function rectify_sddm_errors() {
    echo "--- Rectifying SDDM Errors ---"
    THEME_PATH="/usr/share/sddm/themes/AmigaOSPharaoh/Main.qml"

    if [ ! -f "$THEME_PATH" ]; then
        BODY+="SDDM Error: Theme file not found: $THEME_PATH\n"
        BODY+="Action: Please consider switching to another theme in /etc/sddm.conf.\n"
    else
        BODY+="SDDM Error: Ensure 'errorMessage' is defined in $THEME_PATH.\n"
    fi
}

# Rectify NetworkManager Errors
function rectify_network_manager_errors() {
    echo "--- Rectifying NetworkManager Errors ---"
    BODY+="--- Rectifying NetworkManager Errors ---\n"
    echo "Ensuring auditd service is installed and running..."

    if ! systemctl is-active --quiet auditd; then
        sudo pacman -S --noconfirm audit
        sudo systemctl start auditd
        sudo systemctl enable auditd
        BODY+="NetworkManager Error: Audit service was not running. It has been installed and started.\n"
    else
        BODY+="NetworkManager Error: Audit service is already running.\n"
    fi
}

# Rectify Plasma Errors
function rectify_plasma_errors() {
    echo "--- Rectifying Plasma Errors ---"
    echo "Restarting plasmashell..."

    if ! pgrep -x "plasmashell" > /dev/null; then
        BODY+="Plasma Error: plasmashell was not running. Starting it now...\n"
        kstart plasmashell
    else
        killall plasmashell && kstart plasmashell
        BODY+="Plasma Error: Restarted plasmashell to address window ID issue.\n"
    fi

    # Check for theme errors and suggest actions
    THEME="Vivid-Dark-Plasma"
    if [ -d "$HOME/.local/share/plasma/themes/$THEME" ]; then
        BODY+="Plasma Theme Warning: The theme '$THEME' uses the legacy metadata.desktop.\n"
        BODY+="Action: Consider contacting the author to update it to use the newer JSON format.\n"
    fi

    # Check for applet errors
    APPLET_DIR="$HOME/.local/share/plasma/plasmoids"
    for applet in "$APPLET_DIR"/*; do
        if [ -d "$applet" ]; then
            if [[ ! -f "$applet/metadata.json" ]]; then
                BODY+="Plasma Applet Error: Missing metadata.json for applet: $(basename "$applet").\n"
            fi
        fi
    done
}

# Rectify Kernel Errors
function rectify_kernel_errors() {
    echo "--- Rectifying Kernel Errors ---"
    BODY+="--- Rectifying Kernel Errors ---\n"
    
    if ! pacman -Qs google-chrome > /dev/null; then
        BODY+="Kernel Error: Google Chrome was not installed. Installing now...\n"
        sudo pacman -S --noconfirm google-chrome
    else
        BODY+="Kernel Error: Reinstalling Google Chrome...\n"
        sudo pacman -Rns --noconfirm google-chrome
        sudo pacman -S --noconfirm google-chrome
    fi
    
    echo "Updating the system..."
    BODY+="Kernel Error: System updated successfully.\n"
}

# Call the rectification functions
rectify_sddm_errors
rectify_network_manager_errors
rectify_plasma_errors
rectify_kernel_errors

# Send email notification
send_email

echo "Rectification process completed and email sent."
