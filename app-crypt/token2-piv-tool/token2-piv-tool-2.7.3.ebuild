# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="The Token2 Fork of Yubico PIV Tool"
HOMEPAGE="https://github.com/token2/fido2-manage"
SRC_URI="https://res.messerligroup.com/deploy/token2-piv-tool-${PV}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="sys-apps/pcsc-lite
	dev-libs/openssl:=[-bindist(-)]
	virtual/zlib:="
DEPEND="${RDEPEND}
	test? ( dev-libs/check )"
BDEPEND="dev-util/gengetopt
	sys-apps/help2man
	virtual/pkgconfig
	test? ( dev-libs/check )"

src_configure() {
	local mycmakeargs=(
		-DBUILD_STATIC_LIB=OFF
		-DBUILD_TESTING=$(usex test)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	dosym -r ${EPREFIX}/usr/$(get_libdir)/libt2cs11.so /usr/$(get_libdir)/pkcs11/libt2cs11.so
	echo "module: libt2cs11.so" > ${PN}.module \
		|| die "Failed to generate p11-kit module configuration"
	insinto /usr/share/p11-kit/modules
	doins ${PN}.module
}
