# 
# dib-bot
# https://kvz.io/bash-best-practices.html
# main entry 

# include this to .bashrc
# source ~/dib/main.sh

echo "dib-bot init"

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)"

__bmfile1=$__dir"/bookmarkData"
__lib=$__dir"/lib"
__result=$__dir"/result"

#echo "__dir "$__dir
#echo "__file "$__file
#echo "__base "$__dir
#echo "__root "$__root

source $__dir/alias.sh
source $__dir/bookmark.sh
source $__dir/secret.sh
source $__dir/exports.sh

#libs
source $__lib/ai.sh
source $__lib/dpkg-backup.sh
source $__lib/banner.sh
source $__lib/sl.sh
source $__lib/_builder.sh
source $__lib/_sync1.sh
source $__lib/trs.sh

#mapid
dib-banner

GIT_UNSAFE_IGNORE_OWNERS=zam

echo $separator
#show-daily-zn
