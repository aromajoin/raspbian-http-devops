#!/bin/bash

echo "country=JP" > /etc/wpa_supplicant/wpa_supplicant.conf
echo "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev" >> /etc/wpa_supplicant/wpa_supplicant.conf
echo "update_config=1" >> /etc/wpa_supplicant/wpa_supplicant.conf

cat ./wifi_credentials.conf >> /etc/wpa_supplicant/wpa_supplicant.conf

exit 0
