# 39358083848620420
#aliases
#echo "aliases"
#echo $__dir

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $__dir/fns.sh

# dib-bot aliases
alias dflush="sudo rm -rf $__dir/result/* && sudo rm -rf $__dir/temp/*"
alias als="geany /home/zam/dib-asis/alias.sh"
alias main1="geany /home/zam/dib-asis/main.sh"
alias reinit="source ~/dib-asis/main.sh"
alias codeasis="code ~/dib-asis/"

#aliases
alias filez="cd /media/data3/binsrc/4linux/FileZilla3/bin && ./filezilla"
alias aptbersih="sudo apt-get clean"
alias p8="ping 8.8.8.8"
alias p1="ping 1.1.1.1"
alias telegram="/media/data1/bins/4linux/telegram/Telegram"
alias dibmanage="localc /media/data1/Documents/meschedule-g2.xlsx"
alias run-edu="~/run-edu"
alias hl10="history | tail -n 10"
# alias firebase="/media/data3/binsrc/4linux/firebase-tools-linux"
alias gp="git push"
alias gpu="git pull"
alias dcn="curl https://dict.cn/$1 | head -n 200 | tail -n 100"
alias gwp="grep -inr 'wip\|todo' . > ./dummy/_todo.md"
alias upp="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

# dir aliases
__proj="/media/data1/project1"
__da_m1="/media/data1/"
__da_m2="/media/data2/"
__da_cx="/media/data1/confidential"

# override / make nickname sys binaries

alias code="code --user-data-dir ~/.config/Code/"
# alias cps="/usr/bin/composer"
alias mysql="/opt/lampp/bin/mysql"
alias mysqldump="/opt/lampp/bin/mysqldump"

# alias php="/opt/lampp/bin/php"
alias python="python2.7"
alias py3="python3"
alias r="R"
alias rf="R -f "
alias rs="Rscript"
alias phuml="/media/data3/projects/opensource/real.phuml/src/app/phuml"
alias postman="cd /media/data1/bins/Postman && ./Postman"
alias phpunit="/opt/lampp/bin/phpunit"
alias ru3="rvm use 3.1.0"

alias firefox="/media/data3/firefox/firefox"
alias apktool="java -jar /media/data3/play/tools/apktool_2.3.4.jar"
alias dex2jar="/media/data3/play/tools/revxbinexp/dex2jar-2.0/d2j-dex2jar.sh"
alias cutter="/media/data3/play/tools/revxbinexp/Cutter-v1.12.0-x64.Linux.AppImage"
# alias composer="/usr/local/bin/composer"
# alias composer="php ~/dib-asis/lib/composer.phar"
# alias typora="/media/data1/bins/4linux/Typora-linux-x64/bin/Typora-linux-x64/Typora"
alias yed="java -jar /media/data3/binsrc/yEd-3.19.1.1/yed-3.19.1.1/yed.jar"
#jars
alias stman="/media/data1/project1/ssh-tunnel-manager/ssh-tunnel-manager.sh"

#sudo required
alias lamst="sudo /opt/lampp/lampp start"
alias lamrst="sudo /opt/lampp/lampp restart"
alias lamstop="sudo /opt/lampp/lampp stop"
alias sync-ci4="$__dir/lib/_sync-ci4.sh"
#initConda

__secret=$__dir"/secrets"
#bookmark
alias dcd="xBook $__secret/dirBm"
alias dcd2="xBook $__secret/dirBm2"
alias dvc="xBook $__secret/dirBmVc"

alias fee="xBook $__secret/_fee1"
alias ddo="xBook $__secret/ddo"
alias dev1="xBook $__secret/dev1"
alias dev2="xBook $__secret/dev2"
alias dev3="xBook $__secret/dev3"
alias dev4="xBook $__secret/dev4"
alias dev5="xBook $__secret/dev5"
alias dr="xBook $__secret/dr"
alias dev="dev1"
alias ai="xBook $__secret/ai"
alias tmx="xBook $__secret/scttmux"
alias adbs="xBook $__secret/adbs"
alias amix="xBook $__secret/amix"

# devops
# leet yoo
for i in $(seq 0 10);do
	alias kb$i="xBook $__secret/kbs/kb$i"
done;
# alias kubectl="minikube kubectl --"
alias abx="xBook $__secret/abx"
alias bak="xBook $__secret/bak"

# utils
alias db="xBook $__secret/db"
alias ut1="xBook $__secret/ut1"
alias qq="xBook $__secret/ut1"
alias ccx="xBook $__secret/ccx"
alias aux="xBook $__secret/aux"

# toolbox
alias tb1="xBook $__secret/tb1"

alias game="xBook $__secret/play"
alias sev="xBook $__secret/sev"
alias sev2="xBook $__secret/sev2"
alias enc="xBook $__secret/secretenc"
alias kong="xBook $__secret/secretkongBm"
alias sdd="xBook $__secret/secretSnipBm1"
alias stat1="xBook $__secret/secretstatBm"
alias dib="xBook $__secret/secretDibBm"
alias codes="xBook $__secret/codes"
alias rsys="xBook $__secret/rsyncs"
alias app="xBook $__secret/app"
alias medias="xBook $__secret/medias"
alias mapid="cat $__dir/lib/id"

alias wiki="/media/data1/confidential/codes/wiki/w1.py"
alias get-sv="$__lib/_get-sv.sh"
#alias stat1="baseStat"

alias tf1='python3 -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"'
alias tf2='python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices(\"GPU\"))"'

alias tdcd="xBook $__secret/tdir"
alias tdev="xBook $__secret/tdev"
alias tcodes="xBook $__secret/tcodes"
alias bsar="xBook $__secret/bmSar"

# mount dib veracrypt drives
alias mvc="/media/data1/project1/server-things/dib01/_enc/vc-select.sh"

#sec
alias rsactftool="python3 /media/data3/play/tools/RsaCtfTool/RsaCtfTool.py"
alias stegsolve="java -jar /media/data3/play/tools/stegsolve.jar"
#alias ida6="cd /media/data2/Program\ Files/IDA\ 6.6 && winefile"
alias ida6="cd /media/data2/IDA\ 6.6 && winefile"
alias drand="python -c \"import random;print(random.randint(1,100))\""
alias phpunit="./../../vendor/bin/phpunit"
alias sshkey="ssh-keygen"
alias install-themes="git clone https://github.com/Gogh-Co/Gogh.git gogh"

#set ssh client timout
#/etc/ssh/ssh_config and set directive ServerAliveInterval to a value like 100:

# other configs
#ServerAliveInterval 100
