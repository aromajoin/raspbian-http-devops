# Script design

3 necessary scripts
* Setup WiFi: ./wifi.sh
* Setup Jetty: ./install-jetty.sh
* Deploy AromaController app: ./install-controller-app.sh

## Usages

### Setup WiFi
* Initialize WiFi interface
* Ask users to input WiFi credential (SSID and password)
* Connect WiFi
* Check whether it is successful of not
* Allow users to restart WiFi

1. Initialize WiFi interface
```bash
$sudo ./wifi.sh init
```

1. Setup WiFi
```bash
$sudo ./wifi.sh setup
```

2. Restart WiFi
```bash
$sudo ./wifi.sh restart
```

### Setup Jetty server
* Check Java 8 availability and download it if it is not installed yet
* Download and install Jetty server
* Put it as a service
* Set the service automatically runs every time Raspberry Pi is powered on

```bash
$sudo ./install-jetty.sh
``` 

### Deploy AromaController app
* Download the latest AromaController app (.war file)
* Put it inside Jetty's folder where it is defined by Jetty itself
* Restart Jetty to make new .war file loaded
* Check if it runs correctly
* Show message

```bash
$sudo ./install-controller-app.sh
``` 