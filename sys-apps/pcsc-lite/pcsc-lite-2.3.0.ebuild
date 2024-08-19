# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{10..13} )
inherit python-single-r1 meson-multilib tmpfiles udev

DESCRIPTION="PC/SC Architecture smartcard middleware library"
HOMEPAGE="https://pcsclite.apdu.fr https://github.com/LudovicRousseau/PCSC"
SRC_URI="https://pcsclite.apdu.fr/files/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

IUSE="libusb policykit selinux systemd +udev"
REQUIRED_USE="^^ ( udev libusb ) ${PYTHON_REQUIRED_USE}"

DEPEND="
	libusb? ( virtual/libusb:1 )
	udev? ( virtual/libudev:= )
	policykit? ( >=sys-auth/polkit-0.111 )
	acct-group/openct
	acct-group/pcscd
	acct-user/pcscd
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}
	selinux? ( sec-policy/selinux-pcscd )
"
BDEPEND="
        app-alternatives/lex
        virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}"/${PN}-polkit-user.patch
	"${FILESDIR}"/${PN}-systemd-user.patch
)

S="${WORKDIR}/${P}"

multilib_src_configure() {
	local emesonargs=(
		$(meson_use libusb)
		$(meson_use policykit polkit)
		$(meson_use systemd libsystemd)
		$(meson_use udev libudev)
		-Dusbdropdir="${EPREFIX}"/usr/$(get_libdir)/readers/usb
		-Dsystemdunit=system
	)
	meson_src_configure
}

src_install() {
	meson-multilib_src_install
	dodoc HELP SECURITY

	if ! use systemd; then
		newinitd "${FILESDIR}"/pcscd-init.7 pcscd
	fi

	dotmpfiles "${FILESDIR}"/pcscd.conf

	if use udev; then
		if ! use systemd; then
			udev_newrules "${FILESDIR}"/99-pcscd-openrc.rules 99-pcscd.rules
			exeinto "$(get_udevdir)"
			newexe "${FILESDIR}"/pcscd-udev pcscd.sh
		fi

		if use systemd; then
			udev_newrules "${FILESDIR}"/99-pcscd-systemd.rules 99-pcscd.rules
		fi
	fi

	python_fix_shebang "${ED}"/usr/bin/pcsc-spy

	find "${ED}" -name '*.la' -delete || die
}

pkg_postinst() {
	tmpfiles_process pcscd.conf
	use udev && udev_reload
}

pkg_postrm() {
	use udev && udev_reload
}
