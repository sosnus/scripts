#!/bin/bash 
while getopts x:y:z: flag
do
    case "${flag}" in
        x) X=${OPTARG};;
        y) Y=${OPTARG};;
        z) Z=${OPTARG};;
    esac
done         
DATE1=`date +"%Y%m%d"`
DATE2=`date +"%Y-%m-%d"`
CNT=${#Z}
case $CNT in
  "1") ZZ=$"00"$Z ;;
  "2") ZZ=$"0"$Z ;;
  "3") ZZ=$Z ;;
  *) echo "ERR" ;;
esac
echo '## ['$X.$Y.$Z'+'$DATE1'('$ZZ')] - '$DATE2
