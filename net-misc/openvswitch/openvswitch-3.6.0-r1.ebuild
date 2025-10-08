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
		~dev-python/ovs-3.6.0[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
		dev-python/zope-interface[${PYTHON_USEDEP}]
	')"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/sphinx[${PYTHON_USEDEP}]
	')"

CONFIG_CHECK="OPENVSWITCH"

src_configure() {
	PYTHON3="${PYTHON}" CONFIG_SHELL="${BROOT}"/usr/bin/bash SHELL="${BROOT}"/usr/bin/bash econf \
		$(use_with debug) \
		$(use_enable caps libcapng) \
		$(use_enable ssl) \
		$(use_enable strip ndebug) \
		--with-rundir=/run/openvswitch \
		--with-logdir=/var/log/openvswitch \
		--with-pkdir=/etc/ssl/openvswitch \
		--with-dbdir=/var/lib/openvswitch
}

src_install() {
	default

	keepdir /var/{lib,log}/openvswitch
	keepdir /etc/ssl/openvswitch
	fperms 0750 /etc/ssl/openvswitch

	newconfd "${FILESDIR}/confd/openvswitch-r1" openvswitch

	systemd_newunit "${FILESDIR}/service/ovs-vswitchd-r5" ovs-vswitchd.service
	systemd_newunit "${FILESDIR}/service/ovsdb-server-r5" ovsdb-server.service

	newtmpfiles "${FILESDIR}/tmpfiles/openvswitch" openvswitch.conf

	find "${ED}" -name '*.la' -delete || die
}

pkg_postinst() {
	ewarn "Before starting the "ovsdb-server" service, you must ensure that"
	ewarn "a database file exists under \"/var/lib/openvswitch/conf.db\". If it"
	ewarn "doesn't already exist, you must create it using \"ovsdb-tool create.\""
}
