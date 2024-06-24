#!/bin/bash
    # echo "Current time: $(date +'%Y-%m-%d %H:%M:%S %Z %z')"
while true; do
    echo -n "[$(date +'%Y-%m-%d %H:%M:%S')]  "
    echo -n "send ping jetson-200... "
    curl https://mws02-50458.wykr.es/api/push/UmpHntf4h4?status=up&msg=OK&ping=
    echo " "
    sleep 60

done