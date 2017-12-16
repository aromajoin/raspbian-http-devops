#!/bin/bash


# IP for the checking server
SERVER=8.8.8.8

ping -c2 ${SERVER} > /dev/null

# If the return code from ping ($?) is not 0 (means there was an error)
if [ $? != 0 ]
then
  # Restart the wireless interface
  ifconfig wlan0 down
  ifconfig wlan0 up
fi

exit 0
