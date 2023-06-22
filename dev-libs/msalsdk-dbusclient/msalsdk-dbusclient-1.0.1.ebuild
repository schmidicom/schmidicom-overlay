# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit systemd

DESCRIPTION="Microsoft Authentication Library cross platform Dbus client for talking to microsoft-identity-broker"
HOMEPAGE="https://learn.microsoft.com/en-us/mem/intune/user-help/enroll-device-linux"
SRC_URI="https://packages.microsoft.com/ubuntu/22.04/prod/pool/main/m/${PN}/${PN}_${PV}_amd64.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="sys-devel/gcc
        sys-libs/glibc"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	unpack ${S}/data.tar.gz
}

src_install() {
	dolib.so ${WORKDIR}/usr/lib/libmsal_dbus_client.so || die "Install failed!"
}
