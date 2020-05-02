#!/bin/bash
sudo echo "" > /root/bdkRADIUS.txt
/usr/lib/zabbix/externalscripts/bdkradiusmaint.sh >> /root/bdkRADIUS.txt
echo "It worked" | mail -s "BDK RADIUS Completed" jehad.jamalalldeen@dssa.daicel.com -A /root/bdkRADIUS.txt
rm /root/bdkRADIUS.txt
