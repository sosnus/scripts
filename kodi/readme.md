# how to use kodi autoplay in libre elec 11.0.6



## Files location

* refresh script:
  * `/storage/backup/refresh.sh`
* autostart script location:
  * `/storage/.config/autostart.sh`
* playlist script:
  * `/storage/autoplay.m3u`

## generate playlist

```bash
# remove old playlist
rm /storage/autoplay.m3u
# create new playlist based on dir with videos
find /var/media/sdb1-usb-Generic\_Flash\_Di/video-autoplay -name "\*.mp4" > /storage/autoplay.m3u
# test
echo "TEST"
cat /storage/autoplay.m3u
echo "END of playlist"
```

## Test

```bash
kodi-send --action="PlayMedia(/storage/autoplay.m3u)"
```



## autostart

create:

```bash
nano /storage/.config/autostart.sh
```

content:

```bash
(
sleep 25
kodi-send --action="PlayMedia(/storage/autoplay.m3u)"
) \&

```

