# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="A group for the Performance Co-Pilot"
ACCT_USER_ID=510
ACCT_USER_HOME=/var/lib/pcp
ACCT_USER_GROUPS=( pcp )

acct-user_add_deps
