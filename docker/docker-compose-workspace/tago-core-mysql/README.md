# MYSQL settiings
If MySQL connection not working, try execute this in MySQL:
```
ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY 'my_secret_password';

flush privileges;
```

new databases:
tcore
tcore_devices



try: `https://stackoverflow.com/a/69906588/15613481`
services:
  mysql57:
    image: mysql:5.7
    command: mysqld --performance_schema=off



# Tago CORE

## Tago CORE API TEST

### SAVE
```
curl --request POST \
  --url http://srv12.mikr.us:40154/data \
  --header 'Content-Type: application/json' \
  --header 'device-token: 47189527-2f99-46b6-a4d5-77457feefab3' \
  --data '[{"variable":"teperature", "value":"21"}]'
```

### READ
```
curl --request GET \
  --url http://srv12.mikr.us:40154/data \
  --header 'Content-Type: application/json' \
  --header 'device-token: 47189527-2f99-46b6-a4d5-77457feefab3'
```
