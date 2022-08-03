# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="RustDesk Server"
HOMEPAGE="https://rustdesk.com/"
SRC_URI="https://github.com/rustdesk/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="sys-devel/gcc
	sys-libs/glibc"
RDEPEND="${DEPEND}"
BDEPEND="virtual/rust"

RESTRICT="network-sandbox"

src_unpack() {
	unpack ${P}.tar.gz || die "Cannot unpack!"
}

src_prepare() {
	default
	cargo update || die "Cannot update Cargo!"
}

src_compile() {
	cargo build --release || die "Cannot build Package!"
}

src_install() {
	dosbin target/release/hbbr || die "Cannot install Binary"
	dosbin target/release/hbbs || die "Cannot install Binary"
	systemd_dounit ${FILESDIR}/rustdesk-hbbr.service || die "Cannot install Service-Unit"
	systemd_dounit ${FILESDIR}/rustdesk-hbbs.service || die "Cannot install Service-Unit"
	keepdir /var/lib/rustdesk-server/
	dodoc LICENSE 
}
