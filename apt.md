# LEGACY
see ./linux/ubuntu/readme.md



# APT
```bash
sudo apt update && sudo apt upgrade
```

## Software

### Python
```bash
sudo apt install python3.8-distutils
python3.8 -m pip --version
python --version
```

### Misc
```bash
sudo apt install jq
sudo apt install openssh-server
sudo apt install ufw
sudo apt install -y mosquitto-clients

```

### Ubuntu monitor service
```bash
sudo apt install htop
sudo apt install jtop
sudo apt install iftop
sudo apt install nload
sudo apt install bmon
```


## Mosquitto problem
```bash
# sudo systemctl stop mosquitto
# sudo systemctl disable mosquitto
# sudo pkill mosquitto
```

## Docker

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Docker Desktop
```bash
sudo apt-get update
sudo apt-get install ./docker-desktop-amd64.deb
```