# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Maui Shell is a convergent shell for desktops, tablets, and phones."
HOMEPAGE="https://github.com/Nitrux/maui-shell"
SRC_URI="https://github.com/Nitrux/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-${PV}

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/mauikit
	dev-libs/mauikit-filebrowsing
	kde-frameworks/kdesu:5
	gui-libs/cask-server"
RDEPEND="${DEPEND}"
BDEPEND=""
