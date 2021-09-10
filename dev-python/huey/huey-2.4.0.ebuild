# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="a little task queue for python"
HOMEPAGE="https://github.com/coleifer/huey/"
SRC_URI="https://github.com/coleifer/huey/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/huey-${PV}
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
