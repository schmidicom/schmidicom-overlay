# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils

DESCRIPTION="Performance Co-Pilot, system performance and analysis framework"
HOMEPAGE="https://pcp.io/"
SRC_URI="https://github.com/performancecopilot/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="LGPL-2.1+"

KEYWORDS="x86 amd64"
IUSE="+discovery +infiniband +manager +perfevent +pie python qt5 +ssp systemd +threads +webapi X"
SLOT="0"

DEPEND=" systemd? ( sys-apps/systemd )
         X? ( x11-libs/libXt )
         qt5? ( dev-qt/qtcore:5 )
         python? ( dev-lang/python )
         perfevent? ( dev-libs/libpfm )
         discovery? ( net-dns/avahi[dbus] )
         acct-user/pcp"
RDEPEND="${DEPEND}"

scr_configure() {
        econf \
                $(use_enable ssp) \
                $(use_enable pie) \
                $(use_with threads) \
                $(use_with infiniband) \
                $(use_with discovery) \
                $(use_with systemd) \
                $(use_with perfevent) \
                $(use_with manager) \
                $(use_with webapi) \
                $(use_with X x) \
                $(use_with qt5 qt)
}

src_compile() {
        emake
}

src_install() {
        DIST_ROOT=${D} emake install
        dodoc CHANGELOG README.md
}
