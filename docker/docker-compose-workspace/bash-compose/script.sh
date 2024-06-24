#!/bin/bash
while true; do
    echo send ping jetson-200
    curl https://mws02-50458.wykr.es/api/push/UmpHntf4h4?status=up&msg=OK&ping=
    sleep 60
done