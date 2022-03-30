# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#inherit autotools

DESCRIPTION="Libvirt Sandbox: An application sandbox toolkit"
HOMEPAGE="https://sandbox.libvirt.org/"
SRC_URI="https://libvirt.org/sources/sandbox/${P}.tar.gz"

S=${WORKDIR}/${P}

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="sys-libs/libselinux"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	#eautoreconf
}

src_configure() {
	econf
#	econf \
#		--disable-gtk-doc \
#		--disable-gtk-doc-html \
#		--disable-gtk-doc-pdf
}

src_install() {
	default
}
