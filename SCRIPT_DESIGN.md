# Script design

3 necessary sripts
* Setup WiFi: ./wifi.sh
* Setup Jetty: ./setup-jetty.sh
* Deploy AromaController app: ./deploy-aromacontroller.sh

## Usages

### Setup WiFi
* Ask users to input WiFi credential (SSID and password)
* Connect WiFi
* Check whether it is successful of not
* If not, ask users to re-enter SSID and password
For example, it is successfully connected at the first time.
```bash
user@bash: ./wifi.sh
SSID: user_input_ssid
Password: user_input_password
is it a hidden network?(y/n):
Try to connect ...
Connected successfully. IP address: 192.168.1.12
user@bash: ... 
```

For example, it fails to connect if users input incorrect information at the first time.
```bash
user@bash: ./wifi.sh setup
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
* Set the service automatically runs everytime Raspberry Pi is powered on

### Deploy AromaController app
* Download the lastest AromaController app (.war file)
* Put it inside Jetty's folder where it is defined by Jetty itself
* Restart Jetty to make new .war file loaded
* Check if it runs correctly
* Show message