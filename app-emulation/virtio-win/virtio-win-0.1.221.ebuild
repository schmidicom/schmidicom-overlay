# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="VirtIO drivers for Windows virtual machines running on KVM"
HOMEPAGE="https://docs.fedoraproject.org/en-US/quick-docs/creating-windows-virtual-machines-using-virtio-drivers/index.html"
SRC_URI="https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/${P}-1/${P}.iso"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
S="${WORKDIR}"

src_install() {
	insinto /usr/share/drivers/windows
	doins "${DISTDIR}/${P}.iso"
}
