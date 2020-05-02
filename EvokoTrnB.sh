#!/usr/bin/expect -f
#set timeout 20
set IPaddress "10.3.128.254"
set Username "jjamal"
set Password "Julianna123!@#"
#set Directory /etc/zabbix/trigerlogs/
#log_file -a $Directory/Recovery_$IPaddress.log
#send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
spawn ssh -o "StrictHostKeyChecking no" -c "aes256-cbc" $Username@$IPaddress
expect "*assword: "
send "$Password\r"
expect "#"
send "term len 0\r"
expect "#"
send "conf t\r"
expect "(config)#"
send "int gi6/4\r"
expect "(config-if)#"
send "sh\r"
expect "(config-if)#"
sleep 2
send "no sh\r"
expect "(config-if)#"
send "end\r"
sleep 2
send "end\r"
exit
