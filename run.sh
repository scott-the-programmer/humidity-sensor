#!/bin/bash
set -e

serial_port=$1
ssid=$2
password=$3

board_identifier="esp8266:esp8266:nodemcuv2:xtal=80"

echo "Writing configuration"
echo "const char * ssid=\"$ssid\";" > ./esp8266/values.h
echo "const char * password=\"$password\";" >> ./esp8266/values.h

echo "Compiling code"
arduino-cli compile --fqbn $board_identifier esp8266

echo "Deploying code to $board_identifier on $serial_port"
arduino-cli upload -p $serial_port --fqbn $board_identifier esp8266