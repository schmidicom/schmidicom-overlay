# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools eutils toolchain-funcs

_PN="libjwt"
DESCRIPTION="JWT C Library"
HOMEPAGE="https://github.com/benmcollins/libjwt"
SRC_URI="https://github.com/benmcollins/${_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gnutls +ssl"

RDEPND="
	ssl? (
		gnutls? ( net-libs/gnutls:= )
		!gnutls? ( dev-libs/openssl:0= )
	)
"

DEPEND="
	${RDEPEND}
	dev-libs/jansson
"

S="${WORKDIR}/${_PN}-${PV}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local _conf

	if use ssl ; then
		if use gnutls ; then
			_conf=(--without-openssl)
		fi
	fi
	econf "${_conf[@]}"
}
