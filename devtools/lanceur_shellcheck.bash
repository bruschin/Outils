#!/bin/bash
###########
## genere rapport lint des scripts bash par shellcheck
## [2025-12-23] BN V1.0.1

# Pour shellcheck : 
# apt-get install -y shellcheck

# The following NEW packages will be installed:
#   \shellcheck

###########
REPTRAV="$(dirname "$0")"
REPPRODFINALE="public"
REPLOG="rapports"
FICSORTIE="${REPLOG}/shellcheck-rapport.txt"

export TZ="Europe/Paris"

cd "${REPTRAV}/.." || exit 1

echo "### $0 DEBUT ###"

if ! test -d "${REPLOG}"; then
  mkdir -p "${REPLOG}" 2>/dev/null
fi

# securite en cas d'oubli dans pipeline CI/CD
if ! test -d "${REPPRODFINALE}"; then
  mkdir -p "${REPPRODFINALE}" 2>/dev/null
fi

exec 6>&1
exec >"${FICSORTIE}" 2>&1

echo "$0 : shellchek divers scripts bash"

shellcheck -f json src/pegase.bash

exec 1>&6 6>&-

cat "${FICSORTIE}"
#rm -f "${FICSORTIE}" 1>/dev/null 2>/dev/null
echo "### $0 FIN ###"
exit 0
