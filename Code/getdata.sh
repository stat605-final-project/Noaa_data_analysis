#!/bin/bash

id=$1
year=$2
url1="https://docs.google.com/uc?export=download&id="
url2s1="https://docs.google.com/uc?export=download&confirm="
url2s2="&id="

wget -q -nv --load-cookies /tmp/cookies$id.txt $url2s1$(wget --quiet --save-cookies /tmp/cookies$id.txt --keep-session-cookies --no-check-certificate $url1$id -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')$url2s2$id -O "$year"_temp.csv && rm -rf /tmp/cookies$id.txt

cat "$year"_temp.csv | awk -F, '{if ($1 == "USW00094728" && $3 == "TMAX" ) { print $2,$4 }}'>> "$year"_tmax.csv
cat "$year"_temp.csv | awk -F, '{if ($1 == "USW00094728" && $3 == "TMIN" ) { print $2,$4 }}'>> "$year"_tmin.csv
cat "$year"_temp.csv | awk -F, '{if ($1 == "USW00094728" && $3 == "PRCP" ) { print $2,$4 }}'>> "$year"_prcp.csv
 
rm "$year"_temp.csv
