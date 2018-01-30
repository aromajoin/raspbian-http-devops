# Java Web Application Deployment on Raspbian OS

## Purposes

Setting up production environment automatically for Java web application on Raspbian Stretch Lite.
Project provides shell scripts that allow to setting up Wi-Fi network, Jetty web server and deploy Java web app.

## Production environment

- Hardware: Raspberry Pi
- OS: Raspbian Stretch Lite

## Wi-Fi Module Deployment Process From Using Scripts

### 1. Download and install Raspbian OS image on Raspberry Pi by following [this official guide](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

### 2. Config SSH Access

- With RaspberryPi Zero, you might need to read the guides [here.](/ssh-to-raspberry-via-usb.md)
- With RaspberryPi 3 Model, open up the boot partition and create a new empty file simply called `ssh` in the SD card. By default SSH is disabled so this is required to enable it.
- Check SSH via `pi@raspberry.local` with default password `raspberry`

### 3. Copy all scripts from local to RaspberryPi with SCP command

```Shell
  $scp -r [raspbian-http-devops-folder-path] pi@raspberry.local:/home/pi
```

### 4. Login RaspberryPi terminal via SSH

```Shell
  $ssh pi@raspberry.local
```

with default password `raspberry`

### 5. Configure Wi-Fi Network

In the terminal

```Shell
  $sudo raspi-config
```

Then choose `Network Options` to configure network settings.

Note: *After setting, shut down your Raspberry Pi, and start it up again. You should find that the Raspberry Pi connects using the WiFi as it boots up.*

### 6. Jetty Server Installation

Just simply run the script

```Shell
  $sudo ./install-jetty
```

You can check Jetty service with:

```Shell
  $sudo service jetty status
```

If it is not running, then start:

```Shell
  $sudo service jetty start
```

### 7. Deploy Java Web App

Run the script

```Shell
  $sudo ./install-app -l [webapp-download-link] -n [webapp-name]
```

## Deployment Process From Customed Raspbian Image

After we already performed deployment completely on one RaspberryPi, it may be sensible and faster process for us to keep a copy of the entire SD card image, so we can restore the card if we lose it or the app becomes corrupt.

### 1. Insert the SD card in your PC using a USB or built-in card reader. Then list all the filesystems present on your system

```Shell
  $sudo fdisk -l
```

### 2. Try to find out the *device name* of the SD card. on the linux, it is something like `/dev/sdb` which has a size of the SD card

### 3. In linux, use the `dd` command to write an customed image of Raspbian OS to your hard disk

To compress, you can pipe the output of `dd` to `gzip` to get a compressed file that is significantly smaller than the original size

```Shell
  $sudo dd bs=4M if=/dev/sdb | gzip > ~/http_raspbian.img.gz
```

### 4. To restore, pipe the output of `gunzip` to `dd`, for example

It take about 20 minutes.

```Shell
  $gunzip --stdout ~/raspbian.img.gz | sudo dd bs=4M of=/dev/sdb
```