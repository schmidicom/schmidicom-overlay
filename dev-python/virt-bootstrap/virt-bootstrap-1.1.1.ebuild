# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="virt-bootstrap is a tool providing an easy way to setup the root file system for libvirt-based containers"
HOMEPAGE="https://github.com/virt-manager/virt-bootstrap"
SRC_URI="https://github.com/virt-manager/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/${P}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-containers/skopeo
	app-emulation/libvirt-sandbox
	app-emulation/libguestfs[python]
	dev-python/passlib"
RDEPEND="${DEPEND}"
BDEPEND=""
