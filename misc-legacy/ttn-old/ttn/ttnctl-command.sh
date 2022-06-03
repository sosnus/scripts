# LOGIN
accesscode = <paste temporary code from https://account.thethingsnetwork.org/>
./ttnctl user login $accesscode

# CREATE APP
appId=sms-app-consoletest1
appDesc=Test-konsoli-ttnctl
./ttnctl applications add $appId $appDesc

# REGISTER DEVICE
deviceId=testowy-czujnik
./ttnctl applications select sms-application
./ttnctl devices register $deviceId
./ttnctl devices info $deviceId
