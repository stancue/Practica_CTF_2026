#!/bin/bash
# MISIUNEA 11 - "Turnul de control"
# Concept SO: /etc/hosts, rezolutie locala de nume (nu DNS extern)

set -e
PASS_M12="M12-blackbox-2f8a"

# intrare locala in /etc/hosts - rezolutie fara DNS extern
echo "10.77.3.19    control-tower.sentinel.local" >> /etc/hosts

mkdir -p /srv/net
# decoyuri pe alte adrese IP
echo "canal gresit" > /srv/net/10.77.3.11.cfg
echo "canal gresit" > /srv/net/10.77.3.42.cfg
# fisierul real - numit dupa IP-ul rezolvat corect
echo "$PASS_M12" > /srv/net/10.77.3.19.cfg
chmod 644 /srv/net/*.cfg

cat >> /home/m11/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 11 - Turnul de control ==="
echo "Turnul de control raspunde la numele 'control-tower.sentinel.local',"
echo "definit local pe acest sistem (nu prin DNS extern)."
echo "Afla adresa IP corespunzatoare, apoi cauta in /srv/net fisierul"
echo "numit dupa acea adresa."
echo ""
EOF

echo "[M11] Parola pentru m12: $PASS_M12 (/srv/net/10.77.3.19.cfg)" >> /opt/solutions/passwords.txt
