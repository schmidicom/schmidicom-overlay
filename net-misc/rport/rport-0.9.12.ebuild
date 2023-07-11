# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module systemd

DESCRIPTION="Self-hosted open source remote management solution for Windows, macOS & Linux."
HOMEPAGE="https://rport.io/"
SRC_URI="https://github.com/realvnc-labs/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://res.messerligroup.com/deploy/${P}-deps.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+client server"

S=${WORKDIR}/${P}

DEPEND="acct-user/rport"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	rm ${S}/Makefile || die "Remove Makefile failed!"
	eapply_user
}

src_compile() {
	if use client ; then
		ego build ./cmd/rport
	fi

	if use server ; then
		ego build ./cmd/rportd
	fi
}

src_install() {
	if use client ; then
		dobin rport || die "Install of rport binary failed!"
		systemd_dounit ${FILESDIR}/rport.service
		insinto /etc/rport
		doins rport.example.conf
	fi

	if use server ; then
		dobin rportd  || die "Install of rportd binary failed!"
		systemd_dounit ${FILESDIR}/rportd.service
		insinto /etc/rport
		doins rportd.example.conf
	fi
}
