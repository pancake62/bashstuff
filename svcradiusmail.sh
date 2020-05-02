#!/bin/bash
echo "" > /root/svcRADIUS.txt
/usr/lib/zabbix/externalscripts/svcradiusmaint.sh >> /root/svcRADIUS.txt
echo "It worked" | mail -s "RADIUS Completed" jehad.jamalalldeen@dssa.daicel.com -A /root/svcRADIUS.txt
rm /root/svcRADIUS.txt
