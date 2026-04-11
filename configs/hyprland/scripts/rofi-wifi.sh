#!/usr/bin/env bash

# --- Configuration & Paths ---
STYLE="$HOME/.config/rofi/style.rasi"
PASS_STYLE="$HOME/.config/rofi/password-style.rasi"
LOAD_STYLE="$HOME/.config/rofi/loading-style.rasi"

# 1. Show the "Loading" Rofi in the background
echo "" | rofi -theme "$LOAD_STYLE" -dmenu -p "Scanning for networks..." &
LOAD_PID=$!

# 2. Perform the scan and format the list
# We don't use --rescan no here because we WANT a fresh scan to justify the loading screen
# We add 'sed "s/  */ /g"' at the end to squash all extra spaces
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed -E "s/WPA*.?\S/ /g; s/^--/ /g; s/  //g" | sed 's/  */ /g' | sed "/--/d")

# 3. Kill the loading window
kill $LOAD_PID 2>/dev/null

# 4. Check Wi-Fi status for the toggle option
connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
    toggle="󰖪  Disable Wi-Fi"
else
    toggle="󰖩  Enable Wi-Fi"
fi

# 5. Use rofi to select wifi network
chosen_network=$(echo -e "$toggle\n$wifi_list" | uniq -u | rofi -theme "$STYLE" -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )

# Exit if user hits Esc
if [ -z "$chosen_network" ]; then
    exit
fi

# Extract the SSID (skipping the icon and space)
chosen_id="${chosen_network:3}"

# --- Logic Handling ---

if [ "$chosen_network" = "󰖩  Enable Wi-Fi" ]; then
    nmcli radio wifi on
elif [ "$chosen_network" = "󰖪  Disable Wi-Fi" ]; then
    nmcli radio wifi off
else
    success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
    
    # Get saved connections to check if we already have the password
    saved_connections=$(nmcli -g NAME connection)
    
    if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
        # Already saved: Just bring the connection up
        nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
    else
        # Not saved: Check if it's a secure network (contains the lock icon)
        if [[ "$chosen_network" =~ "" ]]; then
            wifi_password=$(echo "" | rofi -theme "$PASS_STYLE" -dmenu -p "Password: " )
            
            # Exit if no password entered
            [ -z "$wifi_password" ] && exit
        fi
        
        # Attempt to connect
        nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message"
    fi
fi
