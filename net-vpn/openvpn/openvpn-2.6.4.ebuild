# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools systemd linux-info

DESCRIPTION="OpenVPN is an open source VPN daemon"
HOMEPAGE="https://openvpn.net/"
SRC_URI="https://github.com/OpenVPN/openvpn/archive/refs/tags/v${PV}.zip -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="async-push +iproute2 +lzo +lz4 mbedtls +openssl +plugins +plugin_auth-pam plugin_down-root pkcs11 systemd"

REQUIRED_USE="
	^^ ( openssl mbedtls )
	pkcs11? ( !mbedtls )
	plugin_auth-pam? ( plugins )
	plugin_down-root? ( plugins )
"

DEPEND="
	lzo? ( >=dev-libs/lzo-1.07 )
	lz4? ( app-arch/lz4 )
	plugin_auth-pam? ( sys-libs/pam )
	pkcs11? ( >=dev-libs/pkcs11-helper-1.11 )
	iproute2? ( sys-apps/iproute2[-minimal] )
	systemd? ( sys-apps/systemd )
	mbedtls? ( net-libs/mbedtls:= )
	openssl? ( dev-libs/openssl )
	sys-libs/glibc
	sys-libs/libcap-ng
"
RDEPEND="${DEPEND}
	acct-group/openvpn
	acct-user/openvpn
"
BDEPEND="virtual/pkgconfig"

pkg_setup() {
	local CONFIG_CHECK="~TUN"
	linux-info_pkg_setup
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	local -a myeconfargs

	myeconfargs+=(
		--with-crypto-library=$(usex mbedtls mbedtls openssl)
		$(use_enable async-push)
		$(use_enable lzo)
		$(use_enable lz4)
		$(use_enable pkcs11)
		$(use_enable iproute2)
		$(use_enable systemd)
		$(use_enable plugins)
		$(use_enable plugin_auth-pam plugin-auth-pam)
		$(use_enable plugin_down-root plugin-down-root)
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
