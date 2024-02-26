#!/bin/sh

# Get environment variables
LISTEN_PORT="${LISTEN_PORT:-3389}"
DESTINATION_IP="${DESTINATION_IP:-127.0.0.1}"
DESTINATION_PORT="${DESTINATION_PORT:-3389}"

# Enable IP forwarding (if not already enabled)
echo 1 > /proc/sys/net/ipv4/ip_forward

# Set up iptables rule to forward traffic from LISTEN_PORT to DESTINATION_IP:DESTINATION_PORT
iptables -t nat -A PREROUTING -p tcp --dport "$LISTEN_PORT" -j DNAT --to-destination "$DESTINATION_IP":"$DESTINATION_PORT"
iptables -t nat -A POSTROUTING -j MASQUERADE