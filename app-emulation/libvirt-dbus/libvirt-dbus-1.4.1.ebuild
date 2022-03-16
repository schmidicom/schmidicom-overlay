# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="DBus protocol binding for libvirt native C API"
HOMEPAGE="https://libvirt.org/dbus.html"
SRC_URI="https://gitlab.com/libvirt/libvirt-dbus/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/${PN}-v${PV}

LICENSE="GPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	app-emulation/libvirt
	app-emulation/libvirt-glib
	dev-libs/glib
	"
RDEPEND="${DEPEND}"
BDEPEND=""
