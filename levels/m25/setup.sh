#!/bin/bash

# MISIUNEA 25 - "Dosarul final" (capstone)
# Concept SO: combinatie - inspectie proces (ps) + hashing (sha256sum)
#             + decriptare (openssl) + arhivare (tar)

set -e
FINAL_TOKEN="FLAG{sentinel_stagiu_finalizat_2026}"
ANCHOR="anchor-audit-sentinel-final"   # aceeasi ancora descoperita la M24

mkdir -p /opt/procs
cp /opt/levels/m25/final-relay.sh /opt/procs/final-relay.sh
chmod 755 /opt/procs/final-relay.sh

PASSPHRASE=$(printf '%s' "$ANCHOR" | sha256sum | cut -d' ' -f1)

mkdir -p /home/m25/tmp_final
echo -n "$FINAL_TOKEN" > /home/m25/tmp_final/final.txt
openssl enc -aes-256-cbc -salt -pbkdf2 \
    -in /home/m25/tmp_final/final.txt \
    -out /home/m25/tmp_final/final.enc \
    -pass "pass:${PASSPHRASE}"
rm -f /home/m25/tmp_final/final.txt
tar -czf /home/m25/dosar_final.tar.gz -C /home/m25/tmp_final final.enc
rm -rf /home/m25/tmp_final
chown m25:m25 /home/m25/dosar_final.tar.gz
chmod 644 /home/m25/dosar_final.tar.gz

cat >> /home/m25/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 25 - Dosarul final (CAPSTONE) ==="
echo "Acest cont recapituleaza tehnicile intregului stagiu, intr-un"
echo "singur lant: undeva ruleaza un proces propriu, cu o informatie"
echo "vizibila in modul cum a fost lansat. Acea informatie, procesata"
echo "corespunzator, devine cheia unei arhive criptate aflate in acest"
echo "cont."
echo ""
EOF

echo "[M25-FINAL] Token: $FINAL_TOKEN (sha256 din ancora vizibila in argv-ul propriului proces final-relay.sh)" >> /opt/solutions/passwords.txt
