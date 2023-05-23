# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.27.5
inherit ecm plasma.kde.org

DESCRIPTION="Klassy is a highly customizable binary Window Decoration and Application Style plugin for recent versions of the KDE Plasma desktop."
HOMEPAGE="https://github.com/paulmcauley/klassy"
SRC_URI="https://github.com/paulmcauley/${PN}/archive/refs/tags/${PV}.breeze${KFMIN}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2-with-patent CC0-1.0 GPL-2 GPL-3 MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S=${WORKDIR}/${P}.breeze${KFMIN}

DEPEND="dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	>=kde-frameworks/frameworkintegration-${KFMIN}:5
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kguiaddons-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kiconthemes-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-frameworks/kpackage-${KFMIN}:5
	>=kde-frameworks/qqc2-desktop-style-${KFMIN}:5
	kde-plasma/kdecoration:5
	sys-devel/gettext
	"
RDEPEND="${DEPEND}"
BDEPEND=""
