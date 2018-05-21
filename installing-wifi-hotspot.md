# Installing Wi-Fi Hotspot on Raspberry Pi Zero W

## Download scripts

Download two scripts from the online server following URLs:

* [enable-hotspot script](https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/enable-hotspot)
* [rpizero-hotspot script](https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/rpizero-hotspot)

Then put them into Raspberry Pi's SDCard under `/home/pi/` folder. Put back SDCard and restart Raspberry Pi.

## Excute enable hotspot script

Go to `/home/pi/` folder and run the commands

```Shell
  $sudo chmod +x ./enable-hotspot
  $sudo chmod +x ./rpizero-hotspot
  $./enable-hotspot
```
