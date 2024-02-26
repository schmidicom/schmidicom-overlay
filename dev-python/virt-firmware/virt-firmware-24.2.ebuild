# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..12} )
inherit distutils-r1 systemd

DESCRIPTION="Tools for ovmf / armvirt firmware volumes."
HOMEPAGE="https://gitlab.com/kraxel/virt-firmware"
SRC_URI="https://gitlab.com/kraxel/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/${PN}-v${PV}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-python/pefile[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""
