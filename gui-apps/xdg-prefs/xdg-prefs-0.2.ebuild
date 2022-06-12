# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="A GUI program to view and change your default programs' preferences (which program should open which type of file) using the XDG Specifications"
HOMEPAGE="https://github.com/rchaput/xdg-prefs"
SRC_URI="https://github.com/rchaput/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/${P}

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/pyside2"
RDEPEND="${DEPEND}"
BDEPEND=""
