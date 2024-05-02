# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.8.7
	aho-corasick@1.1.2
	allocator-api2@0.2.16
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	arc-swap@1.6.0
	async-trait@0.1.77
	autocfg@1.1.0
	backtrace@0.3.69
	bitflags@1.3.2
	bitflags@2.4.1
	block@0.1.6
	block-buffer@0.10.4
	bumpalo@3.14.0
	bytes@1.5.0
	cassowary@0.3.0
	cc@1.0.83
	cfg-if@1.0.0
	chrono@0.4.31
	const-random@0.1.17
	const-random-macro@0.1.16
	core-foundation-sys@0.8.6
	cpufeatures@0.2.11
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	crypto-common@0.1.6
	dashmap@5.5.3
	digest@0.10.7
	displaydoc@0.2.4
	dlv-list@0.5.2
	either@1.9.0
	equivalent@1.0.1
	find-crate@0.6.3
	fluent@0.16.0
	fluent-bundle@0.15.2
	fluent-langneg@0.13.0
	fluent-syntax@0.11.0
	futures@0.3.30
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	getopts@0.2.21
	getrandom@0.2.11
	gimli@0.28.1
	greetd_ipc@0.9.0
	hashbrown@0.14.3
	heck@0.4.1
	hermit-abi@0.3.3
	i18n-config@0.4.6
	i18n-embed@0.14.1
	i18n-embed-fl@0.7.0
	i18n-embed-impl@0.8.3
	iana-time-zone@0.1.59
	iana-time-zone-haiku@0.1.2
	indexmap@2.1.0
	indoc@2.0.4
	intl-memoizer@0.5.1
	intl_pluralrules@7.0.2
	itertools@0.12.0
	itoa@1.0.10
	js-sys@0.3.66
	lazy_static@1.4.0
	libc@0.2.151
	locale_config@0.3.0
	lock_api@0.4.11
	log@0.4.20
	lru@0.12.1
	malloc_buf@0.0.6
	memchr@2.7.1
	miniz_oxide@0.7.1
	mio@0.8.10
	nix@0.27.1
	num-traits@0.2.17
	num_cpus@1.16.0
	objc@0.2.7
	objc-foundation@0.1.1
	objc_id@0.1.1
	object@0.32.2
	once_cell@1.19.0
	ordered-multimap@0.7.1
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.75
	pure-rust-locales@0.7.0
	quote@1.0.35
	ratatui@0.25.0
	redox_syscall@0.4.1
	regex@1.10.2
	regex-automata@0.4.3
	regex-syntax@0.8.2
	rust-embed@8.2.0
	rust-embed-impl@8.2.0
	rust-embed-utils@8.2.0
	rust-ini@0.20.0
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustversion@1.0.14
	ryu@1.0.16
	same-file@1.0.6
	scopeguard@1.2.0
	self_cell@0.10.3
	self_cell@1.0.3
	serde@1.0.194
	serde_derive@1.0.194
	serde_json@1.0.110
	serde_spanned@0.6.5
	sha2@0.10.8
	signal-hook@0.3.17
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	slab@0.4.9
	smallvec@1.11.2
	smart-default@0.7.1
	smawk@0.3.2
	socket2@0.5.5
	stability@0.1.1
	strsim@0.10.0
	strum@0.25.0
	strum_macros@0.25.3
	syn@1.0.109
	syn@2.0.47
	textwrap@0.16.0
	thiserror@1.0.56
	thiserror-impl@1.0.56
	tiny-keccak@2.0.2
	tinystr@0.7.5
	tokio@1.35.1
	tokio-macros@2.2.0
	toml@0.5.11
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.21.0
	type-map@0.4.0
	typenum@1.17.0
	unic-langid@0.9.4
	unic-langid-impl@0.9.4
	unicode-ident@1.0.12
	unicode-linebreak@0.1.5
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	version_check@0.9.4
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.89
	wasm-bindgen-backend@0.2.89
	wasm-bindgen-macro@0.2.89
	wasm-bindgen-macro-support@0.2.89
	wasm-bindgen-shared@0.2.89
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.32
	zerocopy@0.7.32
	zerocopy-derive@0.7.32
	zeroize@1.7.0
"

declare -A GIT_CRATES=(
        [uzers]="https://github.com/rustadopt/uzers-rs;aa6f0f8665fff188ddceb758078dc3a1e0c238a4"
)

inherit cargo

DESCRIPTION="Graphical console greeter for greetd"
HOMEPAGE="https://github.com/apognu/tuigreet"
SRC_URI="https://res.messerligroup.com/deploy/${P}.tar.gz
	$(cargo_crate_uris)"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 Boost-1.0 CC0-1.0 GPL-3 MIT Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="x86 amd64 ppc64 riscv"
IUSE="man"

DEPEND=""
RDEPEND="${DEPEND}
	gui-libs/greetd"
BDEPEND="man? ( app-text/ronn )"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

src_prepare() {
	# Fix dep
	mv ${WORKDIR}/uzers-rs-aa6f0f8665fff188ddceb758078dc3a1e0c238a4 ${WORKDIR}/uzers-aa6f0f8665fff188ddceb758078dc3a1e0c238a4 || die
	eapply_user
}

src_install() {
	default
	dobin target/release/tuigreet
	# To make the rember option work
	keepdir /var/cache/tuigreet
	fowners greetd:greetd /var/cache/tuigreet
	# Install manpage for tuigreet
	if use man ; then
		ronn ${S}/contrib/man/tuigreet-1.scd
		mv ${S}/contrib/man/tuigreet-1 ${S}/contrib/man/tuigreet.1
		doman ${S}/contrib/man/tuigreet.1
	fi
}
