# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for sys-apps/pcp"

ACCT_USER_GROUPS=( "pcp" )
ACCT_USER_HOME=/var/lib/pcp
ACCT_USER_ID=-1

acct-user_add_deps
