#!/bin/bash

# get download jetty url
input=app_url.conf
while IFS= read -r app_url
do
  echo "'$app_url'"
done < "$input"

if [ -z ${app_url} ]
then
  echo "App not found"
  read -p "Enter to exit" key_board
  exit 0
else
  echo "App Link: '$app_url'"
fi

# download jetty
curl -sS `pwd`/aromacontroller.war "$app_url"

# move zip file
file=`pwd`/aromacontroller.war
if [ -f "$file" ]
then
  mkdir -p `pwd`/http-controller
  mv `pwd`/aromacontroller.war `pwd`/http-controller
else
  echo
  echo "==== Download app failed ===="
  read -p "Enter to exit" key_board
  exit 1
fi

# wait input to exit program
echo
read -p "Done. Enter to exit" key_board
exit 0