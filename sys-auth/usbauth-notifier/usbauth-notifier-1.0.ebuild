# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools

DESCRIPTION="Notifier for USB Firewall to use with desktop environments"
HOMEPAGE="https://github.com/kochstefan/usbauth-all"
SRC_URI="${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="x86 amd64"

IUSE=""
RDEPEND="=sys-auth/usbauth-1.0"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
}

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
