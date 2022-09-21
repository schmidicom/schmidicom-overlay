# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit acct-user

DESCRIPTION="User for app-emulation/libvirt-dbus"
ACCT_USER_GROUPS=( "libvirtdbus" )
ACCT_USER_HOME=/var/lib/libvirtdbus
ACCT_USER_ID=-1

acct-user_add_deps
