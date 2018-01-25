# Java Web Application Deployment on Raspbian OS

## Purposes

Setting up production environment automatically for Java web application on Raspbian Stretch Lite.
Project provides shell scripts that allow setting up Wi-Fi network, Jetty web server and deploy Java web app.

## Production environment

- Hardware: Raspberry Pi
- OS: Raspbian Stretch Lite

## Wi-Fi Module Product Deployment Process

### 1. Download and install Raspbian OS image on Raspberry Pi by following [this official guide](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

### 2. Config SSH access - Only RaspberryPi Zero

- If you are using RaspberryPi Zero, to enable accessing SSH 
- Boot up RaspberryPi
- Access/Check SSH via `pi@raspberry.local`
- Copy all scripts from local to RaspberryPi

```Shell
$scp -r [raspbian-http-devops-folder-path] pi@raspberry.local:/home/pi
```

*Note: In case of accessing SSH at the first time. You might need to read the guides [here.](/ssh-to-raspberry-via-usb.md)*

### 2. Copy directly to SD card which contains Raspbian OS

- Step 1: Plug the SD card into your PC/Mac
- Step 2: Create a folder in SD card to contain our scripts and files

```Shell
$sudo mkdir [raspbian]/root/bin
```

- Step 3: Copy all SHELL scripts from this project and then paste them into the `/root/bin/`

```Shell
$sudo cp -a [raspbian-http-devops-folder-path] [raspbian]/root/bin/
```

- Step 4: Export environment variable by adding path to `/root/.bashrc`

```Shell
$sudo export PATH="$HOME/bin:$PATH"
```

- Step 5: Don't forget to make scripts executable

```Shell
$sudo chmod +x [script-file-path]
```

For now, you can run these scripts just like normal linux command.

## Deploy Java web application

1. Setup Jetty application server

2. Install Java web app on Jetty server

## Usages

Access via SSH, then log in Raspbian OS as default user `pi:raspberry`

**In case of setting up Wi-Fi at the first time.**

### Configure Wi-Fi Network

- Step 1: Boot the Raspberry Pi without the WiFi adapter plugged in.

- Step 2: Open terminal and run the following shell scripts:

```Shell
$sudo ./config-wifi init
```

- Step 3: Setup Wi-Fi network credentials

```Shell
$sudo ./config-wifi setup
```

- Step 4: Shut down your Raspberry Pi, plug the WiFi adapter in and start it up again. You should find that the Raspberry Pi connects using the WiFi adapter as it boots up.

### Restart Wi-Fi Network

```Shell
$sudo ./config-wifi restart
```

### Setup Jetty Server

Just simply run the script

```Shell
$sudo ./install-jetty
```

### Check/Start Web Server

You can check Jetty service with:

```Shell
$sudo service jetty status
```

If it is not running, then start:

```Shell
$sudo service jetty start
```

### Deploy Java Web App

Run command

```Shell
$sudo ./install-app -l [webapp-download-link] -n [webapp-name]
```
