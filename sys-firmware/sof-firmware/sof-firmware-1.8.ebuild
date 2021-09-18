# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Sound Open Firmware (SOF) binary files"

HOMEPAGE="https://www.sofproject.org https://github.com/thesofproject/sof https://github.com/thesofproject/sof-bin"
SRC_URI="https://github.com/thesofproject/sof-bin/releases/download/v1.8/sof-bin-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

S=${WORKDIR}/sof-bin-v${PV}
FW_DEST=${D}/lib/firmware/intel

DEPEND=">=media-libs/alsa-lib-1.2.5
        >=media-libs/alsa-ucm-conf-1.2.5"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	mkdir -p ${D}/lib/firmware/intel || die
	mkdir -p ${D}/usr/bin || die

	cd ${S}
	rsync -a sof*v${PV} ${D}/lib/firmware/intel/
	ln -s sof-v${PV} ${D}/lib/firmware/intel/sof
	ln -s sof-tplg-v${PV} ${D}/lib/firmware/intel/sof-tplg
	rsync tools-v${PV}/* ${D}/usr/bin/
}
