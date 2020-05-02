#!/bin/bash
echo "" > /root/RADIUS.txt
/usr/lib/zabbix/externalscripts/radiusmaint.sh >> /root/RADIUS.txt
echo "It worked" | mail -s "RADIUS Completed" jehad.jamalalldeen@dssa.daicel.com -A /root/RADIUS.txt
rm /root/RADIUS.txt
