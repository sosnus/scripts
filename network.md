netstat -plunt

<!-- sudo apt-get install net-tools -->



# IP
ip a
ip -o link
ip -o addr

# NMAP
nmap -sn 192.168.1.0/24
<!-- nmap -sV 192.168.1.1 -->



### SSH config
```
sudo apt update
sudo apt install openssh-server
sudo apt install ufw
sudo ufw allow 22
sudo ufw reload
# sudo ufw enable
```
### Disable GUI
```
sudo systemctl set-default multi-user
```

### Problem with ufw
```
sudo apt-get install --reinstall iptables
```

### All in one

```
sudo apt-get install --reinstall iptables

sudo ufw enable

sudo ufw status
```

### DHCP Problem
```bash
sudo ip addr flush dev eth01

sudo dhclient -v eth01
```

### SSH Keys for jenkins

# Generate SSH key pair
https://jhooq.com/jenkins-setup-ssh-keys/
```bash
ssh-keygen -t rsa -b 4096 -C "jenkins@example.com" 
docker exec -it name_container /bin/bash
ssh-copy-id -i ~/.ssh/id_rsa.pub user@hostname 

```


ssh-copy-id -i ~/.ssh/id_rsa.pub wtuser@10.10.10.227