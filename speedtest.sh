#!/bin/bash

speedtest-cli --bytes --csv > log.csv

ROOM="Blueroom"
DL=$(tail -n 1 log.csv | cut -d"," -f7)
UL=$(tail -n log.csv | cut -d"," -f8)

// to Webhook in IFTTT
curl -X POST -H "Content-Type: application/json" \
  -d '{"value1":"'$ROOM'","value2":"'$DL'","value3":"'$UL'"}' \
  https://maker.ifttt.com/<trigger>
