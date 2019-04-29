# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit git-r3 autotools

DESCRIPTION="Notifier for USB Firewall to use with desktop environments"
HOMEPAGE="https://github.com/kochstefan/usbauth-all"
SRC_URI=""
EGIT_REPO_URI="https://github.com/kochstefan/usbauth-all.git"
case "${PV}" in
    !9999)
        TAG="v${PV}"
        REFS="refs/tags/${TAG}"
        ;;
esac

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE=""
RDEPEND="sys-libs/libusbauth-configparser
	sys-apps/usbauth
	sys-apps/dbus
	dev-libs/glib
	x11-libs/libnotify
	virtual/udev
	virtual/libc"
DEPEND="${RDEPEND}"

src_unpack() {
	case "${PV}" in
		9999)
			git-r3_fetch
			git-r3_checkout ${EGIT_REPO_URI} "${WORKDIR}/usbauth-all"
			;;
		*)
			git-r3_fetch ${EGIT_REPO_URI} ${REFS} ${TAG}
			git-r3_checkout ${EGIT_REPO_URI} "${WORKDIR}/usbauth-all" ${TAG}
			;;
	esac
	mv ${WORKDIR}/usbauth-all/usbauth-notifier ${WORKDIR}/${P}
}

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
