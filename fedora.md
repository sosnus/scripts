# misc
VSC
Github desktop
Spotify

## Time
```
sudo timedatectl set-timezone Europe/Warsaw
timedatectl status
```



# docker

sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


sudo systemctl start docker
sudo docker run hello-world
