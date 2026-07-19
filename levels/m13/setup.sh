#!/bin/bash

# MISIUNEA 13 - "Ceasul aeronavei"
# Concept SO: timestamp-uri de fisiere (stat, find -newer)

set -e
PASS_M14="M14-checkpoint-5e7b"

mkdir -p /home/m13/instrumente
cd /home/m13/instrumente

# fisier de referinta - marcheaza momentul ultimului zbor de test
touch -d "2026-06-01 08:00:00" /home/m13/instrumente/.reper_zbor

# 300 de fisiere de configurare vechi (anterioare reperului)
for i in $(seq 1 300); do
    f="cfg_${i}.dat"
    echo "config veche $i" > "$f"
    touch -d "2026-01-01 00:00:00" "$f"
done

# singurul fisier modificat supa reperul de zbor - contine parola
echo "$PASS_M14" > cfg_target.dat
touch -d "2026-06-01 09:30:00" cfg_target.dat

chown -R m13:m13 /home/m13/instrumente
chmod -R 644 /home/m13/instrumente/*
chmod 755 /home/m13/instrumente

cat >> /home/m13/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 13 - Ceasul aeronavei ==="
echo "In ~/instrumente exista un fisier reper (.reper_zbor), care marcheaza"
echo "momentul ultimului zbor de test. Un singur fisier de configurare"
echo "a fost modificat DUPA acest reper."
echo "Compara timestamp-urile fisierelor pentru a-l identifica."
echo ""
EOF

echo "[M13] Parola pentru m14: $PASS_M14 (cfg_target.dat, find -newer)" >> /opt/solutions/passwords.txt
