# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="wrapper for libsodium providing high level crypto primitives"
HOMEPAGE="https://github.com/stef/pysodium"
SRC_URI="https://github.com/stef/pysodium/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/pysodium-${PV}
RESTRICT="mirror"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-libs/libsodium"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/fix_test.patch"
)
