# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="optional"
ECM_TEST="optional"
KFMIN=5.102.0
QTMIN=5.15.0
inherit ecm plasma.kde.org

DESCRIPTION="KWinFT (KWin Fast Track) is a robust, fast and versatile yet easy to use composited window manager for the Wayland and X11 windowing systems on Linux."
HOMEPAGE="https://gitlab.com/kwinft/kwinft"
SRC_URI="https://gitlab.com/kwinft/kwinft/-/archive/${PN}@${PV}/${PN}-${PN}@${PV}.tar.bz2 -> {P}.tar.bz2"

LICENSE="GPL-2+"
SLOT="5"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-qt/qtcore-${QTMIN}:5
	>=dev-qt/qtconcurrent-${QTMIN}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtquickcontrols-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtx11extras-${QTMIN}:5
	>=kde-frameworks/kauth-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/kcoreaddons-${KFMIN}:5
	>=kde-frameworks/kcrash-${KFMIN}:5
	>=kde-frameworks/kglobalaccel-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kidletime-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kpackage-${KFMIN}:5
	>=kde-frameworks/kwayland-${KFMIN}:5
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:5
	>=kde-frameworks/kwindowsystem-${KFMIN}:5
	>=kde-frameworks/kdeclarative-${KFMIN}:5
	>=kde-frameworks/kcmutils-${KFMIN}:5
	>=kde-frameworks/knewstuff-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/kxmlgui-${KFMIN}:5
	>=kde-frameworks/kitemviews-${KFMIN}:5
	>=kde-frameworks/kdbusaddons-${KFMIN}:5
	>=kde-frameworks/kdoctools-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
	kde-plasma/kdecoration:5
	kde-plasma/kscreenlocker
	kde-plasma/breeze
	>=media-libs/libepoxy-1.3.0[X]
	>=dev-libs/wayland-1.2
	>=x11-libs/libxkbcommon-0.7.0
	>=x11-libs/libxcb-1.10
	>=dev-libs/libinput-1.9
	x11-libs/pixman
	>=gui-libs/wlroots-0.16.0
	media-libs/freetype
	dev-libs/wrapland
	x11-base/xwayland
	sys-libs/libcap
	"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${PN}-${PN}@${PV}
