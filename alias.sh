# 39358083848620420
#aliases
#echo "aliases"
#echo $__dir

# dib-bot aliases
alias dflush="sudo rm -rf $__dir/result/* && sudo rm -rf $__dir/temp/*"
alias als="geany /home/zam/dib-asis/alias.sh"
alias main1="geany /home/zam/dib-asis/main.sh"
alias reinit="source ~/dib-asis/main.sh"
alias codeasis="code ~/dib-asis/"

#aliases
alias filez="cd /media/data3/Installsrc/4linux/FileZilla3/bin && ./filezilla"
alias aptbersih="sudo apt-get clean"
alias p8="ping 8.8.8.8"
alias p1="ping 1.1.1.1"
alias telegram="/media/data3/Installsrc/4linux/telegram/Telegram"
alias dibmanage="localc /media/data1/Documents/meschedule-g2.xlsx"
alias run-edu="~/run-edu"
alias hl10="history | tail -n 10"
alias firebase="/media/data3/Installsrc/4linux/firebase-tools-linux"
alias gp="git push"
alias gpu="git pull"
alias dcn="curl https://dict.cn/$1 | head -n 200 | tail -n 100"

# override / make nickname sys binaries
alias cps="/usr/bin/composer"
alias npm="/media/data1/installs/4linux/node-v14.15.4-linux-x64/bin/npm"
alias node="/media/data1/installs/4linux/node-v14.15.4-linux-x64/bin/node"
alias mysql="/opt/lampp/bin/mysql"
alias mysqldump="/opt/lampp/bin/mysqldump"

alias python="python2.7"
alias py3="python3"
alias r="R"
alias rf="R -f "
alias rs="Rscript"
alias phuml="/media/data3/projects/opensource/real.phuml/src/app/phuml"
alias postman="cd /media/data1/installs/Postman && ./Postman"
alias phpunit="/opt/lampp/bin/phpunit"

alias firefox="/media/data3/firefox/firefox"
alias apktool="java -jar /media/data3/play/tools/apktool_2.3.4.jar"
alias dex2jar="/media/data3/play/tools/revxbinexp/dex2jar-2.0/d2j-dex2jar.sh"
alias cutter="/media/data3/play/tools/revxbinexp/Cutter-v1.12.0-x64.Linux.AppImage"
# alias composer="/usr/local/bin/composer"
alias composer="php ~/composer.phar"
alias typora="/media/data1/installs/4linux/Typora-linux-x64/bin/Typora-linux-x64/Typora"
alias yed="java -jar /media/data3/Installsrc/yEd-3.19.1.1/yed-3.19.1.1/yed.jar"
#jars

#sudo required
alias lamst="sudo /opt/lampp/lampp start"
alias lamrst="sudo /opt/lampp/lampp restart"
alias lamstop="sudo /opt/lampp/lampp stop"

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
	echo -ne "input >"
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

#initConda

__secret=$__dir"/secrets"
#bookmark
alias dcd="xBook $__secret/dirBm"
alias dcd2="xBook $__secret/dirBm2"
alias ddo="xBook $__secret/ddo"
alias dev1="xBook $__secret/dev1"
alias dev2="xBook $__secret/dev2"
alias dev3="xBook $__secret/dev3"
alias dev4="xBook $__secret/dev4"
alias dev5="xBook $__secret/dev5"
alias dev="dev1"
alias ai="xBook $__secret/ai"

alias game="xBook $__secret/play"
alias sev="xBook $__secret/sev"
alias sev2="xBook $__secret/sev2"
alias enc="xBook $__secret/secretenc"
alias kong="xBook $__secret/secretkongBm"
alias sdd="xBook $__secret/secretSnipBm1"
alias stat1="xBook $__secret/secretstatBm"
alias dib="xBook $__secret/secretDibBm"
alias codes="xBook $__secret/codes"
alias app="xBook $__secret/app"
alias medias="xBook $__secret/medias"
alias mapid="cat $__dir/lib/id"
#alias stat1="baseStat"

alias tf1='python3 -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"'
alias tf2='python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices(\"GPU\"))"'

alias tdcd="xBook $__secret/tdir"
alias tdev="xBook $__secret/tdev"
alias tcodes="xBook $__secret/tcodes"

#sec
alias rsactftool="python3 /media/data3/play/tools/RsaCtfTool/RsaCtfTool.py"
alias stegsolve="java -jar /media/data3/play/tools/stegsolve.jar"
#alias ida6="cd /media/data2/Program\ Files/IDA\ 6.6 && winefile"
alias ida6="cd /media/data2/IDA\ 6.6 && winefile"
alias drand="python -c \"import random;print(random.randint(1,100))\""
alias phpunit="./../../vendor/bin/phpunit"
alias sshkey="ssh-keygen"
alias installthemes="git clone https://github.com/Gogh-Co/Gogh.git gogh"

#set ssh client timout
#/etc/ssh/ssh_config and set directive ServerAliveInterval to a value like 100:

# other configs
#ServerAliveInterval 100
