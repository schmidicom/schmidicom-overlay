# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils toolchain-funcs

DESCRIPTION="Simple Dynamic Strings"
HOMEPAGE="https://github.com/antirez/sds"
SRC_URI="https://github.com/antirez/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	default
	echo "typedef int sdsvoid;" >> sdsalloc.h || die
}

src_compile() {
	# https://github.com/antirez/sds/issues/97
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} \
	-std=c99 -pedantic -Wall -Werror -shared -fPIC \
	-o "libsds.so.${PV}" -Wl,-soname="libsds.so.${PV}" sds.c sds.h sdsalloc.h || die
}

src_test() {
	emake
}

src_install() {
	insinto  /usr/$(get_libdir)/
	dolib.so "libsds.so.${PV}" || die "dolib.so failed."
	dosym "libsds.so.${PV}" /usr/$(get_libdir)/libsds.so
	dosym "libsds.so.${PV}" "/usr/$(get_libdir)/libsds.so.${PV%%.*}"

	insinto /usr/include/sds
	doins sds.h || die "doins failed."
}
