#!/bin/bash

# read app url
input=app_url.conf
while IFS= read -r app_url
do
	echo "App URL: $app_url"
done < "$input"

if [ -z ${app_url} ]
then
  echo "App download link is not found"
  read -p "Enter to exit" key_board
  exit 1
else
  echo "App Link: '$app_url'"
fi

# download app file
curl -sS `pwd`/aromacontroller.war "$app_url"

# move app file into the server folder
file=`pwd`/aromacontroller.war
if [ -f "$file" ]
then
  cp `pwd`/aromacontroller.war /opt/jetty/web/bbq/webapps
  chown jetty:jetty /opt/jetty/web/bbq/webapps/aromacontroller.war
else
  echo "Download app failed"
  read -p "Enter to exit" key_board
  exit 1
fi

# restart Jetty
/etc/init.d/jetty restart

read -p "Done. Enter to exit" key_board
exit 0