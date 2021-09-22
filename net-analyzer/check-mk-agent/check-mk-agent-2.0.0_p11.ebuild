# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rpm systemd

DESCRIPTION="checkmk Agent"
HOMEPAGE="https://checkmk.com/"
SRC_URI="http://kappa20.mgdom.ch/mgdom/check_mk/agents/check-mk-agent-2.0.0p11-1.noarch.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-shells/bash
        dev-lang/python
        sys-apps/systemd"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_unpack() {
    rpm_src_unpack ${A}
}

src_install() {
    dodir /etc/check_mk
    systemd_dounit ${S}/etc/systemd/system/check_mk.socket
    systemd_dounit ${S}/etc/systemd/system/check_mk-async.service
    systemd_dounit ${S}/etc/systemd/system/check_mk@.service

    dobin ${S}/usr/bin/check_mk_agent
    dobin ${S}/usr/bin/check_mk_caching_agent
    dobin ${S}/usr/bin/mk-job
    dobin ${S}/usr/bin/waitmax

    keepdir /usr/lib/check_mk_agent/local
    keepdir /usr/lib/check_mk_agent/plugins
    keepdir /var/lib/check_mk_agent/job
    keepdir /var/lib/check_mk_agent/spool
}
