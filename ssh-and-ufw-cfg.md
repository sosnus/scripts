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