#!/bin/bash

INTERFACE="wlan0"

grep ${INTERFACE} /etc/network/interfaces > /dev/null

# If returns  error
if [ $? != 0 ]
then
 echo "auto wlan0" >> /etc/network/interfaces
 echo "allow-hotplug wlan0" >> /etc/network/interfaces
 echo "iface wlan0 inet manual" >> /etc/network/interfaces
 echo "wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf" >> /etc/network/interfaces

 ifconfig wlan0 up

 if [ $? == 0 ]
 then
  echo "Started the wireless interface"
 fi
fi

exit 0
