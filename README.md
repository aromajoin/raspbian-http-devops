# Config Wi-Fi Network and Jetty Server Deployment on Raspbian OS

## Purposes

Setting up DevOps env automatically on Raspbian Stretch Lite.

Project provides SHELL scripts that allow setting up Wi-Fi network and Java Jetty server.

Main features:

- Config Wi-Fi network connection with given credentials
- Install a Jetty HTTP server

## System Context

- Raspberry Pi 2/3 Kit

- Raspbian Stretch Lite OS

## Get Started

You can follow one of two approaches.

### Use Debian/Raspbian package

- Step 1: From Raspbian OS, download debian package with
  - `curl -o -L https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/raspbian-http-devops_1.1.0.deb`
- Step 2: Add Debian arch for using multi arch
  - `sudo dpkg --add-architecture amd64`
- Step 3: Install Debian package
  - `sudo dpkg -i raspbian-http-devops_1.1.0.deb`

### Build from source

Prepare SD Card of Raspbian OS following:

- Step 1: From local, create a folder using `mkdir /root/bin` on Raspbian of SD Card
- Step 2: Copy all SHELL scripts from this project and then paste them into the `/root/bin/`
  - `sudo cp -a [local]/raspbian-http-devops/* [raspbian]/root/bin/`
- Step 3: Finally, add the following line under `/root/.bashrc`
  - `export PATH="$HOME/bin:$PATH"`
- Step 4: Don't forget make scripts executable
  - `sudo chmod +x /root/bin/raspbian-wifi-interface`
  - `sudo chmod +x /root/bin/raspbian-credential-wifi`
  - `sudo chmod +x /root/bin/raspbian-restart-wifi`
  - `sudo chmod +x /root/bin/raspbian-jetty-conf`
  - `sudo chmod +x /root/bin/raspbian-http-controller`

For now, you can run these scripts just like normal linux command.

## Usages

Log in Raspbian OS as default user `pi:raspberry`

Give you root's privileges with `sudo -s`

### Setup Wi-Fi Network

- Step 1: Boot the Raspberry Pi without the WiFi adapter plugged in.
- Step 2: Open a Terminal session by clicking on the LXTerminal icon, and run the following SHELL scripts:

  - `$sudo raspbian-wifi-interface`
  - `$sudo raspbian-credential-wifi`

- Step 3: Shut down your Raspberry Pi, plug the WiFi adapter in and start it up again. You should find that the Raspberry Pi connects using the WiFi adapter as it boots up.

### Restart Wi-Fi Network

- `$sudo raspbian-restart-wifi`

### Install Jetty Server

- Step 1: Put jetty server link into the `jetty_url.conf`
- Step 2: Just simply run the script:

  - `$sudo raspbian-jetty-conf`

### Check/Start Web Server

You can check Jetty service with:

- `$sudo service jetty status`

If it is not running, then start:

- `$sudo service jetty start`

### Deploy a webapp

- Step 1: Put app link into the `/usr/share/raspbian-http-devops/app_url.conf`
- Step 2: Run script: `$sudo raspbian-http-controller`
