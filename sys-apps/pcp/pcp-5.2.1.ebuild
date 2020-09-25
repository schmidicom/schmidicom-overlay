# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils

DESCRIPTION="Performance Co-Pilot, system performance and analysis framework"
HOMEPAGE="https://pcp.io/"
SRC_URI="https://github.com/performancecopilot/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="LGPL-2.1+"

KEYWORDS="x86 amd64"
IUSE="infiniband manager +perfevent pie qt5 ssp systemd +threads +webapi zeroconf"
SLOT="0"

DEPEND=" systemd? ( sys-apps/systemd )
         perfevent? ( dev-libs/libpfm )
         zeroconf? ( net-dns/avahi[dbus] )
         qt5? ( dev-qt/qtcore:5
                dev-qt/qtprintsupport:5
                dev-qt/qtsvg:5
                dev-qt/qtconcurrent:5 )
         dev-lang/python
         dev-libs/json-glib
         x11-libs/libXt
         acct-user/pcp"
RDEPEND="${DEPEND}"

src_configure() {
        econf \
                $(use_enable ssp) \
                $(use_enable pie) \
                $(use_with threads) \
                $(use_with infiniband) \
                $(use_with zeroconf discovery) \
                $(use_with systemd) \
                $(use_with perfevent) \
                $(use_with manager) \
                $(use_with webapi)
}

src_compile() {
        addwrite /var/lib/tmp/
        export MAKEOPTS="-j1"
        emake
}

src_install() {
        DIST_ROOT=${D} emake install
        dodoc CHANGELOG README.md
}
