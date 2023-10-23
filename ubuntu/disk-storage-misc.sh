# DISK SMART INFO (where X - disk number, for example sda3)
smartctl -a /dev/sdX

# show size of partitions
df -h
# show size of files inside this and children folders
du -h
# more info (HUGE OUTPUT!)
du -ah

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
du -sh * | sort -r
