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


