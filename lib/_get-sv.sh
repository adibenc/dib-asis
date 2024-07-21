#!/bin/bash
# Sen 27 Mei 2024 10:43:27  +07
# https://semver.org/

# @adibenc
# simple semver by var & git log

major=0 # major release increment
minor=5 # number of main features / modules

appname=app-name
shorthead=$(git rev-parse --short HEAD)
source $PWD/mm.sh # override major & minor

git log > dmy-git-log
# patch count by commit count
patch=$(grep -in "    " dmy-git-log | grep -v "Merge" | wc -l)

if [ $1 -eq "1" ];then
	echo "semver: $appname"
fi
echo "$major.$minor.$patch $shorthead"