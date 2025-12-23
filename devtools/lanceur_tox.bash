#!/bin/bash
###########
## genere rapport linters, coverage, pytest avec tox
## [2025-12-23] BN V1.0.1

## necessite pyenv avec +eiurs versions python.
## nécessite d'avoir execute

# pour pyenv:
  # https://blog.stephane-robert.info/docs/developper/programmation/python/pyenv/
  #- apt-get install -y make build-essential libssl-dev zlib1g-dev 
  #    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm 
  #    libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev
  #    liblzma-dev python3-openssl

# The following additional packages will be installed:
#   binutils binutils-common binutils-x86-64-linux-gnu bzip2 bzip2-doc cpp
#   cpp-14 cpp-14-x86-64-linux-gnu cpp-x86-64-linux-gnu dpkg-dev fakeroot g++
#   g++-14 g++-14-x86-64-linux-gnu g++-x86-64-linux-gnu gcc gcc-14
#   gcc-14-x86-64-linux-gnu gcc-x86-64-linux-gnu libalgorithm-diff-perl
#   libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan8 libbinutils
#   libbrotli-dev libc-dev-bin libc6-dev libcc1-0 libcrypt-dev libctf-nobfd0
#   libctf0 libdpkg-perl libexpat1-dev libfakeroot libfile-fcntllock-perl
#   libfontconfig-dev libfontconfig1-dev libfreetype-dev libgcc-14-dev libgpm2
#   libgprofng0 libhwasan0 libisl23 libitm1 libjansson4 liblocale-gettext-perl
#   liblsan0 libmpc3 libmpfr6 libncurses6 libpfm4 libpkgconf3 libpng-dev
#   libpng-tools libquadmath0 libsframe1 libstdc++-14-dev libtcl8.6 libtk8.6
#   libtsan2 libubsan1 libx11-dev libxau-dev libxcb1-dev libxdmcp-dev
#   libxext-dev libxft-dev libxml2-dev libxrender-dev libxss-dev libxss1
#   libyaml-0-2 libz3-dev linux-libc-dev llvm-19 llvm-19-dev
#   llvm-19-linker-tools llvm-19-runtime llvm-19-tools llvm-runtime manpages
#   manpages-dev pkgconf pkgconf-bin python3-bcrypt python3-cffi-backend
#   python3-cryptography python3-pygments python3-yaml rpcsvc-proto tcl tcl-dev
#   tcl8.6 tcl8.6-dev tk tk8.6 tk8.6-dev uuid-dev x11proto-core-dev x11proto-dev
#   xorg-sgml-doctools xtrans-dev
# Suggested packages:
#   binutils-doc gprofng-gui binutils-gold cpp-doc gcc-14-locales cpp-14-doc
#   debian-keyring debian-tag2upload-keyring g++-multilib g++-14-multilib
#   gcc-14-doc gcc-multilib autoconf automake libtool flex bison gdb gcc-doc
#   gcc-14-multilib gdb-x86-64-linux-gnu libc-devtools glibc-doc sensible-utils
#   bzr freetype2-doc gpm liblzma-doc ncurses-doc readline-doc sqlite3-doc
#   libssl-doc libstdc++-14-doc libx11-doc libxcb-doc libxext-doc llvm-19-doc
#   make-doc man-browser python-cryptography-doc python3-cryptography-vectors
#   python-openssl-doc python-pygments-doc ttf-bitstream-vera tcl-doc
#   tcl-tclreadline tcl8.6-doc tk-doc tk8.6-doc
# The following NEW packages will be installed:
#   binutils binutils-common binutils-x86-64-linux-gnu build-essential bzip2
#   bzip2-doc cpp cpp-14 cpp-14-x86-64-linux-gnu cpp-x86-64-linux-gnu dpkg-dev
#   fakeroot g++ g++-14 g++-14-x86-64-linux-gnu g++-x86-64-linux-gnu gcc gcc-14
#   gcc-14-x86-64-linux-gnu gcc-x86-64-linux-gnu libalgorithm-diff-perl
#   libalgorithm-diff-xs-perl libalgorithm-merge-perl libasan8 libbinutils
#   libbrotli-dev libbz2-dev libc-dev-bin libc6-dev libcc1-0 libcrypt-dev
#   libctf-nobfd0 libctf0 libdpkg-perl libexpat1-dev libfakeroot libffi-dev
#   libfile-fcntllock-perl libfontconfig-dev libfontconfig1-dev libfreetype-dev
#   libgcc-14-dev libgpm2 libgprofng0 libhwasan0 libisl23 libitm1 libjansson4
#   liblocale-gettext-perl liblsan0 liblzma-dev libmpc3 libmpfr6 libncurses-dev
#   libncurses6 libpfm4 libpkgconf3 libpng-dev libpng-tools libquadmath0
#   libreadline-dev libsframe1 libsqlite3-dev libssl-dev libstdc++-14-dev
#   libtcl8.6 libtk8.6 libtsan2 libubsan1 libx11-dev libxau-dev libxcb1-dev
#   libxdmcp-dev libxext-dev libxft-dev libxml2-dev libxrender-dev libxss-dev
#   libxss1 libyaml-0-2 libz3-dev linux-libc-dev llvm llvm-19 llvm-19-dev
#   llvm-19-linker-tools llvm-19-runtime llvm-19-tools llvm-runtime make
#   manpages manpages-dev pkgconf pkgconf-bin python3-bcrypt
#   python3-cffi-backend python3-cryptography python3-openssl python3-pygments
#   python3-yaml rpcsvc-proto tcl tcl-dev tcl8.6 tcl8.6-dev tk tk-dev tk8.6
#   tk8.6-dev uuid-dev x11proto-core-dev x11proto-dev xorg-sgml-doctools
#   xtrans-dev xz-utils zlib1g-dev

###########
REPTRAV="$(dirname "$0")"
REPLOG="rapports"
REPPRODFINALE="public"
REPCONF="docs"
FICSORTIE="${REPLOG}/tox-rapport.txt"
FICCONF="${REPCONF}/tox.ini"

export TZ="Europe/Paris"

cd "${REPTRAV}/.." || exit 1

echo "### $0 DEBUT ${PWD} ###"

if ! test -d "${REPLOG}"; then
  mkdir -p "${REPLOG}" 2>/dev/null
fi

# securite en cas d'oubli dans pipeline CI/CD
if ! test -d "${REPPRODFINALE}"; then
  mkdir -p "${REPPRODFINALE}" 2>/dev/null
fi

exec 6>&1
exec >"${FICSORTIE}" 2>&1

echo "$0 : Lanceur tox"

# tox -c "${FICCONF}"
tox -c "${FICCONF}" --recreate

exec 1>&6 6>&-

cat "${FICSORTIE}"
echo "### $0 FIN ###"
exit 0
