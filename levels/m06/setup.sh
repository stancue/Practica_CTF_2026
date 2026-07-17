#!/bin/bash
# ============================================================
# MISIUNEA 06 - "Radarul care nu doarme niciodata"
# Concept SO: inspectie procese (ps, /proc/pid/cmdline)
# ============================================================
set -e
PASS_M07="M07-cron-5f9a"

mkdir -p /opt/procs
cp /opt/levels/m06/radar-daemon.sh /opt/procs/radar-daemon.sh
chmod 755 /opt/procs/radar-daemon.sh
echo "$PASS_M07" > /opt/procs/.m07_token

cat >> /home/m06/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 06 - Radarul care nu doarme niciodata ==="
echo "Un proces al lui m07 ruleaza neintrerupt in sistem, de multa vreme."
echo "Codul de sincronizare e vizibil in modul in care a fost pornit."
echo "Inspecteaza procesele active de pe sistem."
echo ""
EOF

echo "[M06] Parola pentru m07: $PASS_M07 (in argv-ul radar-daemon.sh)" >> /opt/solutions/passwords.txt
