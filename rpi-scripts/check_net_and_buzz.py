#!/usr/bin/env python
print("aaa............")
import time
from grovepi import *

import isconnected

print("script start............")

# Connect the Grove LED to digital port D4
led = 2

pinMode(led,"OUTPUT")

print ("BUZZER TEST, Pin D2")


print ("check connection")
if isconnected.isconnected:
	a = 1;
else :
	a = 5;
print ("after test")
for x in range(a):
    try:
        #Blink the LED
        digitalWrite(led,1)		# Send HIGH to switch on LED
        print ("LED ON!")
        time.sleep(0.15)

        digitalWrite(led,0)		# Send LOW to switch off LED
        print ("LED OFF!")
        time.sleep(0.15)

    except KeyboardInterrupt:	# Turn LED off before stopping
        digitalWrite(led,0)
        break
    except IOError:				# Print "Error" if communication error encountered
        print ("Error")

