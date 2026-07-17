#!/bin/bash
# MISIUNEA 08 - "Depozitul de combustibil"
# Concept SO: permisiuni 711 (execute-only, traversare fara listare)

set -e
PASS_M09="M09-flightlog-6c2f"

BASE="/srv/depozit"
mkdir -p "${BASE}/culoar-sud/ramificatie-b7/nisa-3/cod"
echo "$PASS_M09" > "${BASE}/culoar-sud/ramificatie-b7/nisa-3/cod/acces.txt"

chmod 711 "${BASE}" \
          "${BASE}/culoar-sud" \
          "${BASE}/culoar-sud/ramificatie-b7" \
          "${BASE}/culoar-sud/ramificatie-b7/nisa-3" \
          "${BASE}/culoar-sud/ramificatie-b7/nisa-3/cod"
chmod 644 "${BASE}/culoar-sud/ramificatie-b7/nisa-3/cod/acces.txt"
chown -R root:root "${BASE}"

 #/srv/depozit
#/srv/depozit/culoar-sud
#/srv/depozit/culoar-sud/ramificatie-b7
#/srv/depozit/culoar-sud/ramificatie-b7/nisa-3
#/srv/depozit/culoar-sud/ramificatie-b7/nisa-3/cod


cat >> /home/m08/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 08 - Depozitul de combustibil ==="
echo "Traseu cunoscut: /srv/depozit/culoar-sud/ramificatie-b7/nisa-3/cod/acces.txt"
echo "'ls' nu va arata continutul directoarelor, dar 'cat' pe calea exacta merge."
echo ""
EOF

echo "[M08] Parola pentru m09: $PASS_M09 (${BASE}/culoar-sud/ramificatie-b7/nisa-3/cod/acces.txt)" >> /opt/solutions/passwords.txt
