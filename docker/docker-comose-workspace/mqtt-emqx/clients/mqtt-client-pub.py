#!/usr/bin/env python3
from threading import Thread
import time

import paho.mqtt.client as mqtt
def on_connect(client, userdata, flags, rc):
    # This will be called once the client connects
    print(f"Connected with result code {rc}")
    # Subscribe here!
    client.subscribe("testtopic")
def on_message(client, userdata, msg):
    print(f"Message received [{msg.topic}]: {msg.payload}")



def mqttHeartbeat():
    print("mqtt connected, run mqttHeartbeat()")
    while True:
        print('Heartbeat')
        client.publish("testtopic","Heartbeat") 
        time.sleep(5)


client = mqtt.Client("mqtt-test") # client ID "mqtt-test"
client.on_connect = on_connect
client.on_message = on_message
client.username_pw_set("user2", "user2")
client.connect('127.0.0.1', 1883)
ret= client.publish("testtopic","on") 
print(ret)
mqttHeartbeat()
client.loop_forever()  # Start networking daemon

# https://techoverflow.net/2021/12/27/how-to-set-username-password-in-paho-mqtt/