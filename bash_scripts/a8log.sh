#!/bin/bash
log=$1
start=$2
end=$3
lt=$(cat $log | awk '{print $1 " " $2 " " $3}')
s=$(( `date -d "$2" +%s` - 18000))
echo "$s"
e=$(( `date -d "$3" +%s` - 14400))
echo "$e"
echo "$lt" | while read line
do
l=$(( `date -d "$line" +%s` - 18000))
echo "$l"
done
