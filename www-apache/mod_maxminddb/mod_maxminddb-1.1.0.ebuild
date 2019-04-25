# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils apache-module

DESCRIPTION="MaxMind DB Apache Module"
HOMEPAGE="http://maxmind.github.io/mod_maxminddb/"
SRC_URI="https://github.com/maxmind/mod_maxminddb/releases/download/$PV/$P.tar.gz"
LICENSE="Apache-2.0"

KEYWORDS="amd64"
IUSE=""
SLOT="0"

DEPEND="dev-libs/libmaxminddb"
RDEPEND="${DEPEND}"

# https://devmanual.gentoo.org/eclass-reference/apache-module.eclass/index.html
APACHE2_MOD_CONF="70_${PN}"
APACHE2_MOD_DEFINE="MAXMINDDB"
need_apache2

# for install the module in the right place.
# is probably not the best solution, sry.
APACHE_MODULESDIR="/usr/lib64/apache2/modules"

src_unpack() {
	unpack ${A} || die "unpack failed"
}

src_configure() {
	econf || die "econf failed"
}

src_compile() {
	# "apache-module_src_compile" builds not working library.
	# https://github.com/maxmind/mod_maxminddb/issues/38
	emake || die "emake failed"
}

src_install() {
	apache-module_src_install || die "install failed"
	dodoc README.md Changes.md
}
