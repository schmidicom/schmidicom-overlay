# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

if [[ ${PV} == *9999 ]]
then
	EGIT_REPO_URI="https://github.com/chris2511/xca"
	KEYWORDS="~amd64 ~arm64"
	inherit git-r3
else
	SRC_URI="https://github.com/chris2511/xca/archive/refs/tags/RELEASE.${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 arm64"
fi

DESCRIPTION="X Certificate and Key management"
HOMEPAGE="http://xca.hohnstaedt.de/"

LICENSE="BSD"
SLOT="0"
IUSE="doc"

RDEPEND="
        dev-libs/libltdl:0=
        dev-qt/qthelp:5
        dev-qt/qtgui:5
        dev-qt/qtsql:5[sqlite]
        dev-qt/qtwidgets:5
        dev-libs/openssl:0/3
        doc? ( app-text/linuxdoc-tools )"
DEPEND="${RDEPEND}"
BDEPEND="dev-qt/linguist-tools:5"
