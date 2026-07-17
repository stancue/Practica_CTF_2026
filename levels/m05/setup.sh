#!/bin/bash
# MISIUNEA 05 - "Generatorul de urgenta"
# Concept SO: bit SUID, real UID vs effective UID

set -e
PASS_M06="M06-radar-3e7c" #parola

#aici scriem parola in fisierul secret
echo "$PASS_M06" > /home/m06/.pass 
#practic fisierul e detinut de root, va trb sa alocam drepturuile lui m06
chown m06:m06 /home/m06/.pass
chmod 600 /home/m06/.pass

#gen reader imprumuta identitatea
gcc -O2 -o /usr/local/bin/gen-reader /opt/levels/m05/reader.c
#-o /usr/local/bin/gen-reader = numele și locul unde salvam rezultatul practic, programul nou creat 
#se va numi gen-reader și va fi pus în folderul /usr/local/bin
chown m06:m06 /usr/local/bin/gen-reader
chmod 4755 /usr/local/bin/gen-reader #bitul de suid

#informatii relevante pentru a afis cerinta si idee de rezolvare
cat >> /home/m05/.bashrc << 'EOF'
echo ""
echo "=== MISIUNEA 05 - Generatorul de urgenta ==="
echo "Undeva pe sistem exista un utilitar cu drepturi speciale (SUID),"
echo "capabil sa citeasca fisierul protejat al urmatoarei statii."
echo "Localizeaza-l si ruleaza-l."
echo ""
EOF

echo "[M05] Parola pentru m06: $PASS_M06 (via SUID gen-reader)" >> /opt/solutions/passwords.txt
