# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Ambient noise player applet (plasmoid) for KDE Plasma 5"
HOMEPAGE="https://github.com/m-pilia/plasma-applet-ambientnoise"
SRC_URI="https://github.com/m-pilia/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
