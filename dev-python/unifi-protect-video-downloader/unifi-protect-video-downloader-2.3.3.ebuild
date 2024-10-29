# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Tool to download footage from a local UniFi Protect system."
HOMEPAGE="https://github.com/danielfernau/unifi-protect-video-downloader"
SRC_URI="https://github.com/danielfernau/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/${P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
