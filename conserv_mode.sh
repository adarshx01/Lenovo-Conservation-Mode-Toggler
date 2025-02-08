#!/bin/bash

conservation_mode_path="/sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode"

if [ -f "$conservation_mode_path" ]; then
    current_status=$(cat "$conservation_mode_path")

    if [ "$current_status" -eq 1 ]; then
        #echo "Turning OFF Conservation Mode..."
        echo 0 | sudo tee "$conservation_mode_path" > /dev/null
        echo "Conservation Mode turned OFF"
    else
        #echo "Turning ON Conservation Mode..."
        echo 1 | sudo tee "$conservation_mode_path" > /dev/null
        echo "Conservation Mode turned ON"
    fi
else
    echo "Error: Conservation Mode is not supported on this device."
    exit 1
fi

