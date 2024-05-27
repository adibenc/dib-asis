# Sen 27 Mei 2024 10:43:27  +07
# https://semver.org/

appname=app-name
shorthead=$(git rev-parse --short HEAD)
major=0 # major release increment
minor=5 # number of main features / modules
git log > dmy-git-log
# patch count by commit count
patch=$(grep -in "    " dmy-git-log | wc -l)

echo "semver: $appname"
echo "$major.$minor.$patch $shorthead"