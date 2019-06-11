# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit eutils

DESCRIPTION="Master PDF Editor from Code Industry Ltd."
HOMEPAGE="https://code-industry.net/free-pdf-editor/"
SRC_URI="amd64? ( https://code-industry.net/public/${P}-qt5.amd64.tar.gz )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/nspr
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

src_unpack() {
    unpack ${A}
}

src_install() {
    mkdir -p ${D}/opt/master-pdf-editor-5
    cp -a ${S}/master-pdf-editor-5/* ${D}/opt/master-pdf-editor-5/
    mkdir -p ${D}/usr/share/applications
    mv ${D}/opt/master-pdf-editor-5/masterpdfeditor5.desktop ${D}/usr/share/applications/
}
