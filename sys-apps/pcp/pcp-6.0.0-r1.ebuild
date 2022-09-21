# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WANT_AUTOCONF="2.5"
inherit autotools

DESCRIPTION="Performance Co-Pilot, system performance and analysis framework"
HOMEPAGE="https://pcp.io/"
SRC_URI="https://github.com/performancecopilot/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="infiniband +perfevent pie python qt5 ssp systemd +threads zeroconf"

DEPEND=" systemd? ( sys-apps/systemd )
         perfevent? ( dev-libs/libpfm )
         zeroconf? ( net-dns/avahi[dbus] )
         qt5? ( dev-qt/qtcore:5
                dev-qt/qtprintsupport:5
                dev-qt/qtsvg:5
                dev-qt/qtconcurrent:5 )
         python? ( dev-lang/python )
         dev-libs/openssl
         dev-libs/json-glib
         x11-libs/libXt
         acct-user/pcp"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user
	eautoconf
}

src_configure() {
	econf \
		$(use_enable ssp) \
		$(use_enable pie) \
		$(use_with threads) \
		$(use_with infiniband) \
		$(use_with zeroconf discovery) \
		$(use_with systemd) \
		$(use_with perfevent) \
		$(use_with python python3) \
		--without-python
}

src_compile() {
	addwrite /var/lib/tmp/
	emake
}

src_install() {
	DIST_ROOT=${D} emake install
	dodoc CHANGELOG README.md
}
