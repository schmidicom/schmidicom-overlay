# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake systemd git-r3

DESCRIPTION="Gadget-tool - Linux command line tool for setting USB gadget using configFS"
HOMEPAGE="https://www.kernel.org/doc/html/latest/usb/gadget_configfs.html"
EGIT_REPO_URI="https://github.com/linux-usb-gadgets/gt"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/libusbgx"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-9999/source"
