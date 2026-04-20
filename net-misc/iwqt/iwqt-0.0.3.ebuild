# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson

DESCRIPTION="An iwd network applet for linux systems"
HOMEPAGE="https://github.com/fingu/iwqt"
SRC_URI="https://github.com/FinGu/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-cpp/sdbus-c++
	dev-qt/qtbase:6[gui,widgets]
	dev-qt/qtsvg:6"
RDEPEND="${DEPEND}
	net-wireless/iwd"
BDEPEND=""

S="${WORKDIR}/${P}"
PATCHES=(
        "${FILESDIR}/${P}-desktop_fix.patch"
)
