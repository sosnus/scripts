!#/bin/bash
printf "more info: https://www.thethingsnetwork.org/docs/network/cli/quick-start.html "
wget  https://ttnreleases.blob.core.windows.net/release/master/ttnctl-linux-amd64.zip
#wget https://ttnreleases.blob.core.windows.net/release/master/ttnctl-linux-arm.tar.gz
tar xvzf ttnctl-linux-arm.tar.gz
mv ttnctl-linux-arm /bin/ttnctl

printf "ttnctl download, unzipped, renamed and moved to /bin"
