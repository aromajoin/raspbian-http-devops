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

## Get Started

Prepare SD Card of Raspbian OS following:

- Step 1: Create a folder using `mkdir /root/bin`
- Step 2: Copy all SHELL scripts from this project and then paste them into the `/root/bin/`
  - `sudo cp -a [local]/raspbian-http-devops/* [raspbian]/root/bin/`
- Step 3: Finally, add the following line under `/root/.bashrc`
  - `export PATH="$HOME/bin:$PATH"`
- Step 4: Don't forget make scripts execuable
  - `sudo chmod +x /root/bin/init_wifi_interface`
  - `sudo chmod +x /root/bin/setup_wifi_credentials`
  - `sudo chmod +x /root/bin/restart_wifi_network`
  - `sudo chmod +x /root/bin/setup_jetty_server`
  - `sudo chmod +x /root/bin/setup_controller_app`

For now, you can run these scripts just like normal linux command.

## Usages

Log in Raspbian OS as default user `pi:raspberry`

Give you root's privileges with `sudo -s`

### Setup Wi-Fi Network

- Step 1: Boot the Raspberry Pi without the WiFi adapter plugged in.
- Step 2: Open a Terminal session by clicking on the LXTerminal icon, and run the following SHELL scripts:

  - `$init_wifi_interface`
  - `$setup_wifi_credentials`

- Step 3: Shut down your Raspberry Pi, plug the WiFi adapter in and start it up again. You should find that the Raspberry Pi connects using the WiFi adapter as it boots up.

### Restart Wi-Fi Network

- `$restart_wifi_network`

### Install Jetty Server

- Step 1: Put jetty server link into the `jetty_url.conf`
- Step 2: Just simply run the script:

  - `$setup_jetty_server`

### Check/Start Web Server

You can check Jetty service with:

- `$service jetty status`

If it is not running, then start:

- `$service jetty start`

### Deploy a webapp

- Step 1: Put app link into the `app_url.conf`
- Step 2: Run script: `$setup_controller_app`
