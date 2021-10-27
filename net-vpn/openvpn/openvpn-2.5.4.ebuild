# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools systemd

DESCRIPTION="OpenVPN is an open source VPN daemon"
HOMEPAGE="https://openvpn.net/"
SRC_URI="https://github.com/OpenVPN/openvpn/archive/refs/tags/v${PV}.zip -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+lzo +lz4 +plugin_auth-pam plugin_down-root pkcs11 +iproute2 systemd"

#WANT_AUTOCONF="2.1"

DEPEND="
	lzo? ( >=dev-libs/lzo-1.07 )
	lz4? ( app-arch/lz4 )
	plugin_auth-pam? ( sys-libs/pam )
	pkcs11? ( >=dev-libs/pkcs11-helper-1.11 )
	systemd? ( sys-apps/systemd )
	>=dev-libs/openssl-0.9.8:0=
	sys-libs/glibc
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local -a myeconfargs

	if use plugin_auth-pam || plugin_down-root ; then
		myeconfargs+=(
			--enable-plugins
			$(use_enable plugin_auth-pam plugin-auth-pam)
			$(use_enable plugin_down-root plugin-down-root)
		)
	fi
	myeconfargs+=(
		$(use_enable lzo)
		$(use_enable lz4)
		$(use_enable pkcs11)
		$(use_enable iproute2)
		$(use_enable systemd)
	)
	SYSTEMD_UNIT_DIR=$(systemd_get_systemunitdir) \
	TMPFILES_DIR="/usr/lib/tmpfiles.d" \
	IPROUTE=$(usex iproute2 '/bin/ip' '') \
		econf "${myeconfargs[@]}"
}

src_install() {
	default
	keepdir /etc/openvpn/client
	keepdir /etc/openvpn/server
}
