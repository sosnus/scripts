# show databases
``` bash
ADDR_INFLUX=sms-influxdb-container
PORT_INFLUX=8086

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

# http://$ADDR_INFLUX:$PORT_INFLUX/ping

```




# m3db
https://github.com/m3db/m3/blob/master/README.md

## quickstart
https://m3db.io/docs/quickstart/docker/

``` bash

ADDR_INFLUX=localhost
PORT_INFLUX=7201

#!/bin/bash

# Create a Placement and Namespace 
curl -X POST http://$ADDR_INFLUX:$PORT_INFLUX/api/v1/database/create -d '{
  "type": "local",
  "namespaceName": "default",
  "retentionTime": "12h"
}' | jq .

# Check
curl http://$ADDR_INFLUX:$PORT_INFLUX/api/v1/services/m3db/placement | jq .

# Ready a Namespace
curl -X POST http://$ADDR_INFLUX:$PORT_INFLUX/api/v1/services/m3db/namespace/ready -d '{
  "name": "default"
}' | jq .

# View Details of a Namespace
curl http:/$ADDR_INFLUX:$PORT_INFLUX/api/v1/services/m3db/namespace | jq .

```

## seed for test
``` bash
#!/bin/bash
curl -X POST http://$ADDR_INFLUX:$PORT_INFLUX/api/v1/json/write -d '{
  "tags": 
    {
      "__name__": "third_avenue",
      "city": "new_york",
      "checkout": "1"
    },
    "timestamp": '\"$(date "+%s")\"',
    "value": 3347.26
}'

sleep 5

curl -X POST http://$ADDR_INFLUX:$PORT_INFLUX/api/v1/json/write -d '{
  "tags": 
    {
      "__name__": "third_avenue",
      "city": "new_york",
      "checkout": "1"
    },
    "timestamp": '\"$(date "+%s")\"',
    "value": 5347.26
}'

sleep 5

curl -X POST http://$ADDR_INFLUX:$PORT_INFLUX/api/v1/json/write -d '{
  "tags": 
    {
      "__name__": "third_avenue",
      "city": "new_york",
      "checkout": "1"
    },
    "timestamp": '\"$(date "+%s")\"',
    "value": 7347.26
}'


```


``` bash
curl -X "POST" -G "http://$ADDR_INFLUX:$PORT_INFLUX/api/v1/query_range" \
  -d "query=third_avenue" \
  -d "start=$(date "+%s" -d "45 seconds ago")" \
  -d "end=$( date +%s )" \
  -d "step=5s" | jq .  


```





# Influxdb requests
``` bash
# write data
curl --location --request POST http://$ADDR_INFLUX:$PORT_INFLUX/write?db=mydb \
--header 'Content-Type: text/plain' \
--data-raw 'power,device=myturbine01 value=0.2'




curl --location --request POST http://$ADDR_INFLUX:$PORT_INFLUX/query?db=mydb \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'q=SELECT * FROM power'

```