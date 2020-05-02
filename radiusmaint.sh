#!/usr/bin/expect -f
#set timeout 5
# cron weekly?
# @weekly /home/jehadjam/Documents/BashScript/radiusmaint.sh >> /home/jehadjam/Documents/BashScript/RADCleanupCompletion.log
set IPaddress "10.3.0.56"
set Username "administrator"
set Password "SDI.4tw!"
set Directory ~
log_file -a /var/log/radiuscleanup/msaRADIUS.txt
send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
spawn ssh $Username@$IPaddress
expect "administrator@10.3.0.56's password: "
send "$Password\r"
expect "*# "
# Purge binary slave logs older than 3 days
send "mysql -u root -p\r"
expect "*assword: "
send "daloradius\r"
expect "]> "
send "use radius;\r"
expect "]> "
send "PURGE BINARY LOGS BEFORE DATE(NOW() - INTERVAL 2 DAY) + INTERVAL 0 SECOND;\r"
expect "]> "
send "quit\r"
send "cd freeradius-bash-admin-master/\r"
# Erase accounting logs older than 1 month
expect "*# "
send "find /var/log/freeradius/radacct -type f -name \"detail*\" -mtime +3 -delete\r"
# Clean postauth table
expect "*# "
send "./radius-clean radpostauth\r"
#sleep 7
#set timeout -1
expect "*# "
send "exit\r"
send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
exit
