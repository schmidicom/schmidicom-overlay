# Copyright 2019-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="System user: rpc"

ACCT_USER_ID=-1
ACCT_USER_GROUPS=( "rpc" )
ACCT_USER_HOME="/var/lib/rpc"

acct-user_add_deps
