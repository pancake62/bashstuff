#!/usr/bin/expect -f
#set timeout 20
set IPaddress "10.9.253.250"
set Username "admin"
set Password "PoNSfgF8"
#set Directory /etc/zabbix/trigerlogs/
#log_file -a $Directory/Recovery_$IPaddress.log
#send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
spawn ssh -o "StrictHostKeyChecking no" $Username@$IPaddress
expect "*assword: "
send "$Password\r"
expect "#"
send "get system status\r"
expect "#"
send "config system interface\r"
expect "*(interface) #"
send "edit Tamerlane\r"
expect "*(Tamerlane) #"
send "set status down\r"
expect "*(Tamerlane) #"
send "next\r"
expect "*(interface) #"
send "end\r"
sleep 5
expect "#"
send "config system interface\r"
expect "*(interface) #"
send "edit Tamerlane\r"
expect "*(Tamerlane) #"
send "set status up\r"
expect "*(Tamerlane) #"
send "next\r"
expect "*(interface) #"
send "end\r"
exit
