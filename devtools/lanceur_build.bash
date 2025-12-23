#!/bin/bash
###########
## genere package wheel Outils
## ## [2025-12-23] BN V1.0.1

## pip install builf --user
## https://packaging.python.org/en/latest/tutorials/packaging-projects/
###########
REPTRAV="$(dirname "$0")"
REPLOG="rapports"
REPPRODFINALE="public"
REPBUILD="build/dist"
FICSORTIE="${REPLOG}/build-rapport.txt"

export TZ="Europe/Paris"

cd "${REPTRAV}/.." || exit 1

echo "### $0 DEBUT ###"

if ! test -d "${REPBUILD}"; then
  mkdir -p "${REPBUILD}" 2>/dev/null
fi

if ! test -d "${REPLOG}"; then
  mkdir -p "${REPLOG}" 2>/dev/null
fi

# securite en cas d'oubli dans pipeline CI/CD
if ! test -d "${REPPRODFINALE}"; then
  mkdir -p "${REPPRODFINALE}" 2>/dev/null
fi

exec 6>&1
exec >"${FICSORTIE}" 2>&1

echo "$0 : Lanceur packaging build"

python3 -m build --wheel -o build/dist

exec 1>&6 6>&-

cat "${FICSORTIE}"

echo "### $0 FIN ###"
exit 0
