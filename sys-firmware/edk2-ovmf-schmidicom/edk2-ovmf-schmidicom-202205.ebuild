# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="UEFI firmware for 64-bit x86 virtual machines"
HOMEPAGE="https://github.com/tianocore/edk2"
SRC_URI="https://res.messerligroup.com/deploy/edk2-ovmf-schmidicom/${P}.tar.gz"

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
	doins OvmfX64/RELEASE_GCC5/FV/OVMF_CODE.fd || die "Cannot install OVMF_CODE!"
	doins OvmfX64/RELEASE_GCC5/FV/OVMF_VARS.fd || die "Cannot install OVMF_VARS!"
	doins OvmfX64/RELEASE_GCC5/X64/EnrollDefaultKeys.efi || die "Cannot install EnrollDefaultKeys.efi!"

	# Install JSON for QEMU
	dodir /usr/share/qemu/firmware
	insinto /usr/share/qemu/firmware
	doins ${FILESDIR}/50-edk2-ovmf-x64-sb-schmidicom.json || die "Cannot install Firmware-JSON for QEMU!"
}
