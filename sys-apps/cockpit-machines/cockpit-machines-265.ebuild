# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils

DESCRIPTION="Cockpit UI for virtual machines"
HOMEPAGE="http://cockpit-project.org/"
SRC_URI="https://github.com/cockpit-project/${PN}/releases/download/${PV}/${P}.tar.xz"
LICENSE="LGPL-2.1+"

if [[ ${PV} == 9999* ]] ; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/cockpit-project/cockpit-machines.git"
        KEYWORDS=""
fi

KEYWORDS="x86 amd64"
IUSE=""
SLOT="0"

DEPEND="sys-apps/cockpit
	app-emulation/libvirt-dbus
	"
RDEPEND="${DEPEND}"

S=${WORKDIR}/cockpit-machines

src_compile() {
        emake
}

src_install() {
        emake DESTDIR="${D}" install
        dodoc README.md
}
