#!/bin/bash
# Sen 27 Mei 2024 10:43:27  +07
# https://semver.org/

# @adibenc
# simple semver by var & git log

major=0 # major release increment
minor=5 # number of main features / modules

source $PWD/mm.sh # override major & minor

appname=app-name
shorthead=$(git rev-parse --short HEAD)
git log > dmy-git-log
# patch count by commit count
patch=$(grep -in "    " dmy-git-log | wc -l)

echo "semver: $appname"
echo "$major.$minor.$patch $shorthead"