# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..15} )
inherit cmake python-single-r1

DESCRIPTION="Industrial Precision global theme for KDE Plasma"
HOMEPAGE="https://github.com/loofiboss-bit/NoxForge"
SRC_URI="https://github.com/loofiboss-bit/NoxForge/archive/refs/tags/v${PV}.tar.gz  https://github.com/chaos/scrub/releases/download/2.6.1/scrub-2.6.1.tar.gz"

S=${WORKDIR}/NoxForge-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-qt/qtbase
	media-libs/libglvnd"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	cmake_src_install
	python_fix_shebang "${ED}/usr/bin/noxforge-doctor" \
		"${ED}/usr/bin/noxforge-opacity" \
		"${ED}/usr/bin/noxforge-ctl" \
		"${ED}/usr/share/noxforge/opacity_gui.py" \
		"${ED}/usr/share/noxforge/control_center.py"
}
