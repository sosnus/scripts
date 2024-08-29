# DISK SMART INFO (where X - disk number, for example sda3)
smartctl -a /dev/sdX

# DISKS & MOUNTING POINTS
lsblk -o NAME,SIZE,MOUNTPOINT
lsblk -o NAME,SIZE,MOUNTPOINT,HOTPLUG,LABEL,MODEL,STATE
lsblk



du -sh * | sort -r



# show size of partitions (in bytes)
df -h
# show size of partitions (in GB!!)
df -h
# show size of files inside this and children folders
du -h
# more info (HUGE OUTPUT!)
du -ah

# show size of each folder inside folder where I am
du -sh *

# show size of each folder inside provided path
du -sh /home/recomputer/agroworkspace/*/

# show size of each folder inside folder where I am BUT FOR DIRECTORIES LARER THAN 100kB
find . -type d -exec du -sh {} + | awk '$1 !~ /K/ || $1+0 >= 100 {print $0}'



# THE BEST (add path after '/')
du -cha --max-depth=1 / | grep -E "M|G"
du -cha --max-depth=1 . | grep -E "M|G"
# du -cha --max-depth=1 / | grep -E "M|G" from link below:
https://askubuntu.com/questions/911865/no-more-disk-space-how-can-i-find-what-is-taking-up-the-space/911872#911872


# rm journal files
# https://awhost.pl/baza-wiedzy/usuwanie-logow-journald-z-var-log-journal/
journalctl --disk-usage
journalctl --vacuum-time=2d
journalctl --vacuum-size=50M
journalctl --rotate


ls -lS | head -10



# copy&backup
cp -r ./agrostackdata/* ./agrostackdata-backup/



# Docker
docker system df

docker images --format '{{.Repository}}:{{.Tag}} {{.Size}}'
docker volume ls -q | xargs -I{} docker volume inspect {} --format '{{.Name}}: {{.UsageData.Size}}'


# mounting
sudo umount /<path>
sudo mount /dev/<devname from lsblk> /<path>




dd if=/dev/zero of=emptyfile.bin bs=1M count=10


dd if=/dev/zero of=emptyfile.bin bs=1M count=5000



# xavier chceck storage
df -h /dev/nvme0n1p1 /dev/mmcblk0p1