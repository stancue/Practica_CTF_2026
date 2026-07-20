#!/bin/bash

# MISIUNEA 21 - "Spatiul de stocare limitat"
# Concept SO: du vs ls -la (dimensiune aparenta vs blocuri reale, fisiere sparse)

set -e
PASS_M22="M22-relayfinal-7f4a"

mkdir -p /home/m21/disc
# fisier "sparse" - ls -la arata 5GB, dar ocupa aproape 0 blocuri reale.
# e ca o distragere, nu contine nimic relevant.
truncate -s 5G /home/m21/disc/backup_mare.img

# fisierul real, mic, usor de ignorat pentru ca pare "neinteresant" :)
mkdir -p /home/m21/disc/.svc
echo "$PASS_M22" > /home/m21/disc/.svc/gen_pass.txt

chown -R m21:m21 /home/m21/disc
chmod 644 /home/m21/disc/backup_mare.img
chmod 700 /home/m21/disc/.svc
chmod 600 /home/m21/disc/.svc/gen_pass.txt

cat >> /home/m21/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 21 - Spatiul de stocare limitat ==="
echo "In ~/disc exista un fisier care pare urias, dar dimensiunea"
echo "aparenta nu reflecta neaparat spatiul ocupat real pe disc."
echo "Investigheaza continutul directorului mai atent."
echo ""
EOF

echo "[M21] Parola pentru m22: $PASS_M22 (disc/.svc/gen_pass.txt, dupa 'du' vs 'ls -la')" >> /opt/solutions/passwords.txt
