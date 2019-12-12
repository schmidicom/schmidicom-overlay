# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Microsoft Teams for Linux"
HOMEPAGE="https://products.office.com/en-us/microsoft-teams/group-chat-software"
SRC_URI="${P}-1.x86_64.rpm"

LICENSE="UNKNOWN"
SLOT="0"
KEYWORDS="amd64"

DEPEND="app-accessibility/at-spi2-atk
        dev-libs/atk
        dev-libs/expat
        dev-libs/glib
        dev-libs/nspr
        dev-libs/nss
        media-libs/alsa-lib
        net-print/cups
        sys-apps/dbus
        sys-apps/util-linux
        sys-devel/gcc
        sys-libs/glibc
        x11-libs/cairo
        x11-libs/gdk-pixbuf
        x11-libs/gtk+
        x11-libs/libX11
        x11-libs/libXScrnSaver
        x11-libs/libXcomposite
        x11-libs/libXcursor
        x11-libs/libXdamage
        x11-libs/libXext
        x11-libs/libXfixes
        x11-libs/libXi
        x11-libs/libXrandr
        x11-libs/libXrender
        x11-libs/libXtst
        x11-libs/libxcb
        x11-libs/pango"
RDEPEND="${DEPEND}
         app-crypt/libsecret"

S=${WORKDIR}

pkg_nofetch() {
    einfo "Please download the 64bit rpm-Package"
    einfo "${P}-1.x86_64.rpm from"
    einfo "${HOMEPAGE}"
    einfo "and place them in your ${DISTDIR}"
}

src_unpack() {
    rpm_src_unpack ${A}
}

src_install() {
    cp -a ${S}/* ${D}
}
