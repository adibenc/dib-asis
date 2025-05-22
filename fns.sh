# functions


#functions / oneliner
function random(){
	tr -cd \"[:digit:]\" < /dev/urandom | head -c 16
}

function randint(){
	echo $(($(random) % $1))
}

function fileline(){
	cat $1 | head -n $2 | tail -n 1
}

function linerange(){
	cat $1 | head -$2 | tail +$3
}

function getTodo(){
	for i in $(find .) ; do echo $i; cat $i | grep -in "to do" ; done;
}

function getFuncs(){
	for i in $(find .) ; do echo $i; cat $i | grep -in function ; done;
}

function getCiFuncs(){
	for i in $(find .) ; do echo $i; cat $i | grep -in function | grep -i "controllers\|model"; done;
}

function getImplement(){
	for i in $(find .) ; do echo $i; cat $i | grep -in implement ; done;
}

function gitgetchange(){
	#cp to dummy then upload
	git diff --name-only HEAD $1
}

function gitdummy(){
	#cp to dummy then upload
	for i in $(cat $1);do mkdir -p "dummy/`dirname $i`"; cp -v $i dummy/$i; done
}

# 4 master
function gsys(){
	git checkout staging
	git merge master
	git push
	git checkout master
}

function gdys(){
	git checkout staging
	git merge dev
	git push
	git checkout dev
}

# 4 main
function gsym(){
	git checkout staging
	git merge main
	git push
	git checkout main
}

# main to staging
# gmr main staging
# dev to main 
# gmr dev main
function gmr(){
	git checkout $2
	git merge $1
	git push
	git checkout $1
}

# cmds bookmark file access n run
function xBook(){
	cat -n $1
	# echo -ne "input >"
	echo 
	echo -e "input >"
	read in1
	cmd1=`cat $1 | head -n $in1 | tail -n 1`
	echo $in1" - "$cmd1
	# $(cat $1 | head -n $in1 | tail -n 1)
	$cmd1
}

# function hcd(){
	
# }

function nmclis(){
	nmcli device show wlp1s0
}

function baseStat(){
	echo "================================================================"
	logfile=$1
	echo $logfile
	echo "base log"
	cat $logfile | wc
	#return logfile
}

function findx(){
	echo "for f in \$\(find); do baseStat $f;done"
}

function initConda(){
__conda_setup="$('/home/zam/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zam/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zam/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zam/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
}

function initMconda(){
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/home/zam/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/home/zam/miniconda3/etc/profile.d/conda.sh" ]; then
			. "/home/zam/miniconda3/etc/profile.d/conda.sh"
		else
			export PATH="/home/zam/miniconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
}

# https://prefetch.net/blog/2020/07/14/decoding-json-web-tokens-jwts-from-the-linux-command-line/
function jwtd() {
    if [[ -x $(command -v jq) ]]; then
         jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "${1}"
         echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
    fi
}

tmx-killall(){
	while true;do tmux kill-session;echo kill;sleep 1;done
}

# dg1 mail.sysindo.com
# dg1 sysindo.com
dg1(){
	url=$1
	dig a $url
	dig mx $url
	dig txt $url
}

git-sync-d1(){
	git checkout dev
	git merge prod
}

git-sync-p1(){
	git checkout prod
	git merge dev
}

ext-proc(){
	ps aux --sort -%mem | paste -d ' ' > running_processes.csv
}

omm(){
	while true;do docker logs -f --tail 100 o-web;sleep 1;done
}

rlog(){
	echo > odoo-web-data/log
}

mkmd(){
	dx=$(date +%Y-%m-%d)
	touch $dx-$1.md
}

# mkirma `pwd`
mkirma(){
    current_dir=$(pwd)
    last_dir="${current_dir##*/}"

    module="$last_dir"
    model="$1"
    echo "access_${module}_${model},${module}.${model},model_${module}_${model},base.group_user,1,1,1,1"
}

res-sync(){
	rsync -a --no-perms --no-owner --no-group -logtD --info=progress2 $DRES_SRC $DRES_TMP
	rsync -a -logt --info=progress2 $DRES_TMP $DRES_DST
}

tkill(){
	while true;do tmux kill-session;sleep 1;done
}