!#/bin/bash
FILE UNDER CONSTRUCTION!!!!

printf "more info: https://www.thethingsnetwork.org/docs/network/cli/quick-start.html "
wget  https://ttnreleases.blob.core.windows.net/release/master/ttnctl-linux-amd64.zip
#wget https://ttnreleases.blob.core.windows.net/release/master/ttnctl-linux-arm.tar.gz
tar xvzf ttnctl-linux-arm.tar.gz
mv ttnctl-linux-arm /bin/ttnctl

printf "ttnctl download, unzipped, renamed and moved to /bin"


!#/bin/bash
printf "more info: https://www.thethingsnetwork.org/docs/network/cli/quick-start.html \n"
filelink = "https://ttnreleases.blob.core.windows.net/release/master/"
filename="ttnctl-linux-"
string=arch
if [[ $string == "arm"* ]]; then
  echo "It's there!"
  $filename = $filename + "arm"
fi

$filename = $filename + ".tar.gz"

printf $filename

$filelink = $filelink + $filename

#wget  https://ttnreleases.blob.core.windows.net/release/master/ttnctl-linux-amd64.zip
#wget https://ttnreleases.blob.core.windows.net/release/master/ttnctl-linux-arm.tar.gz
tar xvzf $filename
mv ttnctl-linux-arm /bin/ttnctl

printf "ttnctl download, unzipped, renamed and moved to /bin"
