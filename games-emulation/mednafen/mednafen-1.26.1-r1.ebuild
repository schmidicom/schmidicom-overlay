# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Mednafen is a portable, utilizing OpenGL and SDL, argument(command-line)-driven multi-system emulator."
HOMEPAGE="https://mednafen.github.io/"
SRC_URI="https://mednafen.github.io/releases/files/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+alsa +debugger +sndfile jack system-mpcdec system-tremor system-lzo"

RDEPEND="
        sys-devel/gcc
        sys-devel/gettext
        sys-libs/glibc
        sys-libs/zlib[minizip]
        virtual/libintl
        virtual/opengl
        media-libs/libsdl2[joystick,opengl,sound,video]
        alsa? ( media-libs/alsa-lib )
        sndfile? ( media-libs/libsndfile )
        jack? ( media-sound/jack-audio-connection-kit )
        system-mpcdec? ( media-sound/musepack-tools )
        system-tremor? ( media-libs/tremor )
        system-lzo? ( >=dev-libs/lzo-2.10 )"
DEPEND="${RDEPEND}
        virtual/pkgconfig"

S=${WORKDIR}/${PN}

src_configure() {
        econf \
                $(use_enable alsa)
                $(use_enable debugger)
                $(use_enable jack)
                $(use_with sndfile libsndfile)
                $(use_with system-mpcdec external-mpcdec)
                $(use_with system-tremor external-tremor)
                $(use_with system-lzo external-lzo)
}

src_install() {
        emake DESTDIR="${D}" install
        dodoc ChangeLog
}
