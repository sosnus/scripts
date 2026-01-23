#!/bin/bash
set -e

echo "=== LXDE minimal install on Debian ==="

# Sprawdzenie uprawnień
if [ "$EUID" -ne 0 ]; then
  echo "Run as root (sudo ./install-lxde.sh)"
  exit 1
fi

echo "[1/7] Update system"
apt update
apt upgrade -y

echo "[2/7] Install Xorg + LXDE (minimal)"
apt install -y --no-install-recommends \
xorg lxde-core lxterminal \
lightdm network-manager

echo "[3/7] Optional file manager + browser"
apt install -y \
pcmanfm firefox-esr || true

echo "[4/7] Enable services"
systemctl enable lightdm
systemctl enable NetworkManager

echo "[5/7] Cleanup"
apt purge -y \
xscreensaver modemmanager avahi-daemon || true

apt autoremove -y
apt clean

echo "[6/7] Set graphical target"
systemctl set-default graphical.target

echo "[7/7] Done"
echo "Reboot to start LXDE"

exit 0
