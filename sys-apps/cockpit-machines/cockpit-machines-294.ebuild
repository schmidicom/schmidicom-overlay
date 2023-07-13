# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cockpit UI for virtual machines"
HOMEPAGE="http://cockpit-project.org/"
SRC_URI="https://github.com/cockpit-project/${PN}/releases/download/${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="sys-apps/cockpit
	app-emulation/libvirt-dbus"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${PN}

src_install() {
        emake DESTDIR="${D}" install
        dodoc README.md
}
