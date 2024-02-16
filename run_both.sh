#!/bin/bash

# Run forwarding_script.sh in the background
./forwarding_script.sh &

# Run gib-vpn-script.sh in the background, redirecting its output to the shell
./gib-vpn-script.sh > >(cat)

# Wait for both scripts to finish
wait
