#!/bin/bash

# MISIUNEA 10 - "Manifestul incarcaturii"
# Concept SO: arhive comprimate imbricate (tar/gzip)
set -e
PASS_M11="M11-tower-7b3d"

WORK=/tmp/manifest_build
rm -rf "$WORK"; 
mkdir -p "$WORK/layer3" #in layer 3 sta continutul real
echo "$PASS_M11" > "$WORK/layer3/coordonate.txt"
#-z comprima cu gzip
tar -czf "$WORK/layer2.tar.gz" -C "$WORK/layer3" coordonate.txt
mkdir -p "$WORK/layer2"
mv "$WORK/layer2.tar.gz" "$WORK/layer2/"

tar -czf "$WORK/layer1.tar.gz" -C "$WORK/layer2" layer2.tar.gz
mkdir -p /home/m10
mv "$WORK/layer1.tar.gz" /home/m10/manifest.tar.gz
rm -rf "$WORK"

chown m10:m10 /home/m10/manifest.tar.gz #change owner, o practica indicata
chmod 644 /home/m10/manifest.tar.gz #drepturi change mode

cat >> /home/m10/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 10 - Manifestul incarcaturii ==="
echo "~/manifest.tar.gz contine manifestul incarcaturii, dar nu direct."
echo "Foloseste tar ca sa dezarhivezi, apoi vezi ce ai obtinut."
echo ""
EOF

echo "[M10] Parola pentru m11: $PASS_M11 (in interiorul arhivei imbricate, 3 straturi)" >> /opt/solutions/passwords.txt
