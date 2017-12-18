# Setup Wifi Connection and HTTP Server Deployment with Rasbian OS

## Purposes

Setting up DevOps env automatically on Raspbian OS.

Project provides SHELL scripts that allows setting up Wi-Fi network and a HTTP server.

Main features:

- Config wifi network connection with given credentials automatically.
- Install a Jetty HTTP server on Raspbian

## System Context

- Raspberry Pi 2/3 Kit

- Raspbian Stretch Lite OS

## Setup Wi-Fi Network

- Step 1: Boot the Raspberry Pi without the WiFi adapter plugged in.
- Step 2: Open a Terminal session by clicking on the LXTerminal icon, and run the following SHELL scripts:
  - `$sudo ./init_wifi_interface.sh`
  - `$sudo ./setup_wifi_credentials.sh`

- Step 3: Shut down your Raspberry Pi, plug the WiFi adapter in and start it up again. You should find that the Raspberry Pi connects using the WiFi adapter as it boots up.

## Restart Wi-Fi Network

- `$sudo ./restart_wifi_network.sh`

## Install Jetty Server

- Step 1: Put jetty server link into the `jetty_url.conf`
- Step 2: Just simply run the script:

  - `$sudo ./setup_jetty.sh`

## Check/Start Web Server

You can check Jetty service with:

- `$sudo service jetty status`

If it is not running, then start:

- `$sudo service jetty start`

## Deploy a webapp

- Step 1: Put app link into the `app_url.conf`
- Step 2: Run script: `$sudo ./setup_controller_app.sh`

For more application details, please consider to [project guides](https://bitbucket.org/aromajoin/http-aromacontroller/src/4898ea58e914a07bfe8764cdf1fd8e0acec92e07/README.md?at=master)