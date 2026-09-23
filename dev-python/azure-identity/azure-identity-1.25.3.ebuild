# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )
inherit distutils-r1 pypi

DESCRIPTION="Azure Core shared client library for Python"
HOMEPAGE="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/core/azure-core"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

RDEPEND="dev-python/azure-core[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/msal[${PYTHON_USEDEP}]
	dev-python/msal-extensions[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
