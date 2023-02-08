# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit systemd

DESCRIPTION="Microsoft Intune"
HOMEPAGE="https://learn.microsoft.com/en-us/mem/intune/user-help/enroll-device-linux"
SRC_URI="https://packages.microsoft.com/ubuntu/22.04/prod/pool/main/i/${PN}/${PN}_${PV}_amd64.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="app-crypt/libsecret
	app-accessibility/at-spi2-core
	dev-db/sqlite
	dev-libs/glib
	dev-libs/glib
	dev-libs/openssl:0/3
	net-libs/libsoup
	net-libs/webkit-gtk:4
	net-misc/curl
	sys-apps/systemd
	sys-apps/util-linux
	sys-devel/gcc
	sys-libs/glibc
	sys-libs/zlib
	sys-libs/pam
	x11-libs/gtk+
	x11-libs/libX11
	x11-libs/pango"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	unpack ${S}/data.tar.xz
	rm ${S}/control.tar.xz ${S}/data.tar.xz ${S}/debian-binary
}

src_install() {
	systemd_douserunit ${PORTAGE_BUILDDIR}/work/lib/systemd/user/intune-agent.service
	systemd_douserunit ${PORTAGE_BUILDDIR}/work/lib/systemd/user/intune-agent.timer
	rm -r ${PORTAGE_BUILDDIR}/work/lib

	mkdir -p ${PORTAGE_BUILDDIR}/work/lib64/security
	mv ${PORTAGE_BUILDDIR}/work/usr/lib/x86_64-linux-gnu/security/pam_intune.so ${PORTAGE_BUILDDIR}/work/lib64/security
	rm -r ${PORTAGE_BUILDDIR}/work/usr/lib/x86_64-linux-gnu

	cp -a ${PORTAGE_BUILDDIR}/work/* ${D}/
}
