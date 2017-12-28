#!/bin/bash
MODE=$1

# Setup wifi
setup () {
    # Ask user to input information
    echo "Enter your WiFi configuration"
    read -p 'Network name (SSID): ' SSID
    read -sp 'Password: ' PASSWORD
    echo
    read -p "Is it a hidden network? [y/n]" RESPONSE
    HIDDEN=0
    if [ "$RESPONSE" = "y" ]; then
        # Hidden network
        HIDDEN=1
    else
        # Discoverable network
        HIDDEN=0
    fi

    WIFI_CREDENTIAL="network={
    ssid=\"$SSID\"
    psk=\"$PASSWORD\"
    scan_ssid=$HIDDEN\r}"

    WIFI_CONFIG_FILE_URL=/etc/wpa_supplicant/wpa_supplicant.conf
    # Put configuration into network config file.
    # Raspberry Pi will read these configuration data to connect to the network.
    echo "country=JP" > $WIFI_CONFIG_FILE_URL
    echo "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev" >> $WIFI_CONFIG_FILE_URL
    echo "update_config=1" >> /$WIFI_CONFIG_FILE_URL
    echo "ap_scan=1" >> $WIFI_CONFIG_FILE_URL
    echo >> $WIFI_CONFIG_FILE_URL

    echo -e "$WIFI_CREDENTIAL" >> $WIFI_CONFIG_FILE_URL

    if [ $? != 0 ]; then
        echo "Failed to setup. Try it again."
    else
        echo "Connect successfully."
    fi
}

# Restart WiFi
restart () {
    echo "Checking network ..."
    # IP for the checking server
    SERVER=8.8.8.8

    ping -c2 ${SERVER} > /dev/null
    
    # If the return code from ping ($?) is not 0 (means there was an error)
    if [ $? != 0 ]; then
        echo "Restarting WiFi connection ... "
        # Restart the wireless interface
        ifconfig wlan0 down
        ifconfig wlan0 up
        echo "WiFi is restarted successfully."
    else
        echo "There is an error occurred."
        echo "Can not restart WiFi connection."
    fi
}

if [ "$MODE" = "setup" ]; then
    setup
elif [ "$MODE" = "restart" ]; then
    restart
else 
    echo -e "Can not understand command. 
    \t- Use 'setup' to set up new WiFi configuration.
    \t- Use 'restart' to restart WiFi connection."
fi