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

DEPEND=""
RDEPEND=""

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
