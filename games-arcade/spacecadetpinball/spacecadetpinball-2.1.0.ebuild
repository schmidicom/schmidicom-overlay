# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Reverse engineering of 3D Pinball for Windows - Space Cadet, a game bundled with Windows."
HOMEPAGE="https://github.com/k4zmu2a/SpaceCadetPinball"
SRC_URI="https://github.com/k4zmu2a/SpaceCadetPinball/archive/refs/tags/Release_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-devel/gcc
	media-libs/libsdl2
	media-libs/sdl2-mixer[midi]"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/SpaceCadetPinball-Release_${PV}"
