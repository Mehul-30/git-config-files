#!/bin/bash

choice=$(printf "🔊 Volume Up\n🔉 Volume Down\n☀ Brightness Up\n🌙 Brightness Down\n Bluetooth Devices\n📶 Toggle Hotspot" | rofi -dmenu -p "Control Center")

case "$choice" in

"🔊 Volume Up")
    pamixer -i 5
    ;;

"🔉 Volume Down")
    pamixer -d 5
    ;;

"☀ Brightness Up")
    brightnessctl set +5%
    ;;

"🌙 Brightness Down")
    brightnessctl set 5%-
    ;;

" Bluetooth Devices")
    bluetoothctl devices | cut -d' ' -f3- | rofi -dmenu -p "Bluetooth Devices"
    ;;

"📶 Toggle Hotspot")
    nmcli device wifi hotspot ifname wlan0 ssid MyHotspot password 12345678
    ;;

esac
