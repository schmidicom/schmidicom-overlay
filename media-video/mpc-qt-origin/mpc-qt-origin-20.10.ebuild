# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit qmake-utils

DESCRIPTION="Media Player Classic Qute Theater"
HOMEPAGE="https://github.com/cmdrkotori/mpc-qt-origin"
SRC_URI="https://github.com/cmdrkotori/mpc-qt-origin/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore
	dev-qt/qtdbus
	dev-qt/qtgui
	dev-qt/qtnetwork
	dev-qt/qtwidgets
	dev-qt/qtx11extras
	media-libs/libglvnd
	media-video/mpv[libmpv]
	sys-devel/gcc
	sys-libs/glibc"
DEPEND="${RDEPEND}
"

src_configure() {
	eqmake5 \
		PREFIX="${D}"
}

src_install() {
	emake install || die "Install failed!"
}
