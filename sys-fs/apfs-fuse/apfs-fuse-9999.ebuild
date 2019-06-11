# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils git-r3

DESCRIPTION="FUSE driver for APFS (Apple File System)"
HOMEPAGE="https://github.com/sgan81/apfs-fuse"
SRC_URI=""
EGIT_REPO_URI="https://github.com/sgan81/apfs-fuse.git"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/bzip2
        sys-fs/fuse:3
        sys-libs/zlib
        sys-libs/glibc
        sys-devel/gcc"
RDEPEND="${DEPEND}"

src_configure() {
    cmake-utils_src_configure
}

src_compile() {
    cd ${BUILD_DIR}
    emake
}

src_install() {
    cd ${BUILD_DIR}
    dosbin apfs-dump
    dosbin apfs-dump-quick
    dosbin apfs-fuse
    #dosbin bin/lzfse
}
