import RPi.GPIO as GPIO

fanPin = 23

print("Stopping fans")
GPIO.output(fanPin, GPIO.LOW)