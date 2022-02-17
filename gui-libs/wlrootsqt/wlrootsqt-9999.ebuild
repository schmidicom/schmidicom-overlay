# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

if [[ ${PV} == *9999 ]]
then
	EGIT_REPO_URI="https://gitlab.com/wlrootsqt/wlrootsqt"
	inherit git-r3
	KEYWORDS="~amd64 ~arm64"
else
	SRC_URI="https://gitlab.com/wlrootsqt/wlrootsqt/-/archive/v${PV}/wlrootsqt-v${PV}.tar.gz -> ${P}.tar.gz"
	S=${WORKDIR}/${PN}-v${PV}
	KEYWORDS="amd64 arm64"
fi

DESCRIPTION="A Qt-based wrapper for various wayland protocols."
HOMEPAGE="https://gitlab.com/wlrootsqt/wlrootsqt"

LICENSE="GPL-3"
SLOT="0"

DEPEND="dev-qt/qtcore:5
	dev-libs/wayland
	dev-libs/wayland-protocols
	gui-libs/wlroots"
RDEPEND="${DEPEND}
	gui-libs/greetd"
