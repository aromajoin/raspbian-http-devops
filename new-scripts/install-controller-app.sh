#!/bin/bash

echo "Start downloading http-aroma-controller app."
# read app url
APP_FILE_URL=https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/sample.war
DESTINATION_FILE=$HOME/aromacontroller.war
# download app file
curl "$APP_FILE_URL" -o $DESTINATION_FILE

# move app file into the server folder
if [ -f "$DESTINATION_FILE" ]
then
  mv $DESTINATION_FILE /opt/jetty/web/bbq/webapps
  chown jetty:jetty /opt/jetty/web/bbq/webapps/aromacontroller.war
else
  echo
  echo "Failed to download file."
  exit 1
fi

# restart Jetty
echo "Restart Jetty server ..."
service jetty restart

if [ $? != 0 ]
then
  echo "Failed to restart sever."
  exit 1
fi

echo
echo "Completed. AromaShooter app is served at: localhost:8080/aromacontroller"
exit 0