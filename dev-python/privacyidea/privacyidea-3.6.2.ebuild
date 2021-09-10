# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="flexible, Open Source Multi Factor Authentication (2FA)"
HOMEPAGE="https://www.privacyidea.org/"
SRC_URI="https://github.com/privacyidea/privacyidea/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/privacyidea-${PV}
RESTRICT="mirror"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=">=dev-python/alembic-1.6.5
	>=dev-python/argon2-cffi-20.1.0
	>=dev-python/Babel-2.9.1
	>=dev-python/bcrypt-3.2.0
	>=dev-python/beautifulsoup4-4.9.3
	>=dev-python/cachetools-4.2.2
	>=dev-python/cbor2-5.4.0
	>=dev-python/certifi-10001
	>=dev-python/cffi-1.14.5
	>=dev-python/chardet-4.0.0
	>=dev-python/click-7.1.2
	>=dev-python/configobj-5.0.6
	>=dev-python/croniter-1.0.15
	>=dev-python/cryptography-3.4.7
	>=dev-python/defusedxml-0.7.1
	>=dev-python/flask-1.1.4
	>=dev-python/flask-babel-2.0.0
	>=dev-python/flask-migrate-2.7.0
	>=dev-python/flask-script-2.0.6
	>=dev-python/flask-sqlalchemy-2.5.1
	>=dev-python/future-0.9.4
	>=dev-python/google-auth-1.32.1
	>=dev-python/huey-2.3.2
	>=dev-python/idna-2.3.2
	>=dev-python/importlib_metadata-4.6.0
	>=dev-python/itsdangerous-1.1.0
	>=dev-python/jinja-2.11.3
	>=dev-python/ldap3-2.9
	>=dev-python/lxml-4.6.3
	>=dev-python/mako-1.1.4
	>=dev-python/markupsafe-2.0.1
	>=dev-python/netaddr-0.8.0
	>=dev-python/passlib-1.7.4
	>=dev-python/pillow-8.3.0
	>=dev-python/pyasn1-0.4.8
	>=dev-python/pyasn1-modules-0.2.8
	>=dev-python/pycparser-2.20
	>=dev-python/pydash-5.0.1
	>=dev-python/pyjwt-1.7.1
	>=dev-python/pymysql-1.0.2
	>=dev-python/pyopenssl-20.0.1
	>=dev-python/pyrad-2.4
	>=dev-python/python-dateutil-2.4
	>=dev-python/python-editor-1.0.4
	>=dev-python/python-gnupg-0.4.7
	>=dev-python/pytz-2021.1
	>=dev-python/pyyaml-5.4.1
	>=dev-python/qrcode-7.1
	>=dev-python/redis-py-3.5.3
	>=dev-python/requests-2.25.1
	>=dev-python/rsa-4.7.2
	>=dev-python/scandir-1.10.0
	>=dev-python/setuptools-50.3.2
	>=dev-python/six-1.16.0
	>=dev-python/smpplib-2.1.0
	>=dev-python/soupsieve-2.2.1
	>=dev-python/sqlalchemy-1.3.24
	>=dev-python/typing-extensions-3.10.0.0
	>=dev-python/urllib3-1.26.6
	>=dev-python/werkzeug-1.0.1
	>=dev-python/zipp-3.5.0"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
        "${FILESDIR}"/fix_setup.patch
)
