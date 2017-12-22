# Config Wi-Fi Network and Jetty Server Deployment on Raspbian OS

## Purposes

Setting up DevOps env automatically on Raspbian Stretch Lite.

Project provides SHELL scripts that allow setting up Wi-Fi network and Java Jetty server.

## Main steps

1. Config Wi-Fi network connection with given credentials
2. Setup Jetty application server
3. Install Java Servlet app on Jetty server

## Environment

- Hardware: Raspberry Pi

- OS: Raspbian Stretch Lite

## Get started

Firstly, download and install Raspbian OS image on Raspberry Pi by following [this official guide](https://www.raspberrypi.org/documentation/installation/installing-images/README.md).  
Then, download our necessary files and scripts by using one of two approaches.

### 1. Via Debian/Raspbian package

- Step 1: From Raspbian OS, download debian package  
    ```
    curl -o -L https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/raspbian-http-devops_1.1.0.deb
    ```
- Step 2: Add Debian arch for using multi arch  
    ```
    sudo dpkg --add-architecture amd64
    ```
- Step 3: Install Debian package  
    ```
    sudo dpkg -i raspbian-http-devops_1.1.0.deb
    ```

### 2. Copy directly to SD card which contains Raspbian OS

- Step 1: Plug the SD card into your PC/Mac
- Step 2: Create a folder in SD card to contain our scripts and files  
    ```
    sudo mkdir [raspbian]/root/bin
    ```
- Step 3: Copy all SHELL scripts from this project and then paste them into the `/root/bin/`  
    ```
    sudo cp -a [raspbian-http-devops-folder-path] [raspbian]/root/bin/
    ```
- Step 4: Export environment variable by adding path to `/root/.bashrc`  
    ```
    sudo export PATH="$HOME/bin:$PATH"
    ```
- Step 5: Don't forget to make scripts execuable  
    ```
    sudo chmod +x [script-file-path]
    ```

For now, you can run these scripts just like normal linux command.

## Usages

Log in Raspbian OS as default user `pi:raspberry`  
Give you root's privileges with `sudo -s`

### Configure Wi-Fi Network

- Step 1: Boot the Raspberry Pi without the WiFi adapter plugged in.
- Step 2: Open a Terminal session by clicking on the LXTerminal icon, and run the following SHELL scripts:  
    ```
    $sudo raspbian-wifi-interface
    ```
- Step 3: Update Wi-Fi network credentials  
    ```
    $nano /usr/share/raspbian-http-devops/wifi_credentials.conf
    $sudo raspbian-credential-wifi
    ```
- Step 4: Shut down your Raspberry Pi, plug the WiFi adapter in and start it up again. You should find that the Raspberry Pi connects using the WiFi adapter as it boots up.

### Restart Wi-Fi Network

```
$sudo raspbian-restart-wifi
```

### Setup Jetty Server

- Step 1: Put jetty server link  
    ```
    $nano /usr/share/raspbian-http-devops/jetty_url.conf
    ```
- Step 2: Just simply run the script  
    ```
    $sudo raspbian-jetty-conf
    ```

### Check/Start Web Server

You can check Jetty service with:
```
$sudo service jetty status
```

If it is not running, then start:
```
$sudo service jetty start
```

### Deploy a webapp

- Step 1: Put app link into  
    ```
    $nano /usr/share/raspbian-http-devops/app_url.conf
    ```
- Step 2: Run `$sudo raspbian-http-controller`
