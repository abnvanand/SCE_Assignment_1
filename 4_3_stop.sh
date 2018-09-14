#!/bin/bash
if (( $EUID != 0 ))
then
    printf "\nRun with root privilege (example 'sudo ./script.sh')\n"
    exit 1
fi

pkill openvpn \
&& sed -i '1d' /etc/resolv.conf \
&& echo "VPN stopped" \
&& rm up.txt temp.ovpn
