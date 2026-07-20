#!/bin/bash
# MISIUNEA 20 - "Jurnalul echipei precedente"
# Concept SO: istoricul comenzilor (bash_history)

set -e
PASS_M21="M21-disk-2d8b"

HIST=/home/m20/.bash_history
cat > "$HIST" << EOF
cd /var/log
ls -la
df -h
ping -c 2 basemama.sentinel.internal
echo "verificare rutina" > /tmp/check.log
tail -n 20 /var/log/syslog
echo "backup note: cod urmator ${PASS_M21}" >> /tmp/evac_notes.txt
rm -f /tmp/check.log
history -c
EOF
chown m20:m20 "$HIST"
chmod 600 "$HIST"

cat >> /home/m20/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 20 - Jurnalul echipei precedente ==="
echo "Echipa anterioara a plecat in graba, lasand urme neintentionate"
echo "in istoricul comenzilor executate pe acest cont."
echo ""
EOF

echo "[M20] Parola pentru m21: $PASS_M21 (in ~/.bash_history, linie evac_notes)" >> /opt/solutions/passwords.txt
