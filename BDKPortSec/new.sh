#!/usr/bin/expect -f
set IPaddress "10.9.1.6"
set Username "jjamal"
set Password "Julianna123!@#"
set Directory ~/Scripts/Logs/
log_file -a $Directory/wtf.txt
send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
spawn ssh -c aes256-cbc $Username@$IPaddress
expect "assword: "
send "$Password\r"
expect "*# "
send "conf t\n"
 expect "(config)#"
 send "int range gi1/0/1-18\r"
 expect "(config-if-range)#"
 send "switchport mode access\r"
 expect "(config-if-range)#"
 send "authentication event fail action authorize vlan 914\r"
 expect "(config-if-range)#"
 send "authentication event server dead action authorize vlan 914\r"
 expect "(config-if-range)#"
 send "authentication event server alive action reinitialize\r"
 expect "(config-if-range)#"
 send "authentication host-mode multi-auth\r"
 expect "(config-if-range)#"
 send "authentication port-control auto\r"
 expect "(config-if-range)#"
 send "authentication periodic\r"
 expect "(config-if-range)#"
 send "authentication timer reauthenticate 300\r"
 expect "(config-if-range)#"
 send "mab\r"
 expect "(config-if-range)#"
 send "spanning-tree portfast\r"
 expect "(config-if-range)#"
 send "int range gi1/0/23-29\r"
 expect "(config-if-range)#"
 send "switchport mode access\r"
 expect "(config-if-range)#"
 send "authentication event fail action authorize vlan 914\r"
 expect "(config-if-range)#"
 send "authentication event server dead action authorize vlan 914\r"
 expect "(config-if-range)#"
 send "authentication event server alive action reinitialize\r"
 expect "(config-if-range)#"
 send "authentication host-mode multi-auth\r"
 expect "(config-if-range)#"
 send "authentication port-control auto\r"
 expect "(config-if-range)#"
 send "authentication periodic\r"
 expect "(config-if-range)#"
 send "authentication timer reauthenticate 300\r"
 expect "(config-if-range)#"
 send "mab\r"
 expect "(config-if-range)#"
 send "spanning-tree portfast\r"
 expect "(config-if-range)#"
 send "int gi1/0/31\r"
 expect "(config-if)#"
 send "switchport mode access\r"
 expect "(config-if)#"
 send "authentication event fail action authorize vlan 914\r"
 expect "(config-if)#"
 send "authentication event server dead action authorize vlan 914\r"
 expect "(config-if)#"
 send "authentication event server alive action reinitialize\r"
 expect "(config-if)#"
 send "authentication host-mode multi-auth\r"
 expect "(config-if)#"
 send "authentication port-control auto\r"
 expect "(config-if)#"
 send "authentication periodic\r"
 expect "(config-if)#"
 send "authentication timer reauthenticate 300\r"
 expect "(config-if)#"
 send "mab\r"
 expect "(config-if)#"
 send "spanning-tree portfast\r"
 expect "(config-if)#"
  send "int range gi1/0/33-48\r"
 expect "(config-if-range)#"
 send "switchport mode access\r"
 expect "(config-if-range)#"
 send "authentication event fail action authorize vlan 914\r"
 expect "(config-if-range)#"
 send "authentication event server dead action authorize vlan 914\r"
 expect "(config-if-range)#"
 send "authentication event server alive action reinitialize\r"
 expect "(config-if-range)#"
 send "authentication host-mode multi-auth\r"
 expect "(config-if-range)#"
 send "authentication port-control auto\r"
 expect "(config-if-range)#"
 send "authentication periodic\r"
 expect "(config-if-range)#"
 send "authentication timer reauthenticate 300\r"
 expect "(config-if-range)#"
 send "mab\r"
 expect "(config-if-range)#"
 send "spanning-tree portfast\r"
 expect "(config-if-range)#"
send "int range gi2/0/1-48\r"
 expect "(config-if-range)#"
 send "switchport mode access\r"
 expect "(config-if-range)#"
 send "authentication event fail action authorize vlan 914\r"
 expect "(config-if-range)#"
 send "authentication event server dead action authorize vlan 914\r"
 expect "(config-if-range)#"
 send "authentication event server alive action reinitialize\r"
 expect "(config-if-range)#"
 send "authentication host-mode multi-auth\r"
 expect "(config-if-range)#"
 send "authentication port-control auto\r"
 expect "(config-if-range)#"
 send "authentication periodic\r"
 expect "(config-if-range)#"
 send "authentication timer reauthenticate 300\r"
 expect "(config-if-range)#"
 send "mab\r"
 expect "(config-if-range)#"
 send "spanning-tree portfast\r"
 expect "(config-if-range)#"
 send "end\r"
 sleep 5
 expect "#"
 send "term len 0\r"
 expect "#"
 send "sh auth sess | inc Unauth\r"
 expect "#"
 send "exit\n"
 exit
