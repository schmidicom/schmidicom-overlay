# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="SMPP library for Python"
HOMEPAGE="https://github.com/podshumok/python-smpplib"
SRC_URI="https://github.com/podshumok/python-smpplib/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/python-smpplib-${PV}
RESTRICT="mirror"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-python/six"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/fix_setup.patch
)
