#!/bin/bash

# MISIUNEA 22 - "Releul final"
# Concept SO: privilegiu minim printr-o regula sudo restransa la  O SINGURA comanda (alternativa mai fina decat SUID clasic, care ar da acces total la identitatea tinta).
set -e
PASS_M23="M23-report-3c9e"

echo "$PASS_M23" > /home/m23/.pass
chown m23:m23 /home/m23/.pass
chmod 600 /home/m23/.pass

cp /opt/levels/m22/relay-final-check.sh /usr/local/bin/relay-final-check
chown m23:m23 /usr/local/bin/relay-final-check
chmod 750 /usr/local/bin/relay-final-check

# regula sudo: m22 poate rula DOAR acest script, ca m23, fara parola.
# nu poate rula nimic altceva ca m23 - privilegiu strict minim.
cat > /etc/sudoers.d/m22-relay << 'EOF'
m22 ALL=(m23) NOPASSWD: /usr/local/bin/relay-final-check
EOF
chmod 440 /etc/sudoers.d/m22-relay

cat >> /home/m22/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 22 - Releul final ==="
echo "Verifica ce poti rula ca alt utilizator: sudo -l"
echo "Odata descoperita regula, foloseste-o pentru a rula comanda"
echo "permisa, sub identitatea contului tinta."
echo ""
EOF

echo "[M22] Parola pentru m23: $PASS_M23 (via sudo -u m23 relay-final-check)" >> /opt/solutions/passwords.txt
