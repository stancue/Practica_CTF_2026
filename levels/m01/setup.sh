#!/bin/bash
# ============================================================
# MISIUNEA 01 - "Dosarul de inrolare"
# Concept SO: fisiere ascunse (dotfiles), ls -la
# ============================================================
set -e #seteaza erorilein script pt a nu trece neobersevate
PASS_M02="M02-dotless-7f3a"

mkdir -p /home/m01/.access
echo "$PASS_M02" > /home/m01/.access/next_password.txt
chown -R m01:m01 /home/m01/.access #user si group m01
chmod 700 /home/m01/.access #doar m01 are dreptul sa intre in .acces 
chmod 600 /home/m01/.access/next_password.txt

cat >> /home/m01/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 01 - Dosarul de inrolare ==="
echo "Ofiterul anterior ascundea fisierele sensibile. Comanda cheie: ls -la"
echo ""
EOF

echo "[M01] Parola pentru m02: $PASS_M02" >> /opt/solutions/passwords.txt 
#opt/solutions/passwords.txt este un fisier care contine toate parolele pe care le vom salva din parcursul levels
