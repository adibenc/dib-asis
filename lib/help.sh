help(){
	echo "dib-bot commands"
	echo "================================================================"
	echo "aliases   -> $__dir/alias.sh"
	echo "bookmarks -> $__dir/bookmark.sh"
	echo "secrets   -> $__dir/secret.sh"
	echo "functions -> $__dir/fns.sh"
	echo "lib       -> $__lib"
	echo "================================================================"
	echo "grep a name to search:"
	echo "  grep -h '^\S*(){' \$__dir/*.sh \$__lib/*.sh"
}
