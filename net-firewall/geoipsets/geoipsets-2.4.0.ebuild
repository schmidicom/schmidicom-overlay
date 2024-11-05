# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 systemd

DESCRIPTION="Python package to generate country-specific IP network ranges consumable by both iptables/ipset and nftables."
HOMEPAGE="https://github.com/chr0mag/geoipsets"
SRC_URI="https://github.com/chr0mag/geoipsets/archive/refs/tags/v2.4.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/geoipsets-2.4/python

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="
	>=dev-python/setuptools-51.1.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.10[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	sed -i -e 's~packages=find_packages(exclude=("tests",)),~packages=find_packages(),~g' ${S}/setup.py || die "Sed setup.py failed!"
	sed -i -e 's~/var/local~/var/db~g' ${WORKDIR}/geoipsets-2.4/systemd/update-geoipsets.service || die "Sed service unit failed!"
	default
}

python_install() {
	distutils-r1_python_install
	insinto /etc
	doins ${S}/geoipsets.conf
	systemd_dounit ${WORKDIR}/geoipsets-2.4/systemd/update-geoipsets.service
	systemd_dounit ${WORKDIR}/geoipsets-2.4/systemd/update-geoipsets.timer
}
