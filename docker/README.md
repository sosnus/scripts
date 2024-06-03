## Basic commands

### How to see logs from container 
* `docker logs -f nginx-container`

### How to connect to container
* `docker exec -it nginx-container /bin/bash`

### Remove contaienr
```
docker stop nginx-container
```

### Run compose in background
```
docker-compose up -d
```



### Basic flags
* `-it` - interactive
* `-d` - headless
* `--restart=always` - run after restart



## How to install Lazydocker
```
https://lindevs.com/install-lazydocker-on-ubuntu
```

## How to install Dockge
```
# Create directories that store your stacks and stores Dockge's stack
mkdir -p /opt/stacks /opt/dockge
cd /opt/dockge

# Download the compose.yaml
curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output compose.yaml

# Start the server
docker compose up -d

# If you are using docker-compose V1 or Podman
# docker-compose up -d
```


## How to install Portainer
first of all, create volume
``` bash
docker volume create portainer_data
```
without http
``` bash
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```
with http
```bash
docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
```
restart
``` bash
docker restart portainer
```

