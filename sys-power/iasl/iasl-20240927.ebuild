# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The ACPI Component Architecture (ACPICA) project provides an open-source operating system-independent implementation of the Advanced Configuration and Power Interface specification (ACPI)"
HOMEPAGE="https://www.acpica.org/"
SRC_URI="https://github.com/acpica/acpica/archive/refs/tags/R09_27_24.tar.gz"

LICENSE="iASL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/bison
	sys-devel/flex"

S=${WORKDIR}/acpica-R09_27_24
