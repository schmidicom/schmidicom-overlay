# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools

DESCRIPTION="A complete implementation of the MS-NLMP documents as a GSSAPI mechanism"
HOMEPAGE="https://github.com/gssapi/gss-ntlmssp"
SRC_URI="https://github.com/gssapi/gss-ntlmssp/releases/download/v${PV}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-crypt/mit-krb5
	dev-libs/libxml2
	dev-libs/libxslt
	dev-libs/libunistring
	dev-libs/openssl
	sys-apps/findutils
	sys-devel/m4
	virtual/pkgconfig"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
