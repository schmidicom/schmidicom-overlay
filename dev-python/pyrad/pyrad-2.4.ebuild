# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Python RADIUS Implementation"
HOMEPAGE="https://github.com/pyradius/pyrad"
SRC_URI="https://github.com/pyradius/pyrad/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/pyrad-${PV}
RESTRICT="mirror"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-python/six
	dev-python/netaddr"
RDEPEND="${DEPEND}"
BDEPEND=""
