#!/bin/bash
query="$(curl -s wttr.in/$1?format=j1)"
temp="$(echo $query | jq -r '.current_condition[0].temp_C')"
humidity="$(echo $query | jq -r '.current_condition[0].humidity')"
city="$(echo $query | jq -r '.nearest_area[0].areaName[0].value')"
[ -z $1 ] && city=$city || city=$1
[ "$temp" -gt "0" ] && temp="+$temp" || temp=$temp
echo "$city temp $temp  C humidity $humidity%"
