# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils pam

DESCRIPTION="Server Administration Web Interface"
HOMEPAGE="http://cockpit-project.org/"
SRC_URI="https://github.com/cockpit-project/${PN}/releases/download/${PV}/${P}.tar.xz"
LICENSE="LGPL-2.1+"

if [[ ${PV} == 9999* ]] ; then
        inherit git-r3
        EGIT_REPO_URI="https://github.com/cockpit-project/cockpit.git"
        KEYWORDS=""
fi

KEYWORDS="x86 amd64"
IUSE="debug doc firewalld libvirt lvm maintainer-mode networkmanager -pcp +ssh"
SLOT="0"

DEPEND="firewalld? ( net-firewall/firewalld )
        libvirt? ( app-emulation/libvirt )
        lvm? ( sys-fs/lvm2 )
        networkmanager? ( net-misc/networkmanager )
        pcp? ( sys-apps/pcp )
        ssh? ( net-libs/libssh[server] )
        dev-util/gdbus-codegen
        dev-libs/json-glib
        net-libs/nodejs[npm]
        net-libs/glib-networking
        sys-fs/udisks
        app-admin/sudo"
RDEPEND="${DEPEND}"

src_configure() {
        econf \
                $(use_enable debug) \
                $(use_enable doc) \
                $(use_enable maintainer-mode) \
                $(use_enable pcp) \
                $(use_enable ssh)
}

src_compile() {
        emake
}

src_install() {
        emake DESTDIR="${D}" install
        newpamd "${FILESDIR}/cockpit.pam" cockpit
        dodoc AUTHORS README.md
}
