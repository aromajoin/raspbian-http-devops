#!/bin/bash

echo "country=JP" > /etc/wpa_supplicant/wpa_supplicant.conf
echo "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev" >> /etc/wpa_supplicant/wpa_supplicant.conf
echo "update_config=1" >> /etc/wpa_supplicant/wpa_supplicant.conf
echo "ap_scan=1" >> /etc/wpa_supplicant/wpa_supplicant.conf

cat ./wifi_credentials.conf >> /etc/wpa_supplicant/wpa_supplicant.conf

read -p "Enter to exit" key_board
exit 0
