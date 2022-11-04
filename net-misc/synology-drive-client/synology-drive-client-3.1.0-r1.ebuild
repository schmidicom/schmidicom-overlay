# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Synology Drive Client"
HOMEPAGE="https://www.synology.com/de-de/dsm/feature/drive"
SRC_URI="https://global.download.synology.com/download/Utility/SynologyDriveClient/3.1.0-12923/Ubuntu/Installer/x86_64/synology-drive-client-12923.x86_64.deb -> ${P}.deb"

LICENSE="Synology"
SLOT="0"
KEYWORDS="amd64"
IUSE="nautilus"

DEPEND="dev-libs/glib
	x11-libs/gtk+:2
	virtual/libc
	nautilus? ( gnome-base/nautilus )"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
	unpack ${A}
	unpack ${S}/data.tar.xz
	rm ${S}/_gpgbuilder ${S}/control.tar.gz ${S}/data.tar.xz ${S}/debian-binary
}

src_install() {
	cp -a ${PORTAGE_BUILDDIR}/work/* ${D}/

	if ! use nautilus ; then
		rm -r ${D}/usr/lib/nautilus
	fi
}
