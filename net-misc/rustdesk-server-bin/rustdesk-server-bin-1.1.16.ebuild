# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd

DESCRIPTION="RustDesk Server"
HOMEPAGE="https://rustdesk.com/"
SRC_URI="x86? ( https://github.com/rustdesk/rustdesk-server/releases/download/${PV}/rustdesk-server-linux-i386.zip -> ${P}-x86.zip )
	amd64? ( https://github.com/rustdesk/rustdesk-server/releases/download/${PV}/rustdesk-server-linux-amd64.zip -> ${P}-amd64.zip )
	arm64? ( https://github.com/rustdesk/rustdesk-server/releases/download/${PV}/rustdesk-server-linux-arm64v8.zip -> ${P}-arm64.zip )"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="x86 amd64 arm64"

DEPEND="acct-user/rustdesk-server"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_unpack() {
	if use x86 ; then
		unpack ${P}-x86.zip
	elif use amd64 ; then
		unpack ${P}-amd64.zip
	elif use arm64 ; then
		unpack ${P}-arm64.zip
	fi
}

src_install() {
	if use x86 ; then
		dobin ${WORKDIR}/i386/hbbr || die "Cannot install RustDesk-Server Binary"
		dobin ${WORKDIR}/i386/hbbs || die "Cannot install RustDesk-Server Binary"
		dobin ${WORKDIR}/i386/rustdesk-utils || die "Cannot install RustDesk-Server Binary"
	elif use amd64 ; then
		dobin ${WORKDIR}/amd64/hbbr || die "Cannot install RustDesk-Server Binary"
		dobin ${WORKDIR}/amd64/hbbs || die "Cannot install RustDesk-Server Binary"
		dobin ${WORKDIR}/amd64/rustdesk-utils || die "Cannot install RustDesk-Server Binary"
	elif use arm64 ; then
		dobin ${WORKDIR}/arm64v8/hbbr || die "Cannot install RustDesk-Server Binary"
		dobin ${WORKDIR}/arm64v8/hbbs || die "Cannot install RustDesk-Server Binary"
		dobin ${WORKDIR}/arm64v8/rustdesk-utils || die "Cannot install RustDesk-Server Binary"
	fi

	systemd_dounit ${FILESDIR}/rustdesk-hbbr.service || die "Cannot install Service-Unit"
	systemd_dounit ${FILESDIR}/rustdesk-hbbs.service || die "Cannot install Service-Unit"
	doconfd ${FILESDIR}/rustdesk-server || die "Cannot install Config-File"

	keepdir /var/log/rustdesk-server || die "Failed to create Folder"
	fowners -R rustdesk-server:rustdesk-server /var/log/rustdesk-server || die "Failed to set Owner"

	dodoc ${FILESDIR}/LICENSE || die "Cannto install LICENSE File"
}
