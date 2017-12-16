#!/bin/bash

# download jetty
curl -o jetty.zip http://central.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.8.v20171121/jetty-distribution-9.4.8.v20171121.zip

# move zip file
mkdir -p /opt/jetty
mv jetty.zip /opt/jetty

# extract Jetty archive
cd /opt/jetty
unzip jetty.zip
mv jetty-distribution-9.4.8.v20171121/ runtime
rm jetty.zip

# setup Jetty as a service
cp runtime/bin/jetty.sh /etc/init.d/jetty
echo JETTY_HOME=`pwd`/runtime > /etc/default/jetty
service jetty start
if [ $? != 0 ]
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