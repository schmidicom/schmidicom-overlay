# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm

DESCRIPTION="Autodesk Network License Manager for Linux"
HOMEPAGE="https://knowledge.autodesk.com/customer-service/network-license-administration/get-ready-network-license/download-the-network-license-manager"
SRC_URI="nlm${PV}_ipv4_ipv6_linux64.rpm"

LICENSE="UNKNOWN"
SLOT="0"
KEYWORDS="amd64"

DEPEND="sys-devel/gcc
	sys-libs/glibc"
RDEPEND="${DEPEND}"

S=${WORKDIR}

pkg_nofetch() {
    einfo "Please download the 64bit rpm-Package"
    einfo "nlm${PV}_ipv4_ipv6_linux64.rpm from"
    einfo "${HOMEPAGE}"
    einfo "and place them in your ${DISTDIR}"
}

src_unpack() {
    rpm_src_unpack ${A}
}

src_install() {
    cp -a ${S}/* ${D}
}
