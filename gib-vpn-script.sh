#!/usr/bin/expect -f

set timeout -1

set username $env(GIB_VPN_USERNAME)
set password $env(GIB_VPN_PASSWORD)
set vpnserver $env(GIB_VPN_SERVER)

spawn openconnect --protocol=gp --os=win --mtu=1300 --csd-wrapper=./hipreport.sh --script=./vpnc-script.sh "$vpnserver"

expect "Enter 'yes' to accept, 'no' to abort; anything else to view:"
send -- "yes\r"

expect "Username:*"
send -- "$username\r"

expect "Password:*"
send -- "$password\r"

expect eof
