# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit linux-info

DESCRIPTION="Master PDF Editor from Code Industry Ltd."
HOMEPAGE="https://code-industry.net/free-pdf-editor/"
SRC_URI="master-pdf-editor-${PV}_qt5.amd64.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-arch/deb2targz
        dev-libs/nspr
        dev-libs/nss
        dev-qt/qtcore
        dev-qt/qtgui
        dev-qt/qtnetwork
        dev-qt/qtprintsupport
        dev-qt/qtsvg
        dev-qt/qtwidgets
        media-gfx/sane-backends
        media-libs/mesa
        sys-devel/gcc
        sys-libs/glibc"
RDEPEND="${DEPEND}"

S=${WORKDIR}

pkg_nofetch() {
    einfo "Please download the deb-Package"
    einfo "master-pdf-editor-${PV}_qt5.amd64.deb"
    einfo "from ${HOMEPAGE}"
    einfo "and place them in your DISTDIR directory."
}

src_unpack() {
    unpack ${A}
}

src_configure() {
    rm control.tar.gz
    rm debian-binary
    tar -xpf data.tar.xz || die
    rm data.tar.xz
}

src_install() {
    cp -a ${S}/* ${D}
}
