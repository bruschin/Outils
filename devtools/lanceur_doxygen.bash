#!/bin/bash
###########
## genere rapport doxygen
## nécessite d'avoir installé doxygen dia graphviz et généré le fichier Doxyfile
## gestion version dans Doxyfile gérée par mef_versions.bash

# Pour doxygen : 
# https://askubuntu.com/questions/1291874/how-to-install-doxygen-on-ubuntu
# apt-get install -y doxygen libxapian30 graphviz dia

# The following additional packages will be installed:
#   adwaita-icon-theme at-spi2-common at-spi2-core dbus dbus-bin dbus-daemon
#   dbus-session-bus-common dbus-system-bus-common dbus-user-session
#   dconf-gsettings-backend dconf-service dia-common dia-shapes dirmngr dmsetup
#   fontconfig fontconfig-config fonts-dejavu-core fonts-dejavu-mono
#   fonts-liberation fonts-liberation-sans-narrow fonts-urw-base35
#   gir1.2-atk-1.0 gir1.2-freedesktop gir1.2-gdkpixbuf-2.0 gir1.2-glib-2.0
#   gir1.2-gtk-3.0 gir1.2-harfbuzz-0.0 gir1.2-pango-1.0 gnupg gnupg-l10n
#   gnupg-utils gpg gpg-agent gpg-wks-client gpgconf gpgsm gpgv
#   gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme
#   krb5-locales libabsl20240722 libann0 libaom3 libapparmor1 libassuan9
#   libatk-bridge2.0-0t64 libatk1.0-0t64 libatomic1 libatspi2.0-0t64
#   libavahi-client3 libavahi-common-data libavahi-common3 libavif16 libbrotli1
#   libcairo-gobject2 libcairo2 libcdt5 libcgraph6 libclang-cpp19 libclang1-19
#   libcloudproviders0 libcolord2 libcom-err2 libcryptsetup12 libcups2t64
#   libcurl3t64-gnutls libdatrie1 libdav1d7 libdbus-1-3 libdconf1 libde265-0
#   libdeflate0 libdevmapper1.02.1 libedit2 libemf1 libepoxy0 libexpat1 libfmt10
#   libfontconfig1 libfontenc1 libfreetype6 libfribidi0 libgav1-1 libgcrypt20
#   libgd3 libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common
#   libglib2.0-0t64 libglib2.0-data libgnutls30t64 libgomp1 libgpg-error-l10n
#   libgpg-error0 libgpgme11t64 libgpgmepp6t64 libgraphene-1.0-0 libgraphite2-3
#   libgssapi-krb5-2 libgtk-3-0t64 libgtk-3-bin libgtk-3-common libgts-0.7-5t64
#   libgts-bin libgvc6 libgvpr2 libharfbuzz-gobject0 libharfbuzz0b
#   libheif-plugin-aomenc libheif-plugin-dav1d libheif-plugin-libde265
#   libheif-plugin-x265 libheif1 libice6 libidn2-0 libimagequant0 libjbig0
#   libjpeg62-turbo libjson-c5 libk5crypto3 libkeyutils1 libkmod2 libkrb5-3
#   libkrb5support0 libksba8 liblab-gamut1 liblcms2-2 libldap-common libldap2
#   liblerc4 libllvm19 libltdl7 libnghttp2-14 libnghttp3-9 libngtcp2-16
#   libngtcp2-crypto-gnutls8 libnpth0t64 libnspr4 libnss-systemd libnss3
#   libnuma1 libopenjp2-7 libp11-kit0 libpam-systemd libpango-1.0-0
#   libpangocairo-1.0-0 libpangoft2-1.0-0 libpangoxft-1.0-0 libpathplan4
#   libpixman-1-0 libpng16-16t64 libpoppler147 libproc2-0 libpsl5t64
#   libpython3-stdlib libpython3.13 libpython3.13-minimal libpython3.13-stdlib
#   librav1e0.7 librsvg2-2 librsvg2-common librtmp1 libsasl2-2 libsasl2-modules
#   libsasl2-modules-db libsharpyuv0 libsm6 libssh2-1t64 libsvtav1enc2
#   libsystemd-shared libtasn1-6 libthai-data libthai0 libtiff6 libunistring5
#   libwayland-client0 libwayland-cursor0 libwayland-egl1 libwebp7 libx11-6
#   libx11-data libx265-215 libxau6 libxaw7 libxcb-render0 libxcb-shm0 libxcb1
#   libxcomposite1 libxcursor1 libxdamage1 libxdmcp6 libxext6 libxfixes3 libxft2
#   libxi6 libxinerama1 libxkbcommon0 libxml2 libxmu6 libxpm4 libxrandr2
#   libxrender1 libxt6t64 libxtst6 libyuv0 libz3-4 linux-sysctl-defaults
#   media-types pinentry-curses poppler-data procps psmisc publicsuffix python3
#   python3-minimal python3.13 python3.13-minimal shared-mime-info systemd
#   systemd-cryptsetup systemd-sysv systemd-timesyncd x11-common xdg-user-dirs
#   xfonts-encodings xfonts-utils xkb-data
# Suggested packages:
#   adwaita-icon-theme-legacy pinentry-gnome3 tor doxygen-latex doxygen-doc
#   doxygen-gui fonts-freefont-otf | fonts-freefont-ttf fonts-texgyre
#   gpg-wks-server parcimonie xloadimage scdaemon tpm2daemon gsfonts
#   graphviz-doc colord cups-common rng-tools libgd-tools low-memory-monitor
#   gnutls-bin krb5-doc krb5-user gvfs libheif-plugin-ffmpegdec
#   libheif-plugin-jpegdec libheif-plugin-jpegenc libheif-plugin-j2kdec
#   libheif-plugin-j2kenc libheif-plugin-kvazaar libheif-plugin-rav1e
#   libheif-plugin-svtenc liblcms2-utils libtss2-rc0t64 librsvg2-bin
#   libsasl2-modules-gssapi-mit | libsasl2-modules-gssapi-heimdal
#   libsasl2-modules-ldap libsasl2-modules-otp libsasl2-modules-sql
#   libarchive13t64 libbpf1 libdw1t64 libelf1t64 libfido2-1 libip4tc2
#   libpwquality1 libqrencode4 xapian-tools pinentry-doc poppler-utils
#   ghostscript fonts-japanese-mincho | fonts-ipafont-mincho
#   fonts-japanese-gothic | fonts-ipafont-gothic fonts-arphic-ukai
#   fonts-arphic-uming fonts-nanum python3-doc python3-tk python3-venv
#   python3.13-venv python3.13-doc binutils binfmt-support systemd-container
#   systemd-homed systemd-userdbd systemd-boot systemd-resolved systemd-repart
#   libtss2-tcti-device0 polkitd
# The following NEW packages will be installed:
#   adwaita-icon-theme at-spi2-common at-spi2-core dbus dbus-bin dbus-daemon
#   dbus-session-bus-common dbus-system-bus-common dbus-user-session
#   dconf-gsettings-backend dconf-service dia dia-common dia-shapes dirmngr
#   dmsetup doxygen fontconfig fontconfig-config fonts-dejavu-core
#   fonts-dejavu-mono fonts-liberation fonts-liberation-sans-narrow
#   fonts-urw-base35 gir1.2-atk-1.0 gir1.2-freedesktop gir1.2-gdkpixbuf-2.0
#   gir1.2-glib-2.0 gir1.2-gtk-3.0 gir1.2-harfbuzz-0.0 gir1.2-pango-1.0 gnupg
#   gnupg-l10n gnupg-utils gpg gpg-agent gpg-wks-client gpgconf gpgsm gpgv
#   graphviz gsettings-desktop-schemas gtk-update-icon-cache hicolor-icon-theme
#   krb5-locales libabsl20240722 libann0 libaom3 libapparmor1 libassuan9
#   libatk-bridge2.0-0t64 libatk1.0-0t64 libatomic1 libatspi2.0-0t64
#   libavahi-client3 libavahi-common-data libavahi-common3 libavif16 libbrotli1
#   libcairo-gobject2 libcairo2 libcdt5 libcgraph6 libclang-cpp19 libclang1-19
#   libcloudproviders0 libcolord2 libcom-err2 libcryptsetup12 libcups2t64
#   libcurl3t64-gnutls libdatrie1 libdav1d7 libdbus-1-3 libdconf1 libde265-0
#   libdeflate0 libdevmapper1.02.1 libedit2 libemf1 libepoxy0 libexpat1 libfmt10
#   libfontconfig1 libfontenc1 libfreetype6 libfribidi0 libgav1-1 libgcrypt20
#   libgd3 libgdk-pixbuf-2.0-0 libgdk-pixbuf2.0-bin libgdk-pixbuf2.0-common
#   libglib2.0-0t64 libglib2.0-data libgnutls30t64 libgomp1 libgpg-error-l10n
#   libgpg-error0 libgpgme11t64 libgpgmepp6t64 libgraphene-1.0-0 libgraphite2-3
#   libgssapi-krb5-2 libgtk-3-0t64 libgtk-3-bin libgtk-3-common libgts-0.7-5t64
#   libgts-bin libgvc6 libgvpr2 libharfbuzz-gobject0 libharfbuzz0b
#   libheif-plugin-aomenc libheif-plugin-dav1d libheif-plugin-libde265
#   libheif-plugin-x265 libheif1 libice6 libidn2-0 libimagequant0 libjbig0
#   libjpeg62-turbo libjson-c5 libk5crypto3 libkeyutils1 libkmod2 libkrb5-3
#   libkrb5support0 libksba8 liblab-gamut1 liblcms2-2 libldap-common libldap2
#   liblerc4 libllvm19 libltdl7 libnghttp2-14 libnghttp3-9 libngtcp2-16
#   libngtcp2-crypto-gnutls8 libnpth0t64 libnspr4 libnss-systemd libnss3
#   libnuma1 libopenjp2-7 libp11-kit0 libpam-systemd libpango-1.0-0
#   libpangocairo-1.0-0 libpangoft2-1.0-0 libpangoxft-1.0-0 libpathplan4
#   libpixman-1-0 libpng16-16t64 libpoppler147 libproc2-0 libpsl5t64
#   libpython3-stdlib libpython3.13 libpython3.13-minimal libpython3.13-stdlib
#   librav1e0.7 librsvg2-2 librsvg2-common librtmp1 libsasl2-2 libsasl2-modules
#   libsasl2-modules-db libsharpyuv0 libsm6 libssh2-1t64 libsvtav1enc2
#   libsystemd-shared libtasn1-6 libthai-data libthai0 libtiff6 libunistring5
#   libwayland-client0 libwayland-cursor0 libwayland-egl1 libwebp7 libx11-6
#   libx11-data libx265-215 libxapian30 libxau6 libxaw7 libxcb-render0
#   libxcb-shm0 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxdmcp6
#   libxext6 libxfixes3 libxft2 libxi6 libxinerama1 libxkbcommon0 libxml2
#   libxmu6 libxpm4 libxrandr2 libxrender1 libxt6t64 libxtst6 libyuv0 libz3-4
#   linux-sysctl-defaults media-types pinentry-curses poppler-data procps psmisc
#   publicsuffix python3 python3-minimal python3.13 python3.13-minimal
#   shared-mime-info systemd systemd-cryptsetup systemd-sysv systemd-timesyncd
#   x11-common xdg-user-dirs xfonts-encodings xfonts-utils xkb-data

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

# securite en cas d'oubli dans pipeline CI/CD
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

