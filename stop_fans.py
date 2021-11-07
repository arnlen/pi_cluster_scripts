import RPi.GPIO as GPIO
import time

transistorPin = 23
sleep = 5

GPIO.setmode(GPIO.BCM)
GPIO.setup(transistorPin, GPIO.OUT)

GPIO.output(transistorPin, GPIO.LOW)

print("Starting fans")
GPIO.output(transistorPin, GPIO.LOW)