#!/usr/bin/env bash

# Paths to your rasi files
STYLE="$HOME/.config/rofi/style.rasi"
LOAD_STYLE="$HOME/.config/rofi/loading-style.rasi"

# Get Bluetooth power status
power_on=$(bluetoothctl show | grep "Powered: yes")

if [ -z "$power_on" ]; then
    options="󰂯  Enable Bluetooth"
else
    options="󰂲  Disable Bluetooth\n󰂰  Scan for Devices"
    
    # Get list of all known devices
    # We use a loop to check the 'Connected' status for each one
    while read -r line; do
        if [ -n "$line" ]; then
            mac=$(echo "$line" | awk '{print $2}')
            name=$(echo "$line" | cut -d ' ' -f 3-)
            
            # Check if this specific MAC is connected
            if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
                options="$options\n󰂱  $name [Connected]"
            else
                options="$options\n󰂯  $name"
            fi
        fi
    done <<< "$(bluetoothctl devices)"
fi

# Show Rofi menu
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Bluetooth: " -theme "$STYLE")

# Exit if user hits Esc
[ -z "$chosen" ] && exit

# Handle selection
if [ "$chosen" = "󰂯  Enable Bluetooth" ]; then
    bluetoothctl power on
elif [ "$chosen" = "󰂲  Disable Bluetooth" ]; then
    bluetoothctl power off
elif [ "$chosen" = "󰂰  Scan for Devices" ]; then
    # --- LOADING WINDOW ---
    echo "" | rofi -theme "$LOAD_STYLE" -dmenu -p "Scanning..." &
    LOAD_PID=$!
    bluetoothctl --timeout 5 scan on > /dev/null 2>&1
    kill $LOAD_PID 2>/dev/null
    exec "$0" # Restart to show new devices
elif [ -n "$chosen" ]; then
    # Extract name (removing icon and status tag)
    # This removes the icon (first 3 chars) and the "[Connected]" suffix if present
    clean_name=$(echo "$chosen" | sed 's/^...//;s/ \[Connected\]$//')
    
    # Get MAC address for the name
    device_mac=$(bluetoothctl devices | grep "$clean_name" | awk '{print $2}')

    if [[ "$chosen" =~ "Connected" ]]; then
        # If already connected, offer to disconnect
        action=$(echo -e "󱘖  Disconnect\n󰜺  Cancel" | rofi -dmenu -i -p "Action for $clean_name:" -theme "$STYLE")
        if [ "$action" = "󱘖  Disconnect" ]; then
            bluetoothctl disconnect "$device_mac" && notify-send "Bluetooth" "Disconnected from $clean_name"
        fi
    else
        # If not connected, attempt connection
        notify-send "Bluetooth" "Connecting to $clean_name..."
        bluetoothctl connect "$device_mac" && notify-send "Bluetooth" "Connected to $clean_name"
    fi
fi
