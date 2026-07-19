#!/bin/bash

# MISIUNEA 12 - "Cutia neagra"
# Concept SO: inspectie fisiere binare (strings, xxd)

set -e
PASS_M13="M13-clock-9d1c"

BIN=/home/m12/telemetrie.bin
head -c 4096 /dev/urandom > "$BIN"
printf '\x00\x00TELEMETRY-MARKER:%s\x00\x00' "$PASS_M13" >> "$BIN"
head -c 4096 /dev/urandom >> "$BIN"

chown m12:m12 "$BIN"
chmod 644 "$BIN"

cat >> /home/m12/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 12 - Cutia neagra ==="
echo "~/telemetrie.bin e un fisier binar, majoritar date fara sens."
echo "Undeva in interior exista totusi un fragment de text lizibil."
echo "Foloseste un utilitar de extragere a textului din fisiere binare."
echo ""
EOF

echo "[M12] Parola pentru m13: $PASS_M13 (strings pe telemetrie.bin)" >> /opt/solutions/passwords.txt
