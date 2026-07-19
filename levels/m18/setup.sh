#!/bin/bash

# MISIUNEA 18 - "Arhiva bazei vechi"
# Concept SO: criptare/decriptare simetrica (openssl enc), md5sum

set -e
PASS_M19_TOKEN="M19-signal-9e3c"

echo -n "vechea-baza-est-africa-2025" > /etc/oldbase-anchor
chmod 644 /etc/oldbase-anchor
PASSPHRASE=$(md5sum /etc/oldbase-anchor | cut -d' ' -f1)

mkdir -p /home/m18/tmp_archive
echo -n "$PASS_M19_TOKEN" > /home/m18/tmp_archive/secret.txt
openssl enc -aes-256-cbc -salt -pbkdf2 \
    -in /home/m18/tmp_archive/secret.txt \
    -out /home/m18/tmp_archive/secret.enc \
    -pass "pass:${PASSPHRASE}"
rm -f /home/m18/tmp_archive/secret.txt
tar -czf /home/m18/arhiva_veche.tar.gz -C /home/m18/tmp_archive secret.enc
rm -rf /home/m18/tmp_archive
chown m18:m18 /home/m18/arhiva_veche.tar.gz
chmod 644 /home/m18/arhiva_veche.tar.gz

cat >> /home/m18/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 18 - Arhiva bazei vechi ==="
echo "~/arhiva_veche.tar.gz contine un fisier criptat simetric (AES)."
echo "Parola de decriptare nu e stocata nicaieri direct - se deriva"
echo "din hash-ul continutului fisierului /etc/oldbase-anchor."
echo "Dezarhiveaza, calculeaza hash-ul, apoi decripteaza cu openssl."
echo ""
EOF

echo "[M18] Parola pentru m19: $PASS_M19_TOKEN (decriptare AES, pass=md5sum(/etc/oldbase-anchor))" >> /opt/solutions/passwords.txt
