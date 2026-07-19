#!/bin/bash
# MISIUNEA 09 - "Jurnalul de zbor"
# Concept SO: analiza fisierelor de log, tipare de timp neobisnuite

set -e
PASS_M10="M10-manifest-4a9e"

LOG=/home/m09/flightops.log > "$LOG"
for i in $(seq 1 20000); do # nu este cea mai optima varianta - multe iteratii
    H=$(printf "%02d" $((RANDOM % 24)))
    M=$(printf "%02d" $((RANDOM % 60)))
    echo "[2026-07-${H}:${M}:00] TWR-ROUTINE flight=FX${i} status=nominal" >> "$LOG"
done
# linia tinta - singura cu format de timestamp ISO complet (an-luna-zi ora)
echo "[2026-07-15T03:14:00Z] BRIEFING-ROOM code=${PASS_M10}" >> "$LOG"
sort -R "$LOG" -o "$LOG" 2>/dev/null || true   # amestecma ordinea liniilor
chown m09:m09 "$LOG"
chmod 644 "$LOG"

cat >> /home/m09/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 09 - Jurnalul de zbor ==="
echo "In ~/flightops.log, o singura linie foloseste un format de timp"
echo "diferit fata de restul jurnalului de rutina."
echo "Foloseste expresii regulate (grep -E) ca sa o izolezi."
echo ""
EOF

echo "[M09] Parola pentru m10: $PASS_M10 (linia ISO8601 din flightops.log)" >> /opt/solutions/passwords.txt
