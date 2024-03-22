## Basic commands

### How to see logs from container 
* `docker logs -f nginx-container`

### How to connect to container
* `docker exec -it nginx-container /bin/bash`


### Basic flags
* `-it` - interactive
* `-d` - headless
* `--restart=always` - run after restart



## How to install Lazydocker
```
https://lindevs.com/install-lazydocker-on-ubuntu
```

## How to install Portainer
```
docker volume create portainer_data

docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```

