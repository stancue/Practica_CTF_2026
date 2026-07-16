#!/bin/bash
# ============================================================
# MISIUNEA 04 - "Recensamantul garnizoanei"
# Concept SO: administrare useri, /etc/passwd
# ============================================================
set -e
PASS_M05="M05-suid-8a4d"

#crearea acelor conturi numite cu st
for i in $(seq -w 1 20); do
    useradd -M -s /usr/sbin/nologin "st${i}" 2>/dev/null || true
done
REAL_COUNT=$(cut -d: -f1 /etc/passwd | grep -c '^st')

mkdir -p "/home/m04/garnizoana/${REAL_COUNT}"
echo "$PASS_M05" > "/home/m04/garnizoana/${REAL_COUNT}/cod.txt"
for FAKE in 15 18 22 25; do #directoare false 
    mkdir -p "/home/m04/garnizoana/${FAKE}"
    echo "numar gresit" > "/home/m04/garnizoana/${FAKE}/cod.txt"
done
chown -R m04:m04 /home/m04/garnizoana
chmod 700 /home/m04/garnizoana
find /home/m04/garnizoana -mindepth 1 -maxdepth 1 -type d -exec chmod 700 {} \;
chmod 600 "/home/m04/garnizoana/${REAL_COUNT}/cod.txt"

cat >> /home/m04/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 04 - Recensamantul garnizoanei ==="
echo "In ~/garnizoana exista mai multe directoare, numerotate diferit."
echo "Doar unul corespunde numarului REAL de conturi 'st' din sistem."
echo "Verifica /etc/passwd si numara conturile care incep cu acel prefix."
echo ""
EOF

echo "[M04] Parola pentru m05: $PASS_M05 (garnizoana/${REAL_COUNT}/cod.txt)" >> /opt/solutions/passwords.txt
