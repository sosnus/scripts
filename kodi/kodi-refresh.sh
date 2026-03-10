#!/bin/bash
# kodi-setup-autoplay.sh
# one-time setup: create autostart, remove old playlist, generate new, play in Kodi

# 1️⃣ create .config folder if not exists
mkdir -p /storage/.config

# 2️⃣ create autostart.sh
cat > /storage/.config/autostart.sh << 'EOF'
#!/bin/bash
# autostart Kodi playlist from USB
sleep 25

# remove old playlist
rm -f /storage/autoplay.m3u

# generate new playlist from USB folder
find /var/media/sdb1-usb-Generic_Flash_Di/autoplay -name "*.mp4" > /storage/autoplay.m3u

# play playlist in Kodi
kodi-send --action="PlayMedia(/storage/autoplay.m3u)"
EOF

# 3️⃣ make autostart.sh executable
chmod +x /storage/.config/autostart.sh

# 4️⃣ remove old playlist just in case
rm -f /storage/autoplay.m3u

# 5️⃣ generate fresh playlist now
find /var/media/sdb1-usb-Generic_Flash_Di/autoplay -name "*.mp4" > /storage/autoplay.m3u

# 6️⃣ play playlist immediately
kodi-send --action="PlayMedia(/storage/autoplay.m3u)"

echo "Autostart configured, playlist refreshed and playing now."
