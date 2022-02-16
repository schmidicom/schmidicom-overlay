# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	andrew-0.2.1
	approx-0.3.2
	arrayvec-0.5.1
	autocfg-1.0.0
	bitflags-1.2.1
	byteorder-1.3.4
	cc-1.0.50
	cfg-if-0.1.10
	chrono-0.4.11
	dlib-0.4.1
	downcast-rs-1.1.1
	getopts-0.2.21
	greetd_ipc-0.6.0
	itoa-0.4.5
	lazy_static-1.4.0
	libc-0.2.68
	libloading-0.5.2
	line_drawing-0.7.0
	memmap-0.7.0
	nix-0.14.1
	nix-0.15.0
	num-integer-0.1.42
	num-traits-0.2.11
	ordered-float-1.0.2
	os_pipe-0.8.2
	proc-macro2-0.4.30
	proc-macro2-1.0.9
	quote-0.6.13
	quote-1.0.3
	redox_syscall-0.1.56
	rusttype-0.7.9
	rusttype-0.8.2
	ryu-1.0.3
	same-file-1.0.6
	serde-1.0.105
	serde_derive-1.0.105
	serde_json-1.0.50
	smithay-client-toolkit-0.6.6
	stb_truetype-0.3.1
	syn-1.0.17
	thiserror-1.0.14
	thiserror-impl-1.0.14
	time-0.1.42
	toml-0.5.6
	unicode-width-0.1.7
	unicode-xid-0.1.0
	unicode-xid-0.2.0
	void-1.0.2
	walkdir-2.3.1
	wayland-client-0.23.6
	wayland-commons-0.23.6
	wayland-protocols-0.23.6
	wayland-scanner-0.23.6
	wayland-sys-0.23.6
	winapi-0.3.8
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.3
	winapi-x86_64-pc-windows-gnu-0.4.0
	xdg-2.2.0
	xml-rs-0.8.0
"

inherit cargo

DESCRIPTION="Raw wayland greeter for greetd, to be run under sway or similar."
HOMEPAGE="https://git.sr.ht/~kennylevinsen/wlgreet"
SRC_URI="https://git.sr.ht/~kennylevinsen/wlgreet/archive/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
