#!/bin/bash
echo "download, unpack and install ttnctl on platform linux-amd64"
wget -qO- "https://ttnreleases.blob.core.windows.net/release/master/ttnctl-linux-amd64.tar.gz" | tar xvz -C ./
mv ./ttnctl-linux-amd64 /bin/ttnctl
chmod +x /bin/ttnctl
