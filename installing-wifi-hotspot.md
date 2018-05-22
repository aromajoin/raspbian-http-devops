# Installing Wi-Fi Hotspot on Raspberry Pi Zero W

## 1.Access Raspberry Pi via SSH

## 2.Download required scripts

From Raspberry terminal

```Shell
  $cd ~
  $curl -O https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/enable-hotspot
  $curl -O https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/rpizero-hotspot
```

Make sure these scripts are downloaded under under `/home/pi/` folder.

## 3.Make excutable hotspot scripts

Go to `/home/pi/` folder and run the commands

```Shell
  $sudo chmod +x ./enable-hotspot
  $sudo chmod +x ./rpizero-hotspot
  $./enable-hotspot
```

## 4.Reboot Raspberry Pi

```Shell
  $sudo reboot
```
