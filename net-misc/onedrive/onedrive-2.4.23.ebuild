# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A free Microsoft OneDrive Client which supports OneDrive Personal, OneDrive for Business, OneDrive for Office365 and SharePoint."
HOMEPAGE="https://github.com/abraunegg/onedrive"
SRC_URI="https://github.com/abraunegg/onedrive/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-db/sqlite-3.7.15
	>=dev-lang/dmd-2.088.0
	net-misc/curl"
RDEPEND="${DEPEND}"
BDEPEND=""
