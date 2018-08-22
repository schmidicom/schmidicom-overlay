# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit autotools

DESCRIPTION="USB firewall against BadUSB attacks"
HOMEPAGE="https://github.com/kochstefan/usbauth-all"
SRC_URI="${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="x86 amd64"

IUSE="+notifier"
RDEPEND="=sys-libs/libusbauth-configparser-1.0"
DEPEND="${RDEPEND}"
PDEPEND="notifier? ( =sys-auth/usbauth-notifier-1.0 )"

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
