#!/bin/bash

# MISIUNEA 23 - "Raportul cifrat"
# Concept SO: codare base64 + criptare simetrica, comenzi inlantuite

PASS_M24="M24-audit-8a2f"
ANCHOR="raport-final-sentinel-2026"

mkdir -p /home/m23/tmp_report
echo -n "$PASS_M24" > /home/m23/tmp_report/plain.txt
openssl enc -aes-256-cbc -salt -pbkdf2 \
    -in /home/m23/tmp_report/plain.txt \
    -out /home/m23/tmp_report/plain.enc \
    -pass "pass:${ANCHOR}"
base64 /home/m23/tmp_report/plain.enc > /home/m23/dispatch.b64
rm -rf /home/m23/tmp_report

chown m23:m23 /home/m23/dispatch.b64
chmod 644 /home/m23/dispatch.b64

cat >> /home/m23/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 23 - Raportul cifrat ==="
echo "~/dispatch.b64 contine raportul, codat si apoi criptat, in doua"
echo "straturi succesive. Parola de decriptare: raport-final-sentinel-2026"
echo "Decodeaza mai intai stratul de codare, apoi decripteaza rezultatul."
echo ""
EOF

echo "[M23] Parola pentru m24: $PASS_M24 (base64 -d + openssl decrypt, pass fix: $ANCHOR)" >> /opt/solutions/passwords.txt
