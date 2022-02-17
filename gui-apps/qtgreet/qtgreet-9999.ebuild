# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == *9999 ]]
then
	EGIT_REPO_URI="https://gitlab.com/marcusbritanicus/QtGreet"
	inherit git-r3
	KEYWORDS="~amd64 ~arm64"
else
	SRC_URI="https://gitlab.com/marcusbritanicus/QtGreet/-/archive/v${PV}/QtGreet-v${PV}.tar.gz -> ${P}.tar.gz"
	S=${WORKDIR}/${PN}-v${PV}
	KEYWORDS="amd64 arm64"
fi

DESCRIPTION="Qt based greeter for greetd, to be run under wayfire or similar wlr-based compositors."
HOMEPAGE="https://gitlab.com/marcusbritanicus/QtGreet"

LICENSE="GPL-3"
SLOT="0"
IUSE="+wayfire"

DEPEND="dev-libs/json-c
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtnetwork:5
	gui-libs/wlrootsqt"
RDEPEND="${DEPEND}
	gui-libs/greetd
	wayfire? ( gui-wm/wayfire )"
