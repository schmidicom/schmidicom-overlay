# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ahash@0.7.6
	aho-corasick@0.7.18
	ansi_term@0.12.1
	anyhow@1.0.57
	arrayvec@0.5.2
	async-trait@0.1.53
	atoi@1.0.0
	atty@0.2.14
	autocfg@1.1.0
	axum@0.5.5
	axum-core@0.2.4
	base64@0.13.0
	bcrypt@0.13.0
	bitflags@1.3.2
	block-buffer@0.10.2
	blowfish@0.9.1
	bumpalo@3.9.1
	byteorder@1.4.3
	bytes@1.2.0
	cc@1.0.73
	cfg-if@1.0.0
	chrono@0.4.19
	cipher@0.4.3
	clap@2.34.0
	config@0.11.0
	core-foundation@0.9.3
	core-foundation-sys@0.8.3
	cpufeatures@0.2.2
	crc@3.0.0
	crc-catalog@2.1.0
	crossbeam@0.8.1
	crossbeam-channel@0.5.4
	crossbeam-deque@0.8.1
	crossbeam-epoch@0.9.8
	crossbeam-queue@0.3.5
	crossbeam-utils@0.8.8
	crypto-common@0.1.3
	deadpool@0.8.2
	digest@0.10.3
	directories-next@2.0.0
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dlv-list@0.3.0
	dns-lookup@1.0.8
	dotenv@0.15.0
	ed25519@1.5.0
	either@1.6.1
	env_logger@0.9.0
	event-listener@2.5.2
	fastrand@1.7.0
	filetime@0.2.16
	flexi_logger@0.22.3
	flume@0.10.12
	fnv@1.0.7
	form_urlencoded@1.0.1
	futures@0.3.21
	futures-channel@0.3.21
	futures-core@0.3.21
	futures-executor@0.3.21
	futures-intrusive@0.4.0
	futures-io@0.3.21
	futures-macro@0.3.21
	futures-sink@0.3.21
	futures-task@0.3.21
	futures-timer@3.0.2
	futures-util@0.3.21
	fxhash@0.2.1
	generic-array@0.14.5
	getrandom@0.2.6
	glob@0.3.0
	hashbrown@0.11.2
	hashbrown@0.12.1
	hashlink@0.8.0
	headers@0.3.7
	headers-core@0.2.0
	heck@0.4.0
	hermit-abi@0.1.19
	hex@0.4.3
	http@0.2.7
	http-body@0.4.4
	http-range-header@0.3.0
	httparse@1.7.1
	httpdate@1.0.2
	humantime@2.1.0
	hyper@0.14.18
	idna@0.2.3
	indexmap@1.8.1
	inout@0.1.3
	instant@0.1.12
	ipnetwork@0.20.0
	itertools@0.10.3
	itoa@1.0.1
	jobserver@0.1.24
	js-sys@0.3.57
	jsonwebtoken@8.1.0
	lazy_static@1.4.0
	lexical-core@0.7.6
	libc@0.2.125
	libsodium-sys@0.2.7
	libsqlite3-sys@0.24.2
	local-ip-address@0.5.3
	lock_api@0.4.7
	log@0.4.17
	mac_address@1.1.5
	machine-uid@0.2.0
	matches@0.1.9
	matchit@0.5.0
	memchr@2.5.0
	memoffset@0.6.5
	mime@0.3.16
	mime_guess@2.0.4
	minimal-lexical@0.2.1
	minreq@2.6.0
	mio@0.7.14
	mio@0.8.3
	miow@0.3.7
	neli@0.6.4
	neli-proc-macros@0.1.3
	nix@0.23.1
	nom@5.1.2
	nom@7.1.1
	ntapi@0.3.7
	num-bigint@0.4.3
	num-integer@0.1.45
	num-traits@0.2.15
	num_cpus@1.13.1
	num_threads@0.1.6
	once_cell@1.10.0
	openssl-probe@0.1.5
	ordered-multimap@0.4.3
	parking_lot@0.11.2
	parking_lot@0.12.0
	parking_lot_core@0.8.5
	parking_lot_core@0.9.3
	paste@1.0.7
	pem@1.0.2
	percent-encoding@2.1.0
	pin-project@1.0.10
	pin-project-internal@1.0.10
	pin-project-lite@0.2.9
	pin-utils@0.1.0
	ping@0.4.0
	pkg-config@0.3.25
	ppv-lite86@0.2.16
	proc-macro2@1.0.38
	protobuf@3.1.0
	protobuf-codegen@3.1.0
	protobuf-parse@3.1.0
	protobuf-support@3.1.0
	punycode@0.4.1
	quickcheck@1.0.3
	quinn@0.8.2
	quinn-proto@0.8.2
	quinn-udp@0.1.1
	quote@1.0.18
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.3
	redox_syscall@0.2.13
	redox_users@0.4.3
	regex@1.5.5
	regex-syntax@0.6.25
	remove_dir_all@0.5.3
	ring@0.16.20
	rust-ini@0.18.0
	rustls@0.20.4
	rustls-native-certs@0.6.2
	rustls-pemfile@0.2.1
	rustls-pemfile@1.0.0
	rustversion@1.0.6
	ryu@1.0.9
	same-file@1.0.6
	schannel@0.1.19
	scopeguard@1.1.0
	sct@0.7.0
	security-framework@2.6.1
	security-framework-sys@2.6.1
	serde@1.0.137
	serde_derive@1.0.137
	serde_json@1.0.81
	serde_urlencoded@0.7.1
	sha-1@0.10.0
	sha2@0.10.2
	signal-hook-registry@1.4.0
	signature@1.5.0
	simple_asn1@0.6.1
	slab@0.4.6
	smallvec@1.8.0
	socket2@0.3.19
	socket2@0.4.4
	sodiumoxide@0.2.7
	spin@0.5.2
	spin@0.9.3
	sqlformat@0.1.8
	sqlx@0.6.0
	sqlx-core@0.6.0
	sqlx-macros@0.6.0
	sqlx-rt@0.6.0
	static_assertions@1.1.0
	stringprep@0.1.2
	strsim@0.8.0
	syn@1.0.93
	sync_wrapper@0.1.1
	tempfile@3.3.0
	termcolor@1.1.3
	textwrap@0.11.0
	thiserror@1.0.31
	thiserror-impl@1.0.31
	time@0.1.43
	time@0.3.9
	time-macros@0.2.4
	tinyvec@1.6.0
	tinyvec_macros@0.1.0
	tokio@1.20.0
	tokio-macros@1.7.0
	tokio-rustls@0.23.4
	tokio-stream@0.1.8
	tokio-tungstenite@0.17.1
	tokio-util@0.6.9
	tokio-util@0.7.1
	toml@0.5.9
	tower@0.4.12
	tower-http@0.3.3
	tower-layer@0.3.1
	tower-service@0.3.1
	tracing@0.1.34
	tracing-attributes@0.1.21
	tracing-core@0.1.26
	try-lock@0.2.3
	tungstenite@0.17.2
	typenum@1.15.0
	unicase@2.6.0
	unicode-bidi@0.3.8
	unicode-normalization@0.1.19
	unicode-segmentation@1.9.0
	unicode-width@0.1.9
	unicode-xid@0.2.3
	unicode_categories@0.1.1
	untrusted@0.7.1
	url@2.2.2
	utf-8@0.7.6
	uuid@1.1.2
	vcpkg@0.2.15
	vec_map@0.8.2
	version_check@0.9.4
	walkdir@2.3.2
	want@0.3.0
	wasi@0.10.2+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.80
	wasm-bindgen-backend@0.2.80
	wasm-bindgen-macro@0.2.80
	wasm-bindgen-macro-support@0.2.80
	wasm-bindgen-shared@0.2.80
	web-sys@0.3.57
	webpki@0.22.0
	webpki-roots@0.22.4
	which@4.2.5
	whoami@1.2.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.36.1
	windows-sys@0.48.0
	windows-targets@0.48.0
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.36.1
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.36.1
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.36.1
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.36.1
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.36.1
	windows_x86_64_msvc@0.48.0
	winreg@0.6.2
	zeroize@1.5.5
	zstd@0.9.2+zstd.1.5.1
	zstd-safe@4.1.3+zstd.1.5.1
	zstd-sys@1.6.2+zstd.1.5.1
"
declare -A GIT_CRATES=(
        [async-speed-limit]="https://github.com/open-trade/async-speed-limit;f89f702ae01d4016429543d2f0dda1086157e420"
        [confy]="https://github.com/open-trade/confy;630cc28a396cb7d01eefdd9f3824486fe4d8554b"
        [tokio-socks]="https://github.com/open-trade/tokio-socks;3de8300fbce37e2cdaef042e016aa95058d007cf"
)

inherit cargo systemd

DESCRIPTION="RustDesk Server"
HOMEPAGE="https://rustdesk.com/"
SRC_URI="https://github.com/rustdesk/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="sys-devel/gcc
	sys-libs/glibc"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}/${P}

PATCHES=(
	"${FILESDIR}"/0001-fix-systemd-service-units.patch
)

src_install() {
	cargo_src_install

	systemd_dounit ${S}/systemd/rustdesk-hbbr.service || die "Cannot install Service-Unit"
	systemd_dounit ${S}/systemd/rustdesk-hbbs.service || die "Cannot install Service-Unit"
	doconfd ${S}/systemd/rustdesk-server || die "Cannot install Config-File"

	keepdir /var/lib/rustdesk-server/
	keepdir /var/log/rustdesk-server/
	dodoc LICENSE README.md
}