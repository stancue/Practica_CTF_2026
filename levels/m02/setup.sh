#!/bin/bash
# ============================================================
# MISIUNEA 02 - "Inventarl de echipament"
# Concept SO: cautare dupa metadate (find -size -user)
# Parola trebuie sa aiba exact 20 de octeti - adica completata cu padding #
# ============================================================
set -e
BASE="M03-regex-9c1e"
LEN=${#BASE}
PAD=$((20-LEN))
PASS_M03="${BASE}$(printf '%.0s#' $(seq 1 $PAD))" #generare padding
PASS_M03=${PASS_M03:0:20}

#aici se genereaza fisiere randomizate, inserandu-se intr-unul anume parola pe care o cautam
mkdir -p /home/m02/inventar #creare director inventar care contine cele 3000 de fisiere
cd /home/m02/inventar
for i in $(seq 1 3000); do
    SIZE=$(( (RANDOM % 507) + 5 ))
    head -c "$SIZE" /dev/urandom > "item_${i}.dat"
done

TARGET="item_2048.dat" #fisierul dincare vom extrage parola
printf '%s' "$PASS_M03" > "$TARGET"
chown level_service:level_service "$TARGET" 2>/dev/null || chown student:student "$TARGET"
chmod 644 "$TARGET"
chown m02:m02 /home/m02/inventar/*.dat
chown student:student "$TARGET"
chmod 755 /home/m02/inventar

cat >> /home/m02/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 02 - Inventarul de echipament ==="
echo "Un singur fisier are exact 20 octeti si nu iti apartine."
echo "Comanda cheie: find ~/inventar -user student -size 20c"
echo ""
EOF

echo "[M02] Parola pentru m03: $PASS_M03 (fisier: $TARGET)" >> /opt/solutions/passwords.txt
