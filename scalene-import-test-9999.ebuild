# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8..10} )

inherit git-r3
inherit distutils-r1

DESCRIPTION="debugging example"
HOMEPAGE="https://github.com/jakeogh/scalene-import-test"
EGIT_REPO_URI="/home/cfg/_myapps/scalene-import-test https://github.com/jakeogh/scalene-import-test.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""


RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/greendb[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

