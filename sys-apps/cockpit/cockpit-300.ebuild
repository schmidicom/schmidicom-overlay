# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools pam

DESCRIPTION="Server Administration Web Interface"
HOMEPAGE="http://cockpit-project.org/"
SRC_URI="https://github.com/cockpit-project/${PN}/releases/download/${PV}/${P}.tar.xz"
LICENSE="LGPL-2.1+"

if [[ ${PV} == 9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cockpit-project/cockpit.git"
	KEYWORDS=""
fi

KEYWORDS="x86 amd64"
IUSE="doc firewalld libvirt lvm networkmanager policykit +ssh +client"
SLOT="0"

DEPEND="firewalld? ( net-firewall/firewalld )
	lvm? ( sys-fs/lvm2 )
	networkmanager? ( net-misc/networkmanager )
	policykit? ( sys-auth/polkit )
	!policykit? ( app-admin/sudo )
	ssh? ( net-libs/libssh[server] )
	dev-util/gdbus-codegen
	dev-libs/json-glib
	net-libs/nodejs[npm]
	net-libs/glib-networking
	sys-fs/udisks"
RDEPEND="${DEPEND}"
PDEPEND="libvirt? (
		sys-apps/cockpit-machines
		app-emulation/libvirt )"

src_prepare() {
	eapply_user
	echo "m4_define(VERSION_NUMBER, [${PV}])" > version.m4
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable doc) \
		$(use_enable ssh) \
		$(use_enable client cockpit-client) \
		$(use_enable client pybridge) \
		$(use_enable policykit polkit) \
		--disable-pcp
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
	newpamd "${FILESDIR}/cockpit.pam" cockpit
	dodoc AUTHORS README.md

	# Remove PackageKit because Gentoo doesent support it.
	rm -r ${D}/usr/share/cockpit/packagekit
}
