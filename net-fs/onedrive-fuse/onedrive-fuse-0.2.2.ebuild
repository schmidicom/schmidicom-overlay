# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.0

EAPI=8

CRATES="
	adler-1.0.2
	aho-corasick-0.7.18
	ansi_term-0.11.0
	anyhow-1.0.42
	arrayvec-0.5.2
	async-compression-0.3.8
	atty-0.2.14
	autocfg-1.0.1
	base64-0.13.0
	bitflags-1.2.1
	bumpalo-3.7.0
	bytes-1.0.1
	cc-1.0.69
	cfg-if-1.0.0
	clap-2.33.3
	config-0.11.0
	core-foundation-0.9.1
	core-foundation-sys-0.8.2
	crc32fast-1.2.1
	dirs-3.0.2
	dirs-sys-0.3.6
	encoding_rs-0.8.28
	env_logger-0.9.0
	flate2-1.0.20
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	fuse-0.3.1
	futures-channel-0.3.16
	futures-core-0.3.16
	futures-sink-0.3.16
	futures-task-0.3.16
	futures-util-0.3.16
	getrandom-0.2.3
	h2-0.3.3
	hashbrown-0.11.2
	heck-0.3.3
	hermit-abi-0.1.19
	http-0.2.4
	http-body-0.4.2
	httparse-1.4.1
	httpdate-1.0.1
	humantime-2.1.0
	hyper-0.14.11
	hyper-tls-0.5.0
	idna-0.2.3
	indexmap-1.7.0
	ipnet-2.3.1
	itoa-0.4.7
	js-sys-0.3.52
	lazy_static-1.4.0
	lexical-core-0.7.6
	libc-0.2.98
	linked-hash-map-0.5.4
	log-0.3.9
	log-0.4.14
	lru-cache-0.1.2
	matches-0.1.8
	memchr-2.4.0
	memoffset-0.6.4
	mime-0.3.16
	miniz_oxide-0.4.4
	mio-0.7.13
	miow-0.3.7
	native-tls-0.2.7
	nix-0.22.0
	nom-5.1.2
	ntapi-0.3.6
	num_cpus-1.13.0
	once_cell-1.8.0
	onedrive-api-0.8.1
	open-2.0.0
	openssl-0.10.35
	openssl-probe-0.1.4
	openssl-sys-0.9.65
	pathdiff-0.2.0
	percent-encoding-2.1.0
	pin-project-lite-0.2.7
	pin-utils-0.1.0
	pkg-config-0.3.19
	ppv-lite86-0.2.10
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.28
	quote-1.0.9
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	redox_syscall-0.2.10
	redox_users-0.4.0
	regex-1.5.4
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	reqwest-0.11.4
	ryu-1.0.5
	schannel-0.1.19
	security-framework-2.3.1
	security-framework-sys-2.3.0
	serde-1.0.127
	serde_derive-1.0.127
	serde_json-1.0.66
	serde_urlencoded-0.7.0
	sharded-slab-0.1.3
	slab-0.4.4
	socket2-0.4.1
	static_assertions-1.1.0
	strsim-0.8.0
	structopt-0.3.22
	structopt-derive-0.4.15
	strum-0.20.0
	strum_macros-0.20.1
	syn-1.0.74
	tempfile-3.2.0
	termcolor-1.1.2
	textwrap-0.11.0
	thiserror-1.0.26
	thiserror-impl-1.0.26
	thread-scoped-1.0.2
	time-0.1.43
	tinyvec-1.3.1
	tinyvec_macros-0.1.0
	tokio-1.9.0
	tokio-macros-1.3.0
	tokio-native-tls-0.3.0
	tokio-util-0.6.7
	toml-0.5.8
	tower-service-0.3.1
	tracing-0.1.26
	tracing-core-0.1.18
	try-lock-0.2.3
	unicode-bidi-0.3.5
	unicode-normalization-0.1.19
	unicode-segmentation-1.8.0
	unicode-width-0.1.8
	unicode-xid-0.2.2
	url-2.2.2
	vcpkg-0.2.15
	vec_map-0.8.2
	version_check-0.9.3
	want-0.3.0
	wasi-0.10.2+wasi-snapshot-preview1
	wasm-bindgen-0.2.75
	wasm-bindgen-backend-0.2.75
	wasm-bindgen-futures-0.4.25
	wasm-bindgen-macro-0.2.75
	wasm-bindgen-macro-support-0.2.75
	wasm-bindgen-shared-0.2.75
	web-sys-0.3.52
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	winreg-0.7.0
"

inherit cargo

DESCRIPTION="Mount OneDrive storage as FUSE filesystem"

HOMEPAGE="https://github.com/oxalica/onedrive-fuse"
SRC_URI="https://github.com/oxalica/onedrive-fuse/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x68"

DEPEND="dev-libs/openssl
	sys-fs/fuse:0"