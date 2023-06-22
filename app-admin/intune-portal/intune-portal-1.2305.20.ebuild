# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit systemd tmpfiles pam desktop

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
	dev-libs/msalsdk-dbusclient
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
}

src_install() {
	systemd_dounit ${WORKDIR}/lib/systemd/system/intune-daemon.service
	systemd_dounit ${WORKDIR}/lib/systemd/system/intune-daemon.socket
	systemd_douserunit ${WORKDIR}/lib/systemd/user/intune-agent.service
	systemd_douserunit ${WORKDIR}/lib/systemd/user/intune-agent.timer

	dotmpfiles ${WORKDIR}/usr/lib/tmpfiles.d/intune.conf

	domenu ${WORKDIR}/usr/share/applications/intune-portal.desktop
	doicon -s 48 ${WORKDIR}/usr/share/icons/hicolor/48x48/apps/intune.png

	insinto /usr/share/polkit-1/actions
	doins ${WORKDIR}/usr/share/polkit-1/actions/com.microsoft.intune.policy

	into "$(getpam_mod_dir)"
	dolib.so ${WORKDIR}/usr/lib/x86_64-linux-gnu/security/pam_intune.so

	mkdir -p ${D}/opt/microsoft
	cp -a ${WORKDIR}/opt/microsoft/intune ${D}/opt/microsoft/
}
