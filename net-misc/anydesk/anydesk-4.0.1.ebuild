# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit eutils desktop systemd

DESCRIPTION="All-In-One Solution for Remote Access and Support over the Internet"
HOMEPAGE="http://anydesk.de/"
SRC_URI="
        x86?   ( https://download.anydesk.com/linux/${P}-i686.tar.gz )
        amd64? ( https://download.anydesk.com/linux/${P}-amd64.tar.gz )"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="daemon"

DEPEND="sys-libs/glibc
        sys-devel/gcc
        dev-libs/glib
        media-libs/mesa
        x11-libs/cairo
        x11-libs/gdk-pixbuf
        x11-libs/gtk+
        x11-libs/gtkglext
        x11-libs/libX11
        x11-libs/libXdamage
        x11-libs/libXext
        x11-libs/libXfixes
        x11-libs/libXi
        x11-libs/libXrandr
        x11-libs/libXtst
        x11-libs/libxcb
        x11-libs/pango
        daemon? (
               sys-apps/systemd
               sys-auth/polkit
        )"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
    unpack ${A}
}

src_install() {
    dobin ${S}/${P}/anydesk
    dodoc ${S}/${P}/README ${S}/${P}/changelog ${S}/${P}/copyright
    doicon -s 16 ${S}/${P}/icons/hicolor/16x16/apps/anydesk.png
    doicon -s 24 ${S}/${P}/icons/hicolor/24x24/apps/anydesk.png
    doicon -s 32 ${S}/${P}/icons/hicolor/32x32/apps/anydesk.png
    doicon -s 48 ${S}/${P}/icons/hicolor/48x48/apps/anydesk.png
    doicon -s 256 ${S}/${P}/icons/hicolor/256x256/apps/anydesk.png
    doicon -s scalable ${S}/${P}/icons/hicolor/scalable/apps/anydesk.svg
    make_desktop_entry anydesk "AnyDesk Remote-Desktop-Software" anydesk Network,System,Untility
    if use daemon ; then
        sed -i -e 's/\/tm\//\/run\//g' ${S}/${P}/systemd/anydesk.service || die "Fixing the Service-Unit is failed!"
        systemd_dounit ${S}/${P}/systemd/anydesk.service
        mkdir -p ${D}/usr/share/polkit-1/actions
        cp ${S}/${P}/polkit-1/com.philandro.anydesk.policy ${D}/usr/share/polkit-1/actions/com.philandro.anydesk.policy
    fi
}
