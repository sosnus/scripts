# DISK SMART INFO (where X - disk number, for example sda3)
smartctl -a /dev/sdX

# DISKS & MOUNTING POINTS
lsblk -o NAME,SIZE,MOUNTPOINT
lsblk -o NAME,SIZE,MOUNTPOINT,HOTPLUG,LABEL,MODEL,STATE
lsblk



du -sh * | sort -r

### size du important command to chceck largest
du -ah . | sort -rh | head -n 20

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



Domyślnie, montowanie dysku w systemie Linux jest tymczasowe i po restarcie systemu nie zostanie ono automatycznie przywrócone, chyba że skonfigurujesz je w taki sposób, by montowało się automatycznie.

### Jak ustawić automatyczne montowanie po restarcie?

Aby dysk był montowany automatycznie po każdym restarcie, musisz dodać wpis do pliku `/etc/fstab`, który definiuje systemy plików, które mają być montowane podczas rozruchu.

#### Krok 1: Sprawdź UUID dysku

Najpierw sprawdź UUID swojego dysku, co umożliwi trwałe odniesienie do niego, nawet jeśli zmieni się nazwa urządzenia.

```bash
blkid
```

Lub

```bash
lsblk -o UUID,NAME,FSTYPE,MOUNTPOINT
```

#### Krok 2: Dodaj wpis do `/etc/fstab`

Edytuj plik `/etc/fstab` i dodaj nowy wpis dla dysku:

```bash
sudo nano /etc/fstab
```

Dodaj linię w formacie:

```bash
UUID=YOUR_UUID /ścieżka/montowania typ_systemu_plików defaults 0 2
```

**Przykład:**

```bash
UUID=1234-ABCD /home/recomputer/agroworkspace/agrostackdata ext4 defaults 0 2
```

- **UUID=1234-ABCD**: Zastąp UUID swoim UUID.
- **/home/recomputer/agroworkspace/agrostackdata**: Zastąp tą ścieżką docelową montowania.
- **ext4**: Zastąp tym właściwy system plików.

#### Krok 3: Przetestuj montowanie

Po zapisaniu pliku `/etc/fstab`, przetestuj montowanie:

```bash
sudo mount -a
```

Jeśli nie pojawiły się żadne błędy, montowanie powinno działać poprawnie i przetrwać restart systemu.

### Podsumowanie
- **Domyślnie** montowanie jest tymczasowe.
- **Aby było trwałe**, dodaj wpis do pliku `/etc/fstab`.
- **Testowanie**: Użyj `sudo mount -a`, aby sprawdzić, czy konfiguracja działa.