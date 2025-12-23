#!/bin/bash
###########
## genere rapport lint scripts bash par shellcheck 

# Pour shellcheck : 
# apt-get install -y shellcheck

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
