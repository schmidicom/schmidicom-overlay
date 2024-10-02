# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
inherit autotools linux-info python-single-r1 systemd tmpfiles

DESCRIPTION="Production quality, multilayer virtual switch"
HOMEPAGE="https://www.openvswitch.org/"
SRC_URI="https://www.openvswitch.org/releases/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug +caps +ssl +strip"

DEPEND="${PYTHON_DEPS}
	debug? ( dev-lang/perl )
	caps? ( sys-libs/libcap-ng )
	ssl? ( dev-libs/openssl )"
RDEPEND="${DEPEND}
	$(python_gen_cond_dep '
		~dev-python/ovs-3.4.0[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
		dev-python/zope-interface[${PYTHON_USEDEP}]
	')"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/sphinx[${PYTHON_USEDEP}]
	')"

CONFIG_CHECK="OPENVSWITCH"

src_configure() {
	econf \
		$(use_with debug) \
		$(use_enable caps libcapng) \
		$(use_enable ssl) \
		$(use_enable strip ndebug)
}

src_install() {
	default

	keepdir /var/{lib,log}/openvswitch
	keepdir /etc/ssl/openvswitch
	fperms 0750 /etc/ssl/openvswitch

	newconfd "${FILESDIR}/confd/ovs-vswitchd-r2" ovs-vswitchd
	newconfd "${FILESDIR}/confd/ovsdb-server-r2" ovsdb-server

	systemd_newunit "${FILESDIR}/service/ovs-vswitchd-r3" ovs-vswitchd.service
	systemd_newunit "${FILESDIR}/service/ovsdb-server-r3" ovsdb-server.service
	systemd_newunit rhel/usr_lib_systemd_system_ovs-delete-transient-ports.service ovs-delete-transient-ports.service

	newtmpfiles "${FILESDIR}/tmpfiles/openvswitch" openvswitch.conf

	insinto /etc/logrotate.d
	newins rhel/etc_logrotate.d_openvswitch openvswitch
}
