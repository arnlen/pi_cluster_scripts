#!/bin/bash

echo "Temperature monitoring started. Hit CTRL+C to stop."

for (( ; ; ))
do
  vcgencmdOutput=$(vcgencmd measure_temp)
  reading=${vcgencmdOutput:5:4}
  piName=$PI_NAME

  echo "["$piName"] Temperature: "$reading

  echo $piName
  echo $reading

  curl -X POST -H "Content-Type: application/json" -d '{ "temperature": { "pi_name": '$piName', "reading": '$reading' } }' http://localhost:3000/temperatures.json

  sleep 30
done
