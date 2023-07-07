# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

QTMIN=5.15.0
inherit ecm

DESCRIPTION="Wrapland is a Qt/C++ library that wraps and mediates the libwayland client and server API for its consumers."
HOMEPAGE="https://gitlab.com/kwinft/wrapland"
SRC_URI="https://gitlab.com/kwinft/wrapland/-/archive/${PN}@${PV}/${PN}-${PN}@${PV}.tar.bz2 -> ${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-qt/qtconcurrent-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-libs/wayland-1.8.0
	>=dev-util/wayland-scanner-1.8.0
	>=dev-libs/wayland-protocols-1.27
"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${PN}-${PN}@${PV}
