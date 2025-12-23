#!/bin/bash
###########
## genere rapport pylint
## nécessite d'avoir excute
## pylint --generate-rcfile > .pylintrc
## [2025-12-23] BN V1.0.1

# Pour pylint :
  # - apt-get install -y ca-certificates git curl
  # - export CURL_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"
  # - update-ca-certificates -f
  # + gestion envs python, git, curl, nexus

# The following additional packages will be installed:
#   bash-completion git-man less libcbor0.10 libcurl4t64 liberror-perl
#   libfido2-1 libgdbm-compat4t64 libperl5.40 libxmuu1 openssh-client patch perl
#   perl-modules-5.40 xauth
# Suggested packages:
#   gettext-base git-doc git-email git-gui gitk gitweb git-cvs git-mediawiki
#   git-svn sensible-utils keychain libpam-ssh monkeysphere ssh-askpass ed
#   diffutils-doc perl-doc libterm-readline-gnu-perl
#   | libterm-readline-perl-perl make libtap-harness-archive-perl
# The following NEW packages will be installed:
#   bash-completion curl git git-man less libcbor0.10 libcurl4t64 liberror-perl
#   libfido2-1 libgdbm-compat4t64 libperl5.40 libxmuu1 openssh-client patch perl
#   perl-modules-5.40 xauth


# https://pypi.org/project/isort/
# https://pypi.org/project/black/
###########
REPTRAV="$(dirname "$0")"
REPLOG="rapports"
REPPRODFINALE="public"
REPCONF="docs"
FICCONF="${REPCONF}/.pylintrc"
FICSORTIE="${REPLOG}/pylint-rapport.txt"
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

echo "$0 : Linter des fichiers python sous src"

sed -i -e "s@indent-string='    '@indent-string='  '@g" "${FICCONF}"
pylint \
    --rcfile \
    "${FICCONF}" \
    src/pegase.py \
    tests/test_pegase.py \
    -r \
    n \
    --msg-template="{path}:{line}: [{msg_id}({symbol}), {obj}] {msg}" \
    -d E0015 \
    -d C0325 \
    -d C0303 \
    -d W0603 \
    -d W0703 \
    -d W0105 \
    -d W0311 \
    -d R0801 \
    -d too-many-arguments \
    -d too-many-branches 

exec 1>&6 6>&-

cat "${FICSORTIE}"
#rm -f "${FICSORTIE}" 1>/dev/null 2>/dev/null
echo "### $0 FIN ###"
exit 0

