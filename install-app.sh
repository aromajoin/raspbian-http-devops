#!/bin/bash

# Init option variables
while getopts l:n: option
do
 case "${option}"
 in
 l) URL=${OPTARG};;
 n) NAME=${OPTARG};;
 esac
done

# Read app url
APP_FILE_URL=${URL:=https://s3-ap-northeast-1.amazonaws.com/aromajoin-downloads/software/aroma-http-controller/sample.war}

APP_FILE=${NAME:=sample.war}

DESTINATION_FILE=$HOME/$APP_FILE

echo "Start downloading ${APP_FILE} from: ${APP_FILE_URL}"

# Download app file
curl "$APP_FILE_URL" -o $DESTINATION_FILE

# Move app file into the server folder
if [ -f "$DESTINATION_FILE" ]
then
    mv $DESTINATION_FILE /opt/jetty/web/bbq/webapps
    chown jetty:jetty /opt/jetty/web/bbq/webapps/{$APP_FILE}
else
    echo
    echo "Failed to download file."
    exit 1
fi

# Restart Jetty
echo "Restart Jetty server ..."
service jetty restart

if [ $? != 0 ]
then
    echo "Failed to restart sever."
    exit 1
fi

echo
echo "Completed. App is served at: localhost:8080"
exit 0