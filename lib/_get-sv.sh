# Rab 22 Mei 2024 05:24:42  +07
# https://semver.org/

appname=app-name
shorthead=$(git rev-parse --short HEAD)
major=0
minor=36
patch=0

echo "semver: $appname"
echo "$major.$minor.$patch $shorthead"