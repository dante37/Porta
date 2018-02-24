#!/bin/bash
size=$1
ps -e -o pid= -o rss= -o cmd= --sort -rss | awk '$2 > `$size` {print $1 " " $2 " " $3}' | kill -15 $(awk '{print $1}')