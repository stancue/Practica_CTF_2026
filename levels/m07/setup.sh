#!/bin/bash
# ============================================================
# MISIUNEA 07 - "Rondul de noapte"
# Concept SO: cron, /etc/cron.d
# ============================================================
set -e
mkdir -p /opt/procs
cp /opt/levels/m07/cron-m08.sh /opt/procs/cron-m08.sh
chown m08:m08 /opt/procs/cron-m08.sh
chmod 755 /opt/procs/cron-m08.sh

touch /var/log/m08-rond.log
chown m08:m08 /var/log/m08-rond.log
chmod 644 /var/log/m08-rond.log

cat > /etc/cron.d/m08job << 'EOF'
* * * * * m08 /opt/procs/cron-m08.sh
EOF
chmod 644 /etc/cron.d/m08job

cat >> /home/m07/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 07 - Rondul de noapte ==="
echo "Undeva pe sistem exista o sarcina programata, care se repeta"
echo "la intervale fixe si scrie starea perimetrului intr-un jurnal."
echo "Descopera sarcina, apoi verifica ce a scris."
echo "Un mecanism de programare a sarcinilor (cron) ruleaza ceva periodic"
echo "pe acest sistem, scriind starea perimetrului intr-un jurnal."
echo "Cauta joburile cron configurate."
echo ""
EOF

echo "[M07] Parola pentru m08: M08-corridor-1d8b (din /var/log/m08-rond.log)" >> /opt/solutions/passwords.txt
