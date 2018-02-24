#!/bin/bash
date
if [[ -f $1 ]] ; then
hosts=$1
else
echo -e "google.com\nyahoo.com" > hosts
hosts="./hosts"
fi
if [[ $# -eq 3 ]] ; then
num=$2
int=$3
else
num=3
int=1
fi
cat $hosts | while read host
do
echo -n "$host - "
ping $host -c $num -i $int | grep -oE "[0-9]+% packet loss"
done
