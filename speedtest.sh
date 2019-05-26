#!/usr/bin/env sh

timestamp=$(date +%s%N)
hostname=$(hostname)

echo "Current timestamp: $timestamp"

output=$(speedtest-cli --json)
echo "Output: $output"

mosquitto_pub -h $MQTT_BROKER -p $MQTT_PORT -u $MQTT_USER -P $MQTT_PASSWORD -d -t $MQTT_TOPIC -m "$output"

echo "New speedtest sent"