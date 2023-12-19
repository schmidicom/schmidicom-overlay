# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Fast and secure initramfs generator"
HOMEPAGE="https://github.com/anatol/booster"
SRC_URI="https://github.com/anatol/booster/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://res.messerligroup.com/deploy/${P}-deps.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-apps/busybox
	dev-libs/libfido2"
RDEPEND="${DEPEND}"
BDEPEND="app-text/ronn-ng"

src_compile() {
	# build binary
	ego build -v -o generator_binary ./generator
	ego build -v -o init_binary ./init
	# build manpage
	ronn docs/manpage.md || die "build manpage failed!"
	mv docs/manpage.1 docs/booster.1 || die "rename manpage failed!"
}

src_install() {
	# install booster binary
	newbin generator_binary booster || die "install booster failed!"
	# install booster init
	exeinto /usr/lib/booster
	newexe init_binary init || die "install booster failed!"
	# install manpage
	doman docs/booster.1  || die "install booster failed!"
}
