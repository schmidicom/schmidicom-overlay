# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools

DESCRIPTION="C library encapsulating the Linux kernel USB gadget configfs userspace API functionality"
HOMEPAGE="https://www.kernel.org/doc/html/latest/usb/gadget_configfs.html"
SRC_URI="https://github.com/linux-usb-gadgets/${PN}/archive/refs/tags/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${PN}-v${PV}"

src_prepare() {
	default
	eapply "${FILESDIR}/gcc8-fix.patch"
	eautoreconf
}

src_configure() {
	econf
}
