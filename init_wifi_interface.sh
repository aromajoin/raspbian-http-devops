#!/bin/bash

echo "==== Initial Wifi Interface ===="
INTERFACE="wlan0"

grep ${INTERFACE} /etc/network/interfaces > /dev/null

# If returns 0, it means have errors
if [ $? != 0 ]
then
 echo "auto lo" >> /etc/network/interfaces
 echo "iface lo inet loopback" >> /etc/network/interfaces
 echo "iface eth0 inet dhcp" >> /etc/network/interfaces
 echo "allow-hotplug wlan0" >> /etc/network/interfaces
 echo "auto wlan0" >> /etc/network/interfaces
 echo "iface wlan0 inet dhcp" >> /etc/network/interfaces
 echo "wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf" >> /etc/network/interfaces
 echo "iface default inet dhcp" >> /etc/network/interfaces

 ifconfig wlan0 up

 if [ $? == 0 ]
 then
  echo "==== Config wireless network interface ===="
 else
  echo
  echo "==== Config wireless network fail ===="
  read -p "Enter to exit" key_board
  exit 1
 fi
fi

echo "==== Done ===="
read -p "Enter to exit" key_board
exit 0
