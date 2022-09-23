# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-info

DESCRIPTION="Sound Open Firmware (SOF) binary files"
HOMEPAGE="https://www.sofproject.org https://github.com/thesofproject/sof https://github.com/thesofproject/sof-bin"
SRC_URI="https://github.com/thesofproject/sof-bin/files/9632845/sof-bin-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}/sof-bin-v${PV}

DEPEND=">=media-libs/alsa-lib-1.2.5
        >=media-libs/alsa-ucm-conf-1.2.5"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_setup() {
	if kernel_is lt 5 15; then
		die 'Kernel is too old - need 5.15 or above'
	fi
	local CONFIG_CHECK="FW_LOADER"
	linux-info_pkg_setup
}

src_install() {
	mkdir -p ${D}/lib/firmware/intel || die
	mkdir -p ${D}/usr/bin || die

	cd ${S}
	rsync -a sof-tplg-v${PV} ${D}/lib/firmware/intel/
	rsync -a sof-v${PV} ${D}/lib/firmware/intel/
	ln -s sof-tplg-v${PV} ${D}/lib/firmware/intel/sof-tplg
	ln -s sof-v${PV} ${D}/lib/firmware/intel/sof
	rsync tools-v${PV}/* ${D}/usr/bin/
}
