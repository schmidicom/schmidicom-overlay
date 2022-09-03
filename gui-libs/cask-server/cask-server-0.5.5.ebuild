# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Public server and API to interface with Cask features"
HOMEPAGE="https://github.com/Nitrux/cask-server"
SRC_URI="https://github.com/Nitrux/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-${PV}

LICENSE="BSD-2 CC0-1.0 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-qt/qtcore:5
	dev-qt/qtdbus:5
	sys-devel/gcc
	sys-libs/glibc"
RDEPEND="${DEPEND}"
BDEPEND=""
