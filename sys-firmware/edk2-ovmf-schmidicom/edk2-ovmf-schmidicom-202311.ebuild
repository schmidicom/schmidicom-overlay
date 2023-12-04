# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Open Virtual Machine Firmware (OVMF) for QEMU, built with full Features-Support."
HOMEPAGE="http://www.tianocore.org/ovmf/"
EGIT_REPO_URI="https://github.com/tianocore/edk2/"
EGIT_COMMIT="refs/tags/edk2-stable${PV}"
inherit git-r3

LICENSE="BSD-2-with-patent"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-python/virt-firmware
	sys-power/iasl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	# Build BaseTools for Compile
	make -C BaseTools || die "Cannot build BaseTools!"

	# Setup the environment for unix-like systems running bash-like shell
	source ./edksetup.sh || die "Cannot setup Environment!"

	# Build OVMF
	build \
		-a X64 \
		-p OvmfPkg/OvmfPkgX64.dsc \
		-b RELEASE \
		-t GCC5 \
		-D SECURE_BOOT_ENABLE=TRUE \
		-D SMM_REQUIRE=TRUE \
		-D TPM2_ENABLE=TRUE \
		-D NETWORK_TLS_ENABLE=TRUE \
		-D NETWORK_IP6_ENABLE=TRUE \
		-D NETWORK_HTTP_ENABLE=TRUE \
		-D NETWORK_HTTP_BOOT_ENABLE=TRUE \
		-D PVSCSI_ENABLE=TRUE \
		-D MPT_SCSI_ENABLE=TRUE \
		-D LSI_SCSI_ENABLE=TRUE \
		|| die "Cannot build OVMF!"

	# Add SecureBoot-Keys
	virt-fw-vars \
		-i Build/OvmfX64/RELEASE_GCC5/FV/OVMF_VARS.fd \
		-o Build/OvmfX64/RELEASE_GCC5/FV/OVMF_VARS_SECURE.fd \
		--set-pk 85254ea7-4759-4fc4-82d4-5eed5fb0a4a0 ${FILESDIR}/Platform_Key.crt \
		--add-kek 77fa9abd-0359-4d32-bd60-28f4e78f784b ${FILESDIR}/Microsoft_Corporation_KEK_CA_2011.crt \
		--add-kek 77fa9abd-0359-4d32-bd60-28f4e78f784b ${FILESDIR}/Microsoft_Corporation_KEK_2K_CA_2023.crt \
		--add-db 77fa9abd-0359-4d32-bd60-28f4e78f784b ${FILESDIR}/Microsoft_Windows_Production_PCA_2011.crt \
		--add-db 77fa9abd-0359-4d32-bd60-28f4e78f784b ${FILESDIR}/Windows_UEFI_CA_2023.crt \
		--add-db 77fa9abd-0359-4d32-bd60-28f4e78f784b ${FILESDIR}/Microsoft_Corporation_UEFI_CA_2011.crt \
		--add-db 77fa9abd-0359-4d32-bd60-28f4e78f784b ${FILESDIR}/Microsoft_UEFI_CA_2023.crt \
		|| die "Cannot create NVRAM-Template with SecureBoot-Keys!"
}

src_install() {
	# Install OVMF with enrolled Keys
	dodir /usr/share/edk2-ovmf-schmidicom
	insinto /usr/share/edk2-ovmf-schmidicom
	doins Build/OvmfX64/RELEASE_GCC5/FV/OVMF_CODE.fd || die "Cannot install OVMF Binary-Loader!"
	doins Build/OvmfX64/RELEASE_GCC5/FV/OVMF_VARS_SECURE.fd || die "Cannot install OVMF NVRAM-Template!"

	# Install JSON for QEMU
	dodir /usr/share/qemu/firmware
	insinto /usr/share/qemu/firmware
	doins ${FILESDIR}/50-edk2-ovmf-x64-sb-schmidicom.json || die "Cannot install JSON-File for QEMU!"
}
