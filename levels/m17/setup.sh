#!/bin/bash

# MISIUNEA 17 - "Statia meteo de coasta"
# Concept SO: procesare de date (awk, sort, uniq -c)

set -e
PASS_M18="M18-archive-4b7a"

CSV=/home/m17/citiri_meteo.csv
> "$CSV"
STATIONS="ST-ALPHA ST-BRAVO ST-CHARLIE ST-DELTA"
for i in $(seq 1 30000); do
    ST=$(echo $STATIONS | tr ' ' '\n' | shuf -n1)
    echo "2026-07-$((RANDOM%28+1)),${ST},$((RANDOM%40))" >> "$CSV"
done
# Statie unica, cu o singura aparitie - anomalia de gasit
echo "2026-07-15,ST-ANOMALY,999,${PASS_M18}" >> "$CSV"

chown m17:m17 "$CSV"
chmod 644 "$CSV"

cat >> /home/m17/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 17 - Statia meteo de coasta ==="
echo "In ~/citiri_meteo.csv sunt zeci de mii de citiri, de la cateva statii"
echo "care se repeta constant. O singura statie apare o singura data."
echo "Numara aparitiile fiecarei statii ca sa o identifici pe cea rara."
echo ""
EOF

echo "[M17] Parola pentru m18: $PASS_M18 (randul cu ST-ANOMALY, frecventa 1)" >> /opt/solutions/passwords.txt
