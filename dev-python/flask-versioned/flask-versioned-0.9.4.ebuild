# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Add version info to file paths"
HOMEPAGE="http://github.com/pilt/flask-versioned"
SRC_URI="https://files.pythonhosted.org/packages/52/cf/c005563642a7983fc172a1227b5817d61b8f67bce30a82e89ae02803635d/Flask-Versioned-${PV}-20101221.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/Flask-Versioned-${PV}-20101221
RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-python/flask"
RDEPEND="${DEPEND}"
BDEPEND=""
