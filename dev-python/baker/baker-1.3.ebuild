# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Easy, powerful access to Python functions from the command line"
HOMEPAGE="http://bitbucket.org/mchaput/baker"
SRC_URI="https://files.pythonhosted.org/packages/43/84/4a0ed2bd69b8079a5f8a8eda478c7ebe267e65f3f87a61a0b56353b6961c/Baker-${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/Baker-${PV}
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
