#!/bin/bash

# read app url
input=app_url.conf
while IFS= read -r url
do
	echo "App URL: $url"
done < "$input"

# download app file
curl -o ~/aromacontroller.war "$url"

# move app file into the server folder
cp ~/aromacontroller.war /opt/jetty/web/bbq/webapps
chown jetty:jetty /opt/jetty/web/bbq/webapps/aromacontroller.war

# restart Jetty
/etc/init.d/jetty restart

read -p "Enter to exit" key_board