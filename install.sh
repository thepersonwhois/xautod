#!/usr/bin/env bash
# install.sh — installs xautod system-wide
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "run as root." >&2
    exit 1
fi

cp xautod /usr/local/bin/xautod
cp xrun   /usr/local/bin/xrun
chmod +x /usr/local/bin/xautod /usr/local/bin/xrun

cp xautod.service /etc/systemd/system/xautod.service
systemctl daemon-reload
systemctl enable --now xautod

echo "xautod installed and started."
echo "run with xrun and then your command. i.e: xrun firefox."
