# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit git-r3 autotools

DESCRIPTION="Azure Active Directory PAM Module"
HOMEPAGE="https://github.com/CyberNinjas/pam_aad"
SRC_URI=""
EGIT_REPO_URI="https://github.com/CyberNinjas/pam_aad.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static"

DEPEND="dev-libs/jwt
	dev-libs/sds
	dev-libs/jansson
	dev-libs/openssl
	sys-libs/pam
	sys-apps/util-linux"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable static)
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
