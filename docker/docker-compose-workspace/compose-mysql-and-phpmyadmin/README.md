# docker-compose.yaml
* phpmyadmin+mariadb10 ogolne

# docker-compose-2.yaml
* phpmyadmin+mariadb10 MIKRUS port

# docker-compose-3.yaml
* phpmyadmin+mysql5.7 izolowana siec

# docker-compose-4.yaml
* phpmyadmin+mysql8.0



## More information
https://hub.docker.com/_/mysql/


# How allow to change db addr?
Use flag: `-e PMA_ARBITRARY=1`
For example:
``` bash
docker run --name myadmin -d -e PMA_ARBITRARY=1 -p 8080:80 phpmyadmin
```
