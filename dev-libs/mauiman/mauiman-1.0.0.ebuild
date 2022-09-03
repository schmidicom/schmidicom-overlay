# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Maui Manager Library. Server and public library API."
HOMEPAGE="https://invent.kde.org/maui/mauiman"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-v${PV}

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/lz4
	app-arch/xz-utils
	app-arch/zstd
	dev-libs/double-conversion
	dev-libs/glib
	dev-libs/icu
	dev-libs/libgcrypt
	dev-libs/libpcre
	dev-libs/libpcre2
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	sys-apps/dbus
	sys-apps/systemd
	sys-devel/gcc
	sys-libs/glibc
	sys-libs/libcap
	sys-libs/zlib"
RDEPEND="${DEPEND}"
BDEPEND=""
