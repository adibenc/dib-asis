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
alias npm="/media/data3/Installsrc/4linux/node-v14.15.4-linux-x64/bin/npm"
alias node="/media/data3/Installsrc/4linux/node-v14.15.4-linux-x64/bin/node"
alias mysql="/opt/lampp/bin/mysql"
alias mysqldump="/opt/lampp/bin/mysqldump"

alias python="python2.7"
alias phuml="/media/data3/projects/opensource/real.phuml/src/app/phuml"
alias postman="cd /media/data3/Installsrc/Postman/ && ./Postman"
alias phpunit="/opt/lampp/bin/phpunit"

alias firefox="/media/data3/firefox/firefox"
alias apktool="java -jar /media/data3/play/tools/apktool_2.3.4.jar"
alias dex2jar="/media/data3/play/tools/revxbinexp/dex2jar-2.0/d2j-dex2jar.sh"
alias cutter="/media/data3/play/tools/revxbinexp/Cutter-v1.12.0-x64.Linux.AppImage"
alias composer="/usr/local/bin/composer"
alias typora="/media/data3/Installsrc/4linux/Typora-linux-x64/bin/Typora-linux-x64/Typora"
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

#initConda

__secret=$__dir"/secrets"
#bookmark
alias dcd="xBook $__secret/dirBm"
alias dcd2="xBook $__secret/secretdirBm2"
alias dev1="xBook $__secret/dev1"
alias dev2="xBook $__secret/dev2"
alias dev3="xBook $__secret/dev3"
alias dev4="xBook $__secret/dev4"
alias dev5="xBook $__secret/dev5"
alias sev="xBook $__secret/sev"
alias sev2="xBook $__secret/sev2"
alias enc="xBook $__secret/secretenc"
alias kong="xBook $__secret/secretkongBm"
alias sdd="xBook $__secret/secretSnipBm1"
alias stat1="xBook $__secret/secretstatBm"
alias dib="xBook $__secret/secretDibBm"
alias codes="xBook $__secret/codes"
alias medias="xBook $__secret/medias"
alias mapid="cat $__dir/lib/id"
#alias stat1="baseStat"

#sec
alias rsactftool="python3 /media/data3/play/tools/RsaCtfTool/RsaCtfTool.py"
alias stegsolve="java -jar /media/data3/play/tools/stegsolve.jar"
#alias ida6="cd /media/data2/Program\ Files/IDA\ 6.6 && winefile"
alias ida6="cd /media/data2/IDA\ 6.6 && winefile"
alias drand="python -c \"import random;print(random.randint(1,100))\""
alias phpunit="./../../vendor/bin/phpunit"
alias sshkey="ssh-keygen"

#set ssh client timout
#/etc/ssh/ssh_config and set directive ServerAliveInterval to a value like 100:

# other configs
#ServerAliveInterval 100
