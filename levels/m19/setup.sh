#!/bin/bash

# MISIUNEA 19 - "Semnalul intrerupt"
# Concept SO: gestiunea semnalelor (kill -SIGUSR1, trap)

set -e
mkdir -p /opt/procs
cp /opt/levels/m19/relay-m19.sh /opt/procs/relay-m19.sh
chown m19:m19 /opt/procs/relay-m19.sh
chmod 755 /opt/procs/relay-m19.sh

cat >> /home/m19/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 19 - Semnalul intrerupt ==="
echo "Un proces propriu ruleaza in fundal, asteptand semnalul SIGUSR1."
echo "Gaseste procesul, trimite-i semnalul, apoi vezi ce a rezultat."
echo ""
EOF

echo "[M19] Parola pentru m20: M20-history-6a1f (dupa kill -SIGUSR1 catre relay-m19.sh, in ~/unlocked.txt)" >> /opt/solutions/passwords.txt
