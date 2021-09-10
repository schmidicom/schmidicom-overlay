# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="The kitchen sink of Python utility libraries for doing "stuff" in a functional way. Based on the Lo-Dash Javascript library."
HOMEPAGE="https://github.com/dgilland/pydash"
SRC_URI="https://github.com/dgilland/pydash/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/pydash-${PV}
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
