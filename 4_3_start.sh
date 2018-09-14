#!/bin/bash
if (( $EUID != 0 ))
then
    printf "\nRun with root privilege (example 'sudo ./script.sh')\n"
    exit 1
fi

echo -n "Enter username: "
read user
echo -n "Enter password: "
read -s pass

echo "$user" > up.txt
echo "$pass" >> up.txt

curl --user ${user}:${pass} -o temp.ovpn https://vpn.iiit.ac.in/secure/ubuntu.ovpn \
&& openvpn --config temp.ovpn --auth-user-pass up.txt --daemon \
&& sed -i '1i nameserver 10.4.20.204' /etc/resolv.conf \
&& echo "VPN Started"
