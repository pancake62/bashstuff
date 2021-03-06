#!/usr/bin/expect -f
 set timeout 60
# Set variables
 set hostname "10.9.1.5"
 set username "jjamal"
 set password "cirrus"
 set enablepassword "PoNSfgF8"

# Log results
#set Directory ~/Scripts/Logs/
#log_file -a $Directory/DSSA2960XGRDSHKPortSec.txt

# Announce which device we are working on and at what time
 send_user "\n"
 send_user ">>>>>  Working on $hostname @ [exec date] <<<<<\n"
 sleep 2
 send_user "\n"

# Don't check keys
 spawn ssh -o StrictHostKeyChecking=no $username\@$hostname

# Allow this script to handle ssh connection issues
 expect {
 timeout { send_user "\nTimeout Exceeded - Check Host\n"; exit 1 }
 eof { send_user "\nSSH Connection To $hostname Failed\n"; exit 1 }
 "*#" {}
 "*assword:" {
 send "$password\n"
 }
 }

# If we're not already in enable mode, get us there
 expect {
 default { send_user "\nEnable Mode Failed - Check Password\n"; exit 1 }
 "*#" {}
 "*>" {
 send "enable\n"
 expect "*assword"
 send "$enablepassword\n"
 expect "*#"
 }
 }

# Let's go to configure mode
# send "conf t\n"
# expect "(config)#"
# send "int range gi1/0/1-24\r"
# expect "(config-if-range)#"
# send "switchport mode access\r"
# expect "(config-if-range)#"
# send "switchport port-security aging time 2\r"
# expect "(config-if-range)#"
# send "authentication event fail action authorize vlan 1\r"
# expect "(config-if-range)#"
# send "authentication event server dead action authorize vlan 1\r"
# expect "(config-if-range)#"
# send "authentication event server alive action reinitialize\r"
# expect "(config-if-range)#"
# send "authentication host-mode multi-auth\r"
# expect "(config-if-range)#"
# send "authentication port-control auto\r"
# expect "(config-if-range)#"
# send "authentication periodic\r"
# expect "(config-if-range)#"
# send "authentication timer reauthenticate 300\r"
# expect "(config-if-range)#"
# send "mab\r"
# expect "(config-if-range)#"
# send "spanning-tree portfast\r"
# expect "(config-if-range)#"
# send "end\r"
# sleep 5
# expect "#"
# send "term len 0\r"
# expect "#"
# send "sh auth sess | inc Unauth\r"
# expect "#"
 send "exit\n"
 exit
