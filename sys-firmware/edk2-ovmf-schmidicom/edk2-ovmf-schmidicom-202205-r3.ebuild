# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="UEFI firmware for 64-bit x86 virtual machines"
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
	# Install OVMF and EnrollDefaultKeys.efi
	dodir /usr/share/edk2-ovmf-schmidicom
	insinto /usr/share/edk2-ovmf-schmidicom
	doins usr/share/edk2-ovmf-schmidicom/OVMF_CODE.fd || die "Cannot install OVMF_CODE!"
	doins usr/share/edk2-ovmf-schmidicom/OVMF_VARS.fd || die "Cannot install OVMF_VARS!"
	doins usr/share/edk2-ovmf-schmidicom/OVMF_VARS_enrolled.fd || die "Cannot install OVMF_VARS with enrolled keys!"
	doins usr/share/edk2-ovmf-schmidicom/EnrollDefaultKeys.efi || die "Cannot install EnrollDefaultKeys.efi!"

	# Install JSON for QEMU
	dodir /usr/share/qemu/firmware
	insinto /usr/share/qemu/firmware
	doins usr/share/qemu/firmware/50-edk2-ovmf-x64-sb-schmidicom.json || die "Cannot install Firmware-JSON for QEMU!"
	doins usr/share/qemu/firmware/50-edk2-ovmf-x64-sb-enrolled-schmidicom.json || die "Cannot install Firmware-JSON for QEMU with enrolled keys!"
}
