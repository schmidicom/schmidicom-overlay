# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="MauiKit File Browsing utilities and controls"
HOMEPAGE="https://invent.kde.org/maui/mauikit-filebrowsing"
SRC_URI="https://invent.kde.org/maui/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-v${PV}

LICENSE="BSD-2 CC0-1.0 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/mauikit
	dev-qt/qtcore:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtsql:5
	dev-qt/qtxml:5
	kde-frameworks/kconfig:5
	kde-frameworks/kio:5
	kde-frameworks/kservice:5
	kde-frameworks/solid:5
	sys-devel/gcc
	sys-libs/glibc"
RDEPEND="${DEPEND}"
BDEPEND=""
