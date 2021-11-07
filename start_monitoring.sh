#!/bin/bash

echo "Temperature monitoring started. Hit CTRL+C to stop."

for (( ; ; ))
do
  vcgencmdOutput = vcgencmd measure_temp
  echo ${var:15}


  curl -X POST -H "Content-Type: application/json" -d '{ "temperature": { "pi_name": "cooler", "reading": 18.3 } }' http://localhost:3000/temperatures.json

  sleep 30
done
