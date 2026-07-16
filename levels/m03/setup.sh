#!/bin/bash
# ============================================================
# MISIUNEA 03 - "Cifrul de plecare"
#Cerinta existenta la finalul codului - comentata si afisata in momentul rularii
# Concept SO: expresii regulate (grep -E)
# ============================================================
set -e
PASS_M04="A1B2C3D4E5F6"   # 12 hex majuscule, cf tiparului CODE-M4-[A-F0-9]{12}

HAYSTACK=/home/m03/raport_meteo.txt
> "$HAYSTACK"
for i in $(seq 1 40000); do
    R=$(head -c 8 /dev/urandom | md5sum | cut -c1-16)
    echo "obs_${i}: temp=$((RANDOM%40))C vant=${R}" >> "$HAYSTACK"
done
LINE="ruta: cod de traversare CODE-M4-${PASS_M04} confirmat"
TOTAL=$(wc -l < "$HAYSTACK")
POS=$(( (RANDOM % TOTAL) + 1 ))
sed -i "${POS}i ${LINE}" "$HAYSTACK"
chown m03:m03 "$HAYSTACK"
chmod 644 "$HAYSTACK"

cat >> /home/m03/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 03 - Cifrul de plecare ==="
echo "In raport_meteo.txt e ascuns un cod de ruta, printre zeci de mii de"
echo "linii de zgomot. Codul respecta un format fix si constant."
echo "Foloseste expresii regulate (grep -E) ca sa-l izolezi."
echo ""
EOF
echo "[M03] Parola pentru m04: $PASS_M04 (linia ${POS})" >> /opt/solutions/passwords.txt
