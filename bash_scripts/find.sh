#!/bin/bash
if [[ $1 == "--mac" && "$#" -ne 2 ]] ; then
echo "Error: path argument expected"
exit 3
fi
if [[ $1 == "--mac" && "$#" -eq 2 ]] ; then
path=$2
mac=$1
else 
path=$1
mac=$2
fi
echo "Searching IP:"
echo "filename: line number: search result"
find $path -type f -exec sh -c "file {} | grep text >/dev/null" \; -print | xargs grep -HonE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | tee IP.log
if [[ $mac == "--mac" ]] ; then
echo "Searching MAC:"
echo "filename: line number: search result"
find $path -type f -exec sh -c "file {} | grep text >/dev/null" \; -print | xargs grep -HonE "([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}" | tee MAC.log
fi
