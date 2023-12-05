# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The ACPI Component Architecture (ACPICA) project provides an open-source operating system-independent implementation of the Advanced Configuration and Power Interface specification (ACPI)"
HOMEPAGE="https://www.acpica.org/"
SRC_URI="https://github.com/acpica/acpica/archive/refs/tags/R06_28_23.tar.gz"

LICENSE="iASL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/bison
	sys-devel/flex"

S=${WORKDIR}/acpica-R06_28_23

PATCHES=(
	"${FILESDIR}"/fix_issue_with_GCC12.patch
)
