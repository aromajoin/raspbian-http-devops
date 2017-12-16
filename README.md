# Setup Wifi Connection and HTTP Server Deployment with Rasbian OS

## Purposes
Setting up Wi-Fi automatically on Raspbian.

Project provides SHELL scripts that allows setting up Wi-Fi network and a HTTP server on Raspbian OS.

Main features:

- Config wifi network connection with given credentials automatically.
- Install a Jetty HTTP server on Raspbian

## System Context

* Raspberry Pi 2/3 Kit

* Raspbian Stretch Lite OS

## Setup Wi-Fi Connection

* Step 1: Boot the Raspberry Pi without the WiFi adapter plugged in.
* Step 2: Open a Terminal session by clicking on the LXTerminal icon, and run the following SHELL scripts:
    
    * `$sudo ./init_wifi_interface.sh`
    * `$sudo ./set_wifi_credentials.sh`
    * `$sudo ./restart_wifi_network.sh`

* Step 3: Shut down your Raspberry Pi, plug the WiFi adapter in and start it up again. You should find that the Raspberry Pi connects using the WiFi adapter as it boots up.

## Install Jetty Server

Just simply run the script:

 * `$sudo ./setup_jetty.sh`

## Check/Start Server

You can check Jetty service with:

 * `$sudo service jetty status`

If it is not running, then start:

 * `$sudo service jetty start`

## Deploy a webapp

 * Download .war file from URL.
 * Paste it into webapps/ folder of Jetty server
 * Restart Jetty with: `$sudo service jetty restart`