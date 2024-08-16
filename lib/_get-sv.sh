#!/bin/bash
# Sen 27 Mei 2024 10:43:27  +07
# https://semver.org/

# @adibenc
# simple semver by var & git log

major=0 # major release increment
minor=5 # number of main features / modules

appname=app-name
shorthead=$(git rev-parse --short HEAD)

git log > dmy-git-log
# patch count by commit count
patch=$(grep -in "    " dmy-git-log | grep -v "Merge" | wc -l)

source $PWD/mm.sh # override major & minor

if [ $1 = "1" ];then
	echo "semver: $appname"
fi
echo "$major.$minor.$patch $shorthead"