# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="LinOTP - the open source solution for two factor authentication"
HOMEPAGE="https://www.linotp.org/"
SRC_URI="https://github.com/LinOTP/LinOTP/archive/refs/tags/release/${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/LinOTP-release-${PV}/linotpd/src
RESTRICT="mirror"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND="dev-python/flask
        dev-python/flask-babel
        >=dev-python/sqlalchemy-0.6
        dev-python/flask-sqlalchemy
        dev-python/mako
        dev-python/beaker
        >=dev-python/docutils-0.4
        >=dev-python/pycryptodome-3.4
        >=dev-python/pyrad-1.1
        dev-python/netaddr
        >=dev-python/qrcode-2.4
        >=dev-python/configobj-4.6.0
        dev-python/httplib2
        dev-python/requests
        dev-python/pillow
        dev-python/passlib
        >=dev-python/pysodium-0.6.8
        dev-python/python-ldap
        dev-python/bcrypt
        dev-python/cryptography
        dev-python/click
        >=dev-python/pygments-2.6.0
        dev-python/jsonschema
        dev-python/mysqlclient
        dev-python/psycopg
        dev-python/Babel
        dev-python/mock
        >=dev-python/sphinx-3.0"
RDEPEND="${DEPEND}"
BDEPEND=""
