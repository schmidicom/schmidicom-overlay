# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="melonDS"
MY_P="${MY_PN}-${PV}"

inherit cmake flag-o-matic toolchain-funcs xdg

DESCRIPTION="Nintendo DS emulator, sorta"
HOMEPAGE="
	http://melonds.kuribo64.net
	https://github.com/Arisotura/melonDS
"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Arisotura/${MY_PN}.git"
else
	SRC_URI="https://github.com/Arisotura/${MY_PN}/archive/${PV}.tar.gz -> ${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

IUSE="+jit +opengl"
LICENSE="BSD-2 GPL-2 GPL-3 Unlicense"
SLOT="0"

DEPEND="app-arch/libarchive
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	media-libs/libsdl2[sound,video]
	net-libs/libslirp
	net-libs/libpcap
	opengl? ( media-libs/libepoxy )"
RDEPEND="${DEPEND}
	dev-libs/teakra"
BDEPEND="dev-util/cmake"

# used for JIT recompiler
QA_EXECSTACK="usr/bin/melonDS"

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_JIT=$(usex jit)
		-DENABLE_OGLRENDERER=$(usex opengl)
	)
	cmake_src_configure
}

src_compile() {
	tc-export AR
	cmake_src_compile
}

pkg_postinst() {
	xdg_pkg_postinst

	elog "You need the following files in order to run melonDS:"
	elog "- bios7.bin"
	elog "- bios9.bin"
	elog "- firmware.bin"
	elog "- romlist.bin"
	elog "Place them in ~/.config/melonDS"
	elog "Those files can be found somewhere on the Internet ;-)"
}
