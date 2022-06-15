#!/bin/bash
#######################################################################################
##  Markdown semver number generator for Changelog.md                                ##
##                                                                                   ##
##  ## [1.0.3+20220615(003)] - 2022-06-15 by StaPulawski                             ##
##                                                                                   ##
##  source: https://github.com/sosnus/scripts/blob/master/semver-to-markdown.sh      ##
##                                                                                   ##
#######################################################################################

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

## result sample:
## IN:  bash ./generateVersion.sh -x 0 -y 2 -z 58
## OUT: `## [0.2.58+20220615(058)] - 2022-06-15`

## IN:  bash ./generateVersion.sh -x 1 -y 33 -z 581
## OUT: `## [1.33.581+20220615(581)] - 2022-06-15`
