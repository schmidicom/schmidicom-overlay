# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils git-r3

DESCRIPTION="Plasma 5 widget that gives access to user places"
HOMEPAGE="https://store.kde.org/p/1084935"
SRC_URI=""
EGIT_REPO_URI="https://github.com/dfaust/plasma-applet-places-widget.git"
EGIT_COMMIT="v${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="kde-plasma/plasma-workspace"
RDEPEND="${DEPEND}"

src_configure() {
    cmake-utils_src_configure
}

src_compile() {
    cd ../plasma-applet-places-widget-${PV}_build
    emake
}

src_install() {
    cd ../plasma-applet-places-widget-${PV}_build
    emake DESTDIR="${D}" install
}
