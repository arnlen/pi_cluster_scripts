#!/bin/bash

echo "Temperature monitoring started. Hit CTRL+C to stop."

for (( ; ; ))
do
  vcgencmdOutput=$(vcgencmd measure_temp)
  reading=${vcgencmdOutput:5:4}
  piName=$PI_NAME

  serverName='pi-cooler'
  apiEndpoint='http://'$serverName':3000/temperatures.json'

  echo "["$piName"] Temperature: "$reading
  curl -X POST -H "Content-Type: application/json" \
    -d '{ "temperature": { "pi_name": "'$piName'", "reading": '$reading' } }' \
    $apiEndpoint

  sleep 30
done