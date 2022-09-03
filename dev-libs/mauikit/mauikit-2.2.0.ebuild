# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Templated convergent controls and multi-platform utilities for Maui applications"
HOMEPAGE="https://invent.kde.org/maui/mauikit"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-v${PV}

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/bzip2
	app-arch/lz4
	app-arch/xz-utils
	app-arch/zstd
	app-crypt/libmd
	app-crypt/mit-krb5
	dev-libs/double-conversion
	dev-libs/glib
	dev-libs/icu
	dev-libs/libbsd
	dev-libs/libdbusmenu-qt
	dev-libs/libgcrypt
	dev-libs/libgpg-error
	dev-libs/libpcre
	dev-libs/libpcre2
	dev-libs/mauiman
	dev-libs/openssl
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtquickcontrols2:5
	dev-qt/qtspeech:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5
	kde-frameworks/kconfig
	kde-frameworks/kcoreaddons
	kde-frameworks/ki18n
	kde-frameworks/knotifications
	kde-frameworks/kwindowsystem
	media-gfx/graphite2
	media-libs/flac
	media-libs/freetype
	media-libs/harfbuzz
	media-libs/libglvnd
	media-libs/libogg
	media-libs/libpng
	media-libs/libpulse
	media-libs/libsndfile
	media-libs/libvorbis
	media-libs/opus
	media-libs/phonon
	media-sound/lame
	media-sound/mpg123
	net-libs/libasyncns
	sys-apps/dbus
	sys-apps/keyutils
	sys-apps/systemd
	sys-devel/gcc
	sys-fs/e2fsprogs
	sys-libs/glibc
	sys-libs/libcap
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXtst
	x11-libs/libxcb
	x11-libs/xcb-util-keysyms"
RDEPEND="${DEPEND}"
BDEPEND=""
