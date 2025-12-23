#!/bin/bash
###########
## genere rapport doxygen
## nécessite d'avoir installé doxygen dia graphviz et généré le fichier Doxyfile
## gestion version dans Doxyfile gérée par mef_versions.bash

# Pour doxygen : 
# https://askubuntu.com/questions/1291874/how-to-install-doxygen-on-ubuntu
# apt-get install -y doxygen libxapian30 graphviz dia

# The following additional packages will be installed:
#   fontconfig fontconfig-config fonts-dejavu-core fonts-dejavu-mono
#   fonts-liberation fonts-liberation-sans-narrow libabsl20240722 libann0
#   libaom3 libatomic1 libavif16 libbrotli1 libcairo2 libcdt5 libcgraph6
#   libclang-cpp19 libclang1-19 libdatrie1 libdav1d7 libde265-0 libdeflate0
#   libedit2 libexpat1 libfmt10 libfontconfig1 libfreetype6 libfribidi0
#   libgav1-1 libgd3 libglib2.0-0t64 libglib2.0-data libgomp1 libgraphite2-3
#   libgts-0.7-5t64 libgts-bin libgvc6 libgvpr2 libharfbuzz0b
#   libheif-plugin-aomenc libheif-plugin-dav1d libheif-plugin-libde265
#   libheif-plugin-x265 libheif1 libice6 libimagequant0 libjbig0 libjpeg62-turbo
#   liblab-gamut1 liblerc4 libllvm19 libltdl7 libnuma1 libpango-1.0-0
#   libpangocairo-1.0-0 libpangoft2-1.0-0 libpathplan4 libpixman-1-0
#   libpng16-16t64 librav1e0.7 libsharpyuv0 libsm6 libsvtav1enc2 libthai-data
#   libthai0 libtiff6 libwebp7 libx11-6 libx11-data libx265-215 libxau6 libxaw7
#   libxcb-render0 libxcb-shm0 libxcb1 libxdmcp6 libxext6 libxml2 libxmu6
#   libxpm4 libxrender1 libxt6t64 libyuv0 libz3-4 shared-mime-info x11-common
#   xdg-user-dirs
# Suggested packages:
#   doxygen-latex doxygen-doc doxygen-gui gsfonts graphviz-doc libgd-tools
#   low-memory-monitor libheif-plugin-ffmpegdec libheif-plugin-jpegdec
#   libheif-plugin-jpegenc libheif-plugin-j2kdec libheif-plugin-j2kenc
#   libheif-plugin-kvazaar libheif-plugin-rav1e libheif-plugin-svtenc
#   xapian-tools
# The following NEW packages will be installed:
#   doxygen fontconfig fontconfig-config fonts-dejavu-core fonts-dejavu-mono
#   fonts-liberation fonts-liberation-sans-narrow graphviz libabsl20240722
#   libann0 libaom3 libatomic1 libavif16 libbrotli1 libcairo2 libcdt5 libcgraph6
#   libclang-cpp19 libclang1-19 libdatrie1 libdav1d7 libde265-0 libdeflate0
#   libedit2 libexpat1 libfmt10 libfontconfig1 libfreetype6 libfribidi0
#   libgav1-1 libgd3 libglib2.0-0t64 libglib2.0-data libgomp1 libgraphite2-3
#   libgts-0.7-5t64 libgts-bin libgvc6 libgvpr2 libharfbuzz0b
#   libheif-plugin-aomenc libheif-plugin-dav1d libheif-plugin-libde265
#   libheif-plugin-x265 libheif1 libice6 libimagequant0 libjbig0 libjpeg62-turbo
#   liblab-gamut1 liblerc4 libllvm19 libltdl7 libnuma1 libpango-1.0-0
#   libpangocairo-1.0-0 libpangoft2-1.0-0 libpathplan4 libpixman-1-0
#   libpng16-16t64 librav1e0.7 libsharpyuv0 libsm6 libsvtav1enc2 libthai-data
#   libthai0 libtiff6 libwebp7 libx11-6 libx11-data libx265-215 libxapian30
#   libxau6 libxaw7 libxcb-render0 libxcb-shm0 libxcb1 libxdmcp6 libxext6
#   libxml2 libxmu6 libxpm4 libxrender1 libxt6t64 libyuv0 libz3-4
#   shared-mime-info x11-common xdg-user-dirs

###########
REPTRAV="$(dirname "$0")"
REPLOG="rapports"
REPCONF="docs"
REPPRODFINALE="public"
REPDOXYGEN="${REPLOG}/doxygen"
FICSORTIE="${REPLOG}/doxygen-rapport.txt"
FICCONF="${REPCONF}/Doxyfile"
export TZ="Europe/Paris"

cd "${REPTRAV}/.." || exit 1

echo "### $0 DEBUT ###"

if ! test -d "${REPDOXYGEN}"; then
  mkdir -p "${REPDOXYGEN}" 2>/dev/null
fi

if ! test -d "${REPPRODFINALE}"; then
  mkdir -p "${REPPRODFINALE}" 2>/dev/null
fi

if ! test -d "${REPLOG}"; then
  mkdir -p "${REPLOG}" 2>/dev/null
fi

exec 6>&1
exec >"${FICSORTIE}" 2>&1

echo "$0 : Génération documentation par Doxygen"
doxygen "${FICCONF}"

exec 1>&6 6>&-

cat "${FICSORTIE}"
echo "### $0 FIN ###"
exit 0

