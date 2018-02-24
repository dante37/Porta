#!/bin/bash

echo "Statistics for $1 interface:"
echo -n "$(date '+%b %d %T') " | tee net.log
ip -s link | grep -E -A 5 $1 | awk '$1 !~ /:/ {print}' | awk '$1 ~ /[0-9]+/ {print $1}' | awk '{if (NR==1) {print "received " $1 " bytes"} else {print "transmited " $1 " bytes"}}' | xargs | tee -a net.log
while true; do
sleep 10
r=$(awk 'END{print $5}' net.log)
t=$(awk 'END{print $8}' net.log)
echo -n "$(date '+%b %d %T') " | tee -a net.log
ip -s link | grep -E -A 5 $1 | awk '$1 !~ /:/ {print}' | awk '$1 ~ /[0-9]+/ {print $1}' | awk '{if (NR==1) {print "received " $1 " bytes"} else {print "transmited " $1 " bytes "}}' | xargs echo -n | tee -a net.log | awk -v r="$r" -v t="$t" '{ rdelta = $2 - r ; tdelta = $5 - t ; print " delta RX +" rdelta " delta TX +" tdelta}' | xargs echo "" | tee -a net.log 
done
