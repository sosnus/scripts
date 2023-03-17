#MySQL CLI

## INSTALL
```
sudo apt install mysql-client-core-8.0
```

## RUN CLI
```
mysql -h 127.0.0.1 -P 3306 -u root -p
# (and add password in next line, not here!!!!!)
```

## Basic commands
```
SHOW databases;

USE database_name;

SHOW tables;
```

## Check if DB engine working:
```
telnet 127.0.0.1 3306
```

## Create user in CLI
```
mysql -h 127.0.0.1 -P 3306 -u root -p

CREATE DATABASE test;
CREATE USER 'spowner'@'%' IDENTIFIED BY '1234'; 
GRANT ALL PRIVILEGES ON test.* To 'spowner'@'%'; 
FLUSH PRIVILEGES;

# THEN
mysql -h 127.0.0.1 test -P 3306 -u spowner -p
```
