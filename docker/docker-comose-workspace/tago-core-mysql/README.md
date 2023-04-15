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