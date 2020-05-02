#!/bin/bash
/home/jehadjam/Scripts/BDKPortSec/RK2.sh
echo "It worked" | mail -s "RK2 Completed" zabbixalert62@gmail.com -A /home/jehadjam/Scripts/Logs/psec_DSSA2960XRK2.txt
/home/jehadjam/Scripts/BDKPortSec/SCM.sh
echo "It worked" | mail -s "SCM Completed" zabbixalert62@gmail.com -A /home/jehadjam/Scripts/Logs/psec_DSSA2960XSCM.txt
