printf "NEW RUN: "
date +'[%Y-%m-%d %H:%M:%S]'

figlet  RPI-MY-RUN.SH


python3 /home/pi/scripts/rpi-scripts/buzz.py
printf "Run by user:" 
# %s\n"
$USER
printf "RUN from path: "
pwd

printf "HOSTNAME: "
hostname

printf "My IP: "
hostname -I


date +'[%Y-%m-%d %H:%M:%S]'

printf "END\n"
