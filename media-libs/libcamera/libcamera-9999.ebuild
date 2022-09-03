# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == *9999 ]]
then
	EGIT_REPO_URI="https://git.libcamera.org/libcamera/libcamera.git"
	inherit git-r3
	KEYWORDS="~amd64 ~arm64"
else
	SRC_URI="https://git.libcamera.org/${PN}/snapshot/${P}.tar.xz -> ${P}.tar.xz"
	#S=${WORKDIR}/${PN}-v${PV}
	KEYWORDS="amd64 arm64"
fi

DESCRIPTION="A complex camera support library for Linux, Android, and ChromeOS"
HOMEPAGE="https://git.libcamera.org/libcamera/libcamera.git/"

LICENSE="Apache-2.0 BSD CC0-1.0 CC-BY-SA-4.0 GPL-2 GPL-2+ LGPL-2.1 MIT"
SLOT="0"
IUSE="test-programm +v4l2"

DEPEND="dev-python/pyyaml
	dev-python/ply
	dev-libs/openssl
	virtual/udev
	test-programm? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qttools:5
		media-libs/tiff
		media-libs/libsdl2
		x11-libs/libdrm
		virtual/jpeg
	)"
RDEPEND="${DEPEND}"
BDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_feature test-programm cam)
		$(meson_feature test-programm qcam)
		$(meson_use v4l2)
	)
	meson_src_configure "-Dpipelines=ipu3,uvcvideo,vimc"
}
