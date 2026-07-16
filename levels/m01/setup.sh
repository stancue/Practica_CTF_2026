#!/bin/bash
# ============================================================
# MISIUNEA 01 - "Dosarul de inrolare"
# Concept SO: fisiere ascunse (dotfiles), ls -la
# ============================================================
set -e
PASS_M02="M02-dotless-7f3a"

mkdir -p /home/m01/.access
echo "$PASS_M02" > /home/m01/.access/next_password.txt
chown -R m01:m01 /home/m01/.access
chmod 700 /home/m01/.access
chmod 600 /home/m01/.access/next_password.txt

cat >> /home/m01/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 01 - Dosarul de inrolare ==="
echo "Ofiterul anterior ascundea fisierele sensibile. Comanda cheie: ls -la"
echo ""
EOF

echo "[M01] Parola pentru m02: $PASS_M02" >> /opt/solutions/passwords.txt
