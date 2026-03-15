#!/bin/bash
# kodi-setup-autoplay.sh
# one-time setup: create autostart, remove old playlist, generate new, play in Kodi
# improved: echo steps, show playlist content

# for d in /var/media/*/; do
#     USB_PATH="${d}video-autoplay"
#     break
# done

USB_PATH="$(ls -d /var/media/*/ | head -n 1)video-autoplay"
PLAYLIST_PATH="/storage/autoplay.m3u"
AUTOSTART_PATH="/storage/.config/autostart.sh"

echo "Step 1: Ensure /storage/.config exists..."
mkdir -p /storage/.config
echo "Done."

echo "Step 2: Creating autostart.sh..."
cat > "$AUTOSTART_PATH" << EOF
#!/bin/bash
# autostart Kodi playlist from USB
sleep 1
echo "Autostart: removing old playlist..."
rm -f "$PLAYLIST_PATH"
echo "Autostart: generating new playlist from USB folder..."
find "$USB_PATH" -name "*.mp4" > "$PLAYLIST_PATH"
echo "Autostart: starting Kodi playback..."
kodi-send --action="PlayMedia($PLAYLIST_PATH)"
EOF
chmod +x "$AUTOSTART_PATH"
echo "autostart.sh created at $AUTOSTART_PATH"

echo "Step 3: Removing old playlist (if exists)..."
rm -f "$PLAYLIST_PATH"
echo "Done."

echo "Step 4: Generating fresh playlist..."
# build a temporary list of movies then repeat the entire list 100 times
{
  tmp=$(mktemp)
  find "$USB_PATH" -name "*.mp4" > "$tmp"
  for i in $(seq 1 3); do
    cat "$tmp"
  done
  rm -f "$tmp"
} > "$PLAYLIST_PATH"
echo "Playlist generated with the whole list repeated 3 times."
echo "Playlist created at $PLAYLIST_PATH"


echo "Step 5: Creating autostart.sh..."
cat > "$AUTOSTART_PATH" << EOF
(
sleep 20
kodi-send --action="PlayMedia(/storage/autoplay.m3u)"
sleep 2
kodi-send --action="PlayerControl(RepeatAll)"
) &

EOF
chmod +x "$AUTOSTART_PATH"
echo "autostart.sh created."

echo "Step 6: Showing playlist content:"
cat "$PLAYLIST_PATH"
echo "Setup complete! Autostart configured for next reboot."
