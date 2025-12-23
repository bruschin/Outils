#!/bin/bash
###########
## genere rapport linter ruff
## nécessite d'avoir excute
## [2025-12-23] BN V1.0.1
## pip install ruff --user
## https://github.com/charliermarsh/ruff
###########
REPTRAV="$(dirname "$0")"
REPPRODFINALE="public"
REPLOG="rapports"
FICSORTIE="${REPLOG}/ruff-rapport.txt"

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
exec >"${FICSORTIE}"

ruff check --fix src
ruff format src

exec 1>&6 6>&-

cat "${FICSORTIE}"
#rm -f "${FICSORTIE}" 1>/dev/null 2>/dev/null
echo "### $0 FIN ###"
exit 0

