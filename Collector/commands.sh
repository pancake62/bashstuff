#!/usr/bin/expect -f
set timeout 20
set IPaddress [lindex $argv 0]
set Username "jjamal"
set Password "Julianna123!@#"
set Directory ~/Scripts/Logs
log_file -a $Directory/BDKLogChange_$IPaddress.log
send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
spawn ssh -o "StrictHostKeyChecking no" -c aes256-cbc $Username@$IPaddress
expect "*assword: "
send "$Password\r"
expect "#"
send "conf t\r"
expect "(config)#"
send "no mab logging verbose\r"
expect "(config)#"
send "no  dot1x logging verbose\r"
expect "(config)#"
send "end\r"
expect "#"
send "wr\r"
expect "#"
#sleep 1
send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
exit
