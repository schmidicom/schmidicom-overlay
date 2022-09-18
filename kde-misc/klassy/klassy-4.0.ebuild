# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Klassy is a highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop."
HOMEPAGE="https://github.com/paulmcauley/klassy"
SRC_URI="https://github.com/paulmcauley/klassy/archive/refs/tags/4.0.breeze5.25.80.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2-with-patent CC0-1.0 GPL-2 GPL-3 MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S=${WORKDIR}/klassy-4.0.breeze5.25.80

DEPEND=">=kde-frameworks/kconfig-5.25.80
	>=kde-frameworks/kguiaddons-5.25.80
	>=kde-frameworks/kconfigwidgets-5.25.80
	>=kde-frameworks/kwindowsystem-5.25.80
	>=kde-frameworks/kcoreaddons-5.25.80
	>=kde-frameworks/kiconthemes-5.25.80
	>=kde-frameworks/kpackage-5.25.80
	>=kde-frameworks/qqc2-desktop-style-5.25.80
	>=kde-frameworks/kcmutils-5.25.80
	>=kde-frameworks/kirigami-5.25.80
	>=kde-frameworks/ki18n-5.25.80
	kde-plasma/kdecoration
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtdbus:5
	dev-qt/qtx11extras:5
	dev-qt/qtdeclarative:5
	sys-devel/gettext
	"
RDEPEND="${DEPEND}"
BDEPEND=""
