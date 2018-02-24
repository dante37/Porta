#!/bin/bash
i=0
j=0
while true; do
ps -e >> PS.log
sleep 10
((i++))
if [[ $((i%5)) -eq 0 ]] ; then
((j++))
gzip -c PS.log > PS.log$j.gz
echo '' > PS.log
if [[ $j -gt 5 ]] ; then
mv -f PS.log2.gz PS.log1.gz
mv PS.log3.gz PS.log2.gz
mv PS.log4.gz PS.log3.gz
mv PS.log5.gz PS.log4.gz
mv PS.log6.gz PS.log5.gz
((j--))
fi
fi
done
