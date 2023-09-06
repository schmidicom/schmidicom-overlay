# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="UEFI firmware for 64-bit x86 virtual machines, with secureboot and more."
HOMEPAGE="https://github.com/tianocore/edk2"
SRC_URI="https://res.messerligroup.com/deploy/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	unpack ${P}.tar.gz || die "Cannot unpack!"
}

src_prepare() {
	default
}

src_install() {
	# Install OVMF with enrolled Keys
	dodir /usr/share/edk2-ovmf-schmidicom
	insinto /usr/share/edk2-ovmf-schmidicom
	doins usr/share/edk2-ovmf-schmidicom/OVMF_CODE.fd || die "Cannot install OVMF_CODE!"
	doins usr/share/edk2-ovmf-schmidicom/OVMF_VARS.fd || die "Cannot install OVMF_VARS!"

	# Install JSON for QEMU
	dodir /usr/share/qemu/firmware
	insinto /usr/share/qemu/firmware
	doins usr/share/qemu/firmware/50-edk2-ovmf-x64-sb-schmidicom.json || die "Cannot install Firmware-JSON for QEMU!"
}
