#!/bin/bash
MODE=$1

# Initialize WiFi
init () {
    echo "Initialize WiFi interface"
    INTERFACE="wlan0"

    grep ${INTERFACE} /etc/network/interfaces > /dev/null

    # If returns 0, it means have errors
    if [ $? != 0 ]
    then
        echo "auto lo" >> /etc/network/interfaces
        echo >> /etc/network/interfaces
        echo "iface lo inet loopback" >> /etc/network/interfaces
        echo "iface eth0 inet dhcp" >> /etc/network/interfaces
        echo >> /etc/network/interfaces
        echo "allow-hotplug wlan0" >> /etc/network/interfaces
        echo "auto wlan0" >> /etc/network/interfaces
        echo "iface wlan0 inet dhcp" >> /etc/network/interfaces
        echo "wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf" >> /etc/network/interfaces
        echo >> /etc/network/interfaces
        echo "iface default inet dhcp" >> /etc/network/interfaces

        ifconfig wlan0 up

        if [ $? == 0 ]
        then
            echo "Configure network interface"
        else
            echo
            echo "Failed to configure network."
            exit 1
        fi
    fi

    echo "Complete successfully."
}

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

if [ "$MODE" = "init" ]; then
    init
elif [ "$MODE" = "setup" ]; then
    setup
elif [ "$MODE" = "restart" ]; then
    restart
else 
    echo -e "Can not understand command. 
    \t- Use 'setup' to set up new WiFi configuration.
    \t- Use 'restart' to restart WiFi connection."
fi