#!/bin/bash

# MISIUNEA 15 - "Releul prin satelit"
# Concept SO: rezolutie de nume locala, comentarii in /etc/hosts

set -e
PASS_M16="M16-depot-8c2e"

# Codul de sincronizare e ascuns direct in comentariul liniei din /etc/hosts
echo "10.44.9.2    basemama.sentinel.internal   # sync-code=${PASS_M16}" >> /etc/hosts

cat >> /home/m15/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 15 - Releul prin satelit ==="
echo "Legatura cu baza-mama e definita local pe acest sistem, nu prin"
echo "infrastructura DNS obisnuita. Verifica fisierul care contine"
echo "aceste definitii locale de nume."
echo ""
EOF

echo "[M15] Parola pentru m16: $PASS_M16 (comentariu in /etc/hosts)" >> /opt/solutions/passwords.txt
