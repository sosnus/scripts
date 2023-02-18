# scripts ( old name: cfg-wsl) (aka old wsl-sosnus-support)

## merged rpi-scripts into this repo
## FAQ

The WSL optional component is not enabled. Please enable it and try again.
See https://aka.ms/wslinstall for details.
Error: 0x8007007e
Press any key to continue...

PowerShell as Admin
```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Also:

`DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V`
`bcdedit /set hypervisorlaunchtype auto`

https://github.com/microsoft/WSL/issues/5363#issuecomment-640337948



## install-misc.sh contains:
* sl
* git (and config)
* fetchscreen
* tmux
* figlet

## TODO:
* add parameters
* add remmina or other RDP
* clean azure folder
* add turbo-config-scripts
* full-compatible Ubuntu-Debian-Raspbian
* better python config
* new installer logger (like start.sh)
* turbo config (on start select packages and programs)
