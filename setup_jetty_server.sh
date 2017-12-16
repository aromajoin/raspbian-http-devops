#!/bin/bash

# get download jetty url
input=jetty_url.conf
while IFS= read -r jetty_url
do
	echo "$jetty_url"
done < "$input"

if [ -z ${jetty_url} ]
then
  echo "Jetty download link is not found"
  read -p "Enter to exit" key_board
  exit 1
else
  echo "Jetty Link: '$jetty_url'"
fi

# download jetty
curl -o jetty.zip "$jetty_url"

# move zip file
file="./jetty.zip"
if [ -f "$file" ]
then
  mkdir -p /opt/jetty
  mv ./jetty.zip /opt/jetty
else
  echo "Download Jetty failed"
  read -p "Enter to exit" key_board
  exit 1
fi

# extract Jetty archive
cd /opt/jetty
unzip jetty.zip
mv jetty-distribution-*/ runtime
rm jetty.zip

# setup Jetty as a linux service with System V
cp runtime/bin/jetty.sh /etc/init.d/jetty
echo JETTY_HOME=`pwd`/runtime > /etc/default/jetty
service jetty start
if [ $? == 0 ]
then
  # Stop jetty service
  service jetty stop
fi

# automatically start Jetty
update-rc.d jetty defaults

# configure Jetty to run with a 'jetty' user
mkdir -p /opt/jetty/web/bbq
mkdir -p /opt/jetty/temp
useradd --user-group --shell /bin/false --home-dir /opt/jetty/temp jetty

# setup jetty base configuration
cd /opt/jetty/web/bbq
java -jar /opt/jetty/runtime/start.jar --add-to-start=deploy,http,console-capture

# wrap configuration of Jetty service
chown -R jetty:jetty /opt/jetty
echo "JETTY_HOME=/opt/jetty/runtime" > /etc/default/jetty
echo "JETTY_BASE=/opt/jetty/web/bbq" >> /etc/default/jetty
echo "TMPDIR=/opt/jetty/temp" >> /etc/default/jetty

# Now Jetty run on default port 8080
read -p "Done. Enter to exit" key_board
exit 0