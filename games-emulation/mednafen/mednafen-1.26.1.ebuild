# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Mednafen is a portable, utilizing OpenGL and SDL, argument(command-line)-driven multi-system emulator."
HOMEPAGE="https://mednafen.github.io/"
SRC_URI="https://mednafen.github.io/releases/files/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+nls +debugger cjk +fancy-scalers +altivec +apple2 +gameboy +gameboy-advance +atari-lynx +sega-megadrive +nes +neo-geo-pocket +pc-engine +pcfx +playstation +sms-gg +snes +sega-saturn +virtual-boy +wonderswan alsa jack"

RDEPEND="
        dev-libs/libcdio
        >=dev-libs/lzo-2.10
        media-libs/libsdl[sound,joystick,opengl,video]
        media-libs/libsndfile
        sys-devel/gcc
        sys-libs/zlib[minizip]
        sys-libs/glibc
        virtual/opengl
        alsa? ( media-libs/alsa-lib )
        jack? ( media-sound/jack-audio-connection-kit )
        nls? ( virtual/libintl )"
DEPEND="${RDEPEND}
        virtual/pkgconfig
        nls? ( sys-devel/gettext )"

S=${WORKDIR}/${PN}

src_configure() {
        econf \
                $(use_enable nls) \
                $(use_enable debugger) \
                $(use_enable cjk cjk-fonts) \
                $(use_enable fancy-scalers) \
                $(use_enable altivec) \
                $(use_enable apple2) \
                $(use_enable gameboy gb) \
                $(use_enable gameboy-advance gba) \
                $(use_enable atari-lynx lynx) \
                $(use_enable sega-megadrive md) \
                $(use_enable nes) \
                $(use_enable neo-geo-pocket ngp) \
                $(use_enable pc-engine pce) \
                $(use_enable pcfx) \
                $(use_enable playstation psx) \
                $(use_enable sms-gg sms) \
                $(use_enable snes) \
                $(use_enable snes snes-faust) \
                $(use_enable sega-saturn ss) \
                $(use_enable sega-saturn ssfplay) \
                $(use_enable virtual-boy vb) \
                $(use_enable wonderswan wswan) \
                $(use_enable alsa) \
                $(use_enable jack)
}

src_install() {
        emake DESTDIR="${D}" install
        dodoc ChangeLog
}
