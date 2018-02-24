#!/bin/bash
file=$(basename "$1" | cut -d. -f1)
touch /etc/logrotate.d/$file
echo "$1 {" > /etc/logrotate.d/$file
echo "size=1M" >> /etc/logrotate.d/$file
echo "rotate 5" >> /etc/logrotate.d/$file
echo "missingok" >> /etc/logrotate.d/$file
echo "compress" >> /etc/logrotate.d/$file
echo "nomail" >> /etc/logrotate.d/$file
echo "}" >> /etc/logrotate.d/$file
crontab -l | { cat; echo "*/2 * * * * /usr/sbin/logrotate -f /etc/logrotate.d/$file"; } | crontab -
