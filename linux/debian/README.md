# Disable GUI
systemctl get-default



sudo systemctl set-default multi-user.target


sudo reboot


sudo systemctl set-default graphical.target

sudo systemctl start gdm  # Replace `gdm` with your display manager if different, e.g., `lightdm`, `sddm`.


## Disable sleep
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

sudo systemctl daemon-reexec


<!-- sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target -->


## Misc

```
apt install --no-install-recommends xorg lxde-core lightdm network-manager
reboot



apt update
apt upgrade -y


apt install --no-install-recommends \
xorg lxde-core lxterminal \
lightdm network-manager


systemctl enable lightdm
systemctl enable NetworkManager

apt install pcmanfm firefox-esr

# apt install --no-install-recommends xorg lxde-core lightdm network-manager
# reboot
```
