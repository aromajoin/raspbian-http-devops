# Java Web Application Deployment on Raspbian OS

## Purposes

Setting up production environment automatically for Java web application on Raspbian Stretch Lite.

Project provides SHELL scripts that allow setting up Wi-Fi network, Jetty web server and deploy Java web app.

## Production Environment

- Hardware: Raspberry Pi

- OS: Raspbian Stretch Lite

## Prerequisite

Config Wi-Fi network connection with given credentials

## Main steps

1. Setup Jetty application server
2. Install Java web app on Jetty server

## Get started

Firstly, download and install Raspbian OS image on Raspberry Pi by following [this official guide](https://www.raspberrypi.org/documentation/installation/installing-images/README.md).

Then, download our necessary files and scripts by using one of two approaches.

### 1. Via Debian/Raspbian package

- Step 1: From Raspbian OS, download debian package
    ```Shell
    curl -o -L https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/raspbian-http-devops_1.1.0.deb
    ```
- Step 2: Add Debian arch for using multi arch
    ```Shell
    sudo dpkg --add-architecture amd64
    ```
- Step 3: Install Debian package
    ```Shell
    sudo dpkg -i raspbian-http-devops_1.1.0.deb
    ```

### 2. Copy directly to SD card which contains Raspbian OS

- Step 1: Plug the SD card into your PC/Mac
- Step 2: Create a folder in SD card to contain our scripts and files
    ```Shell
    sudo mkdir [raspbian]/root/bin
    ```
- Step 3: Copy all SHELL scripts from this project and then paste them into the `/root/bin/`
    ```Shell
    sudo cp -a [raspbian-http-devops-folder-path] [raspbian]/root/bin/
    ```
- Step 4: Export environment variable by adding path to `/root/.bashrc`
    ```Shell
    sudo export PATH="$HOME/bin:$PATH"
    ```
- Step 5: Don't forget to make scripts execuable
    ```Shell
    sudo chmod +x [script-file-path]
    ```

For now, you can run these scripts just like normal linux command.

## Usages

Log in Raspbian OS as default user `pi:raspberry`

Give you root's privileges with `sudo -s`

### Configure Wi-Fi Network

- Step 1: Boot the Raspberry Pi without the WiFi adapter plugged in.
- Step 2: Open a Terminal session by clicking on the LXTerminal icon, and run the following SHELL scripts:
    ```Shell
    $sudo raspbian-wifi-interface
    ```
- Step 3: Update Wi-Fi network credentials
    ```Shell
    $nano /usr/share/raspbian-http-devops/wifi_credentials.conf
    $sudo raspbian-credential-wifi
    ```
- Step 4: Shut down your Raspberry Pi, plug the WiFi adapter in and start it up again. You should find that the Raspberry Pi connects using the WiFi adapter as it boots up.

### Restart Wi-Fi Network

```Shell
$sudo raspbian-restart-wifi
```

### Setup Jetty Server

- Step 1: Put jetty server link
    ```Shell
    $nano /usr/share/raspbian-http-devops/jetty_url.conf
    ```
- Step 2: Just simply run the script
    ```Shell
    $sudo raspbian-jetty-conf
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

### Deploy a webapp

- Step 1: Put app link into
    ```Shell
    $nano /usr/share/raspbian-http-devops/app_url.conf
    ```
- Step 2: Run command
    ```Shell
    $sudo raspbian-http-controller
    ```
