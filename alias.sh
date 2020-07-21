#aliases
#echo "aliases"
#echo $__dir

# dib-bot aliases
alias dflush="sudo rm -rf $__dir/result/* && sudo rm -rf $__dir/temp/*"

#aliases
alias filez="cd /media/data3/Installsrc/4linux/FileZilla3/bin && ./filezilla"
alias aptbersih="sudo apt-get clean"
alias p8="ping 8.8.8.8"
alias p1="ping 1.1.1.1"
alias telegram="/media/data3/Installsrc/4linux/telegram/Telegram"
alias dibmanage="localc /media/data1/Documents/meschedule-g2.xlsx"
alias ssh-add-me="ssh-add ~/.ssh/dib.gitkey"
alias ssh-add-github="ssh-add ~/.ssh/dib.githubkey"
alias run-edu="~/run-edu"

alias firebase="/media/data3/Installsrc/4linux/firebase-tools-linux"

# override / make nickname sys binaries
alias npm="/media/data3/Installsrc/4linux/node-v12.16.1-linux-x64/bin/npm"
alias node="/media/data3/Installsrc/4linux/node-v12.16.1-linux-x64/bin/node"
alias mysql="/opt/lampp/bin/mysql"
alias mysqldump="/opt/lampp/bin/mysqldump"

alias phuml="/media/data3/projects/opensource/real.phuml/src/app/phuml"
alias postman="cd /media/data3/Installsrc/Postman/ && ./Postman"
alias phpunit="/opt/lampp/bin/phpunit"

#jars

#sudo required
alias lamst="sudo /opt/lampp/lampp start"
alias lamrst="sudo /opt/lampp/lampp restart"

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

# cmds bookmark file access n run
function xBook(){
	cat -n $__dir/$1
	echo -ne "input >"
	read in1
	cmd1=`cat $__dir/$1 | head -n $in1 | tail -n 1`
	echo $in1" - "$cmd1
	$(cat $__dir/$1 | head -n $in1 | tail -n 1)
}

#bookmark
alias dcd="xBook dirBm"
alias dev1="xBook devBm"

#sec
alias rsactftool="python3 /media/data3/play/tools/RsaCtfTool/RsaCtfTool.py"
alias stegsolve="java -jar /media/data3/play/tools/stegsolve.jar"
alias ida6="cd /media/data2/Program\ Files/IDA\ 6.6 && winefile"
alias drand="python -c \"import random;print(random.randint(1,100))\""

#exports
#flutter & go
export PATH="$PATH:/media/data3/flutter/bin\
:/usr/local/go/bin"
export ANDROID_HOME="/media/data3/Android/Sdk"
