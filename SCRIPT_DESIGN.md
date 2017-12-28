# Script design

3 necessary scripts
* Setup WiFi: ./wifi.sh
* Setup Jetty: ./install-jetty.sh
* Deploy AromaController app: ./install-controller-app.sh

## Usages

### Setup WiFi
* Ask users to input WiFi credential (SSID and password)
* Connect WiFi
* Check whether it is successful of not
* Allow users to restart WiFi

1. Setup WiFi
```bash
user@bash: ./wifi.sh
SSID: user_input_ssid
Password: user_input_password
is it a hidden network?(y/n):
Try to connect ...
Connected successfully. IP address: 192.168.1.12
user@bash: ... 
```

2. Restart WiFi
```bash
user@bash: ./wifi.sh restart
SSID: user_input_ssid
Password: user_input_password
is it a hidden network?(y/n):
Try to connect ...
Connected succefully. IP address: 192.168.1.12 
user@bash: ...
```

### Setup Jetty server
* Check Java 8 availability and download it if it is not installed yet
* Download and install Jetty server
* Put it as a service
* Set the service automatically runs every time Raspberry Pi is powered on

```bash
user@bash: ./install-jetty.sh
``` 

### Deploy AromaController app
* Download the latest AromaController app (.war file)
* Put it inside Jetty's folder where it is defined by Jetty itself
* Restart Jetty to make new .war file loaded
* Check if it runs correctly
* Show message

```bash
user@bash: ./install-controller-app.sh
``` 