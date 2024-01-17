#!/bin/sh

tun=`netstat -rn | grep 172.25.27 | head -n 1 | awk '{ print $4 }'`

if [[ -z tun ]]; then
    echo "Jumbo tunnel not found"
else
    sudo route add 172.25.27.161/32 -interface $tun
    sudo route add 172.25.27.162/32 -interface $tun
fi
