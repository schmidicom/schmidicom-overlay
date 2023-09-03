# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake git-r3

DESCRIPTION="Nintendo Switch emulator"
HOMEPAGE="https://yuzu-emu.org/"
EGIT_REPO_URI="https://github.com/yuzu-emu/yuzu"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-devel/gcc-12.0.0
	>=sys-devel/clang-14.0.0
	media-video/ffmpeg
	>=media-libs/libsdl2-2.0.18
	media-libs/opus
	>=dev-qt/qtcore-5.15:5
	>=dev-qt/qtgui-5.15:5
	>=dev-qt/qtmultimedia-5.15:5
	>=dev-qt/qtwidgets-5.15:5
	>=dev-qt/qtdbus-5.15:5
	>=dev-qt/qtconcurrent-5.15:5
	>=dev-qt/linguist-tools-5.15:5
	>=dev-qt/qtwebengine-5.15:5
	>=dev-libs/boost-1.79.0[context]
	>=dev-libs/Catch2-2.13.9
	>=dev-libs/libfmt-8.0.1
	>=app-arch/lz4-1.8.0
	>=dev-cpp/nlohmann_json-3.8.0
	>=dev-libs/openssl-1.1.1
	>=sys-libs/zlib-1.2.0
	>=app-arch/zstd-1.5.0"
RDEPEND="${DEPEND}"
BDEPEND=""
