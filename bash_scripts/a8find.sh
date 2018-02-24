#!/bin/bash
find $1 -type f -name "*\.*" | grep -v ".*/\..*" | rev | cut -d "." -f -1 | rev | sort | uniq -c | awk '{print $2 " - " $1}'
