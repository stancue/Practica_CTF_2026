#!/bin/bash

# MISIUNEA 24 - "Auditul de securitate"
# Concept SO: descoperire configurare de logare (/etc/rsyslog.d)

set -e
PASS_M25_HINT="anchor-audit-sentinel-final"

mkdir -p /etc/rsyslog.d
# Config neobisnuita: redirectioneaza un facility catre un log ascuns
cat > /etc/rsyslog.d/60-audit-custom.conf << 'EOF'
# Redirectionare interna de audit - NU sterge fara aprobare
local5.*    /var/log/.hidden-audit.log
EOF
chmod 644 /etc/rsyslog.d/60-audit-custom.conf

mkdir -p /var/log
echo "[AUDIT] serviciu configurat neobisnuit - anchor final: ${PASS_M25_HINT}" > /var/log/.hidden-audit.log
chmod 644 /var/log/.hidden-audit.log

cat >> /home/m24/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 24 - Auditul de securitate ==="
echo "Un serviciu de logare (rsyslog) a fost configurat neobisnuit pe"
echo "acest sistem, redirectionand un tip de mesaje catre un fisier"
echo "care nu apare in locurile standard de log."
echo "Verifica configurarile din /etc/rsyslog.d/"
echo ""
EOF

echo "[M24] Indiciu final pentru m25: $PASS_M25_HINT (/var/log/.hidden-audit.log, via /etc/rsyslog.d/60-audit-custom.conf)" >> /opt/solutions/passwords.txt
