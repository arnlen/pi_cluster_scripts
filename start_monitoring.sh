#!/bin/bash

# TODO
# - Check presence of env variables
# - Create install script

piName=$PI_NAME
sleepTime=$MONITORING_SLEEP_TIME
serverName='pi-cooler'
apiEndpoint="http://$serverName.local:3000/temperatures.json"

echo "Temperature monitoring started for \"$piName\"."
echo "Checking temperature every $sleepTime seconds."
echo "API Endpoint: $apiEndpoint"
echo "Hit CTRL+C to stop"
echo ""
echo "---"
echo ""

for (( ; ; ))
do
  vcgencmdOutput=$(vcgencmd measure_temp)
  reading=${vcgencmdOutput:5:4}

  time=$(date +"%T")
  echo "$time ["$piName"] Temperature: "$reading

  curl -X POST -H "Content-Type: application/json" \
    -d '{ "temperature": { "pi_name": "'$piName'", "reading": '$reading' } }' \
    $apiEndpoint

  sleep $sleepTime
done