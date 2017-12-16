# Setup Wifi Connection and HTTP Server Deployment with Rasbian OS

## Purposes
Setting up Wi-Fi automatically on Raspbian.

Project provides SHELL scripts that allows setting up Wi-Fi network and a HTTP server on Raspbian OS.

Main features:
- Config wifi network connection with given credentials automatically.
- Install a HTTP server on Raspbian (maybe Jetty, Tomcat, Apache, Nginx,...)

## System Context

* Raspberry Pi 2/3 Kit

* Raspbian Stretch Lite OS

## Setup Wi-Fi Connection

* Step 1: Boot the Raspberry Pi without the WiFi adapter plugged in.
* Step 2: Open a Terminal session by clicking on the LXTerminal icon, and run the following SHELL scripts:
    
    * $sudo ./init_wifi_interface.sh
    * $sudo ./set_wifi_credentials.sh
    * $sudo ./restart_wifi_network.sh

* Step 3: Shut down your Raspberry Pi, plug the WiFi adapter in and start it up again. You should find that the Raspberry Pi connects using the WiFi adapter as it boots up.

## Install Jetty Server

## Start Server App

## Update Server App