#!/bin/bash

# Bluetooth device name
bt=$(bluetoothctl devices Connected | cut -d' ' -f3-)

# External USB device names
usb=$(lsusb | grep -v -E "Linux Foundation|Integrated|Camera|Bluetooth|Intel" | sed 's/.*ID [0-9a-f:]* //')

if [ ! -z "$bt" ]; then
    echo "$bt"
elif [ ! -z "$usb" ]; then
    echo "$usb"
else
    echo ""
fi
