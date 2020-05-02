#!/bin/bash
/home/jehadjam/Scripts/BDKPortSec/PUMPRM.sh
echo "It worked" | mail -s "RK2 Completed" zabbixalert62@gmail.com -A /home/jehadjam/Scripts/Logs/psec_PUMPRM.txt
/home/jehadjam/Scripts/BDKPortSec/3750RK1.sh
echo "It worked" | mail -s "SCM Completed" zabbixalert62@gmail.com -A /home/jehadjam/Scripts/Logs/psec_3750RK1.txt
