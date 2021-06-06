#!/bin/bash

curl -s wttr.in/$1?format=j1 > /tmp/wttr.json

T=$(cat /tmp/wttr.json | jq '.current_condition[].temp_C')
H=$(cat /tmp/wttr.json | jq '.current_condition[].humidity')

echo Temperature in $1: $T
echo Humidity in $1: $H
