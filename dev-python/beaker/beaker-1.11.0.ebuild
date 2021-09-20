# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="A Session and Caching library with WSGI Middleware"
HOMEPAGE="https://beaker.readthedocs.io/"
SRC_URI="https://files.pythonhosted.org/packages/04/7b/a3eb9939d931a55c69e4bcaa82dbc64f6df9612c374e782f4ab3c176910e/Beaker-${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/Beaker-${PV}
RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-python/pycryptodome
        dev-python/cryptography"
RDEPEND="${DEPEND}"
BDEPEND=""
