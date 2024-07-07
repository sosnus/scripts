ADDR_INFLUX=sms-influxdb-container
PORT_INFLUX=8086

# show databases
curl --location --request POST http://$ADDR_INFLUX:$PORT_INFLUX/query \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'q=SHOW DATABASES'

#create database
curl --location --request POST http://$ADDR_INFLUX:$PORT_INFLUX/query \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'q=CREATE DATABASE greenhouse_jaroszki'

# write data
curl --location --request POST http://$ADDR_INFLUX:$PORT_INFLUX/write?db=greenhouse_jaroszki \
--header 'Content-Type: text/plain' \
--data-raw 'temperature,device=greenhouse01 value=0.2'

# read data
curl --location --request POST http://$ADDR_INFLUX:$PORT_INFLUX/query?db=greenhouse_jaroszki \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'q=SELECT * FROM temperature'


# GET http://localhost:8086/health

# http://localhost:8086/ping