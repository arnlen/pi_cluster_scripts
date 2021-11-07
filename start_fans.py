import RPi.GPIO as GPIO

fanPin = 23

print("Starting fans!")
GPIO.output(fanPin, GPIO.HIGH)