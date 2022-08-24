# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Intel ACPI Source Language (ASL) compiler"
HOMEPAGE="https://www.acpica.org/downloads/"
SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"

LICENSE="iASL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/bison
	sys-devel/flex"

S=${WORKDIR}/acpica-unix-${PV}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR=${D} install
	default

	dodoc ${S}/changes.txt
	newdoc "${S}"/source/compiler/readme.txt compiler-readme.txt
	newdoc "${S}"/source/compiler/new_table.txt compiler-new_table.txt
	newdoc "${S}"/generate/unix/readme.txt unix-readme.txt
}
