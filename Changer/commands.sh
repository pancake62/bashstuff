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
send "no snmp-server host 10.3.0.33 version 2c sdiread\r"
expect "(config)#"
send "snmp-server host 10.3.0.65 version 2c sdiread\r"
expect "(config)#"
send "end\r"
expect "#"
send "wr\r"
expect "#"
#sleep 1
send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
exit
