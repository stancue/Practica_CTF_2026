#!/bin/bash

# MISIUNEA 16 - "Depozitul umanitar"
# Concept SO: legaturi simbolice (symlink), readlink

set -e
PASS_M17="M17-weather-1f6d"

mkdir -p /srv/humanitarian
echo "$PASS_M17" > /srv/humanitarian/manifest_real.txt
chmod 644 /srv/humanitarian/manifest_real.txt

mkdir -p /home/m16/depot
ln -s /srv/humanitarian/manifest_real.txt /home/m16/depot/shortcut_c
ln -s /home/m16/depot/shortcut_c /home/m16/depot/shortcut_b
ln -s /home/m16/depot/shortcut_b /home/m16/depot/shortcut_a

chown -R m16:m16 /home/m16/depot
chown root:root /srv/humanitarian/manifest_real.txt

cat >> /home/m16/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 16 - Depozitul umanitar ==="
echo "In ~/depot exista scurtaturi (legaturi simbolice) catre manifestul"
echo "real. O scurtatura poate duce la alta scurtatura, nu direct la fisier."
echo "Urmareste lantul pana la capat."
echo ""
EOF

echo "[M16] Parola pentru m17: $PASS_M17 (la capatul lantului de symlink-uri)" >> /opt/solutions/passwords.txt
