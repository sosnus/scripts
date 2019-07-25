#!/usr/bin/env python
print("BUZZZ")
import time
from grovepi import *

buzz = 2

pinMode(buzz,"OUTPUT")

print ("BUZZER TEST, Pin D2")

for x in range(buzz):
    try:
        #Blink the LED
        digitalWrite(buzz,1)		# Send HIGH to switch on LED
        print ("LED ON!")
        time.sleep(0.15)

        digitalWrite(buzz,0)		# Send LOW to switch off LED
        print ("LED OFF!")
        time.sleep(0.15)

    except KeyboardInterrupt:	# Turn LED off before stopping
        digitalWrite(buzz,0)
        break
    except IOError:				# Print "Error" if communication error encountered
        print ("Error")

