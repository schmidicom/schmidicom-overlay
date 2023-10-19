# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module systemd desktop

DESCRIPTION="A native Linux filesystem for Microsoft OneDrive"
HOMEPAGE="https://github.com/jstaf/onedriver"
SRC_URI="https://github.com/jstaf/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://res.messerligroup.com/deploy/${P}-deps.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-libs/webkit-gtk:4.1
	net-libs/libsoup
	dev-libs/json-glib
	dev-libs/glib
	sys-libs/glibc
	app-accessibility/at-spi2-core
	media-libs/fontconfig
	media-libs/freetype
	media-libs/harfbuzz
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+
	x11-libs/pango"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	rm ${S}/Makefile || die "Remove Makefile failed!"
	eapply_user
}

src_compile() {
	ego build ./cmd/onedriver
	ego build ./cmd/onedriver-launcher
}

src_install() {
	# Install binary
	dobin onedriver || die "Install failed!"
	dobin onedriver-launcher || die "Install failed!"
	# Install manpage
	doman pkg/resources/onedriver.1 || die "Install failed!"
	# Install service-unit
	systemd_douserunit pkg/resources/onedriver@.service || die "Install failed!"
	# Install icons
	doicon -s scalable pkg/resources/onedriver.svg || die "Install failed!"
	doicon -s 128 pkg/resources/onedriver-128.png || die "Install failed!"
	doicon -s 256 pkg/resources/onedriver.png || die "Install failed!"
	# Create desktop-file
	make_desktop_entry onedriver-launcher Onedriver onedriver Utility || die "Install failed!"
}
