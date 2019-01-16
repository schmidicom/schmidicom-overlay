# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
inherit linux-info

DESCRIPTION="WibuKey RunTime Kit"
HOMEPAGE="http://www.wibu.com"
SRC_URI="wkrt-lin_${PV}_amd64.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-devel/gcc
        sys-libs/glibc
        sys-libs/zlib
        media-libs/fontconfig
        media-libs/freetype
        x11-libs/libICE
        x11-libs/libSM
        x11-libs/libxcb"
RDEPEND="${DEPEND}"

S=${WORKDIR}

pkg_nofetch() {
    einfo "Please download the 64bit deb-Package"
    einfo "wkrt-lin_${PV}_amd64.deb"
    einfo "from ${HOMEPAGE}, convert it with deb2targz"
    einfo "and place them in your DISTDIR directory."
}

src_unpack() {
    unpack ${A}
}

src_install() {
    cp -a ${S}/* ${D}
    mkdir -p ${D}/etc/env.d
    echo "LDPATH='/usr/lib/i386-linux-gnu:/usr/lib/x86_64-linux-gnu'" > ${D}/etc/env.d/99wkrt
}
