# yet another ietfrfc curl client
dldir=~/rfcs
function createdirs(){
	mkdir $dldir
}

function createDirIfNotExist(){
	echo "test"
	if [ -d $dldir ] ;then
		createdirs
		echo $dldir
	fi
}

function getietfrfc(){
	echo "get rfc from datatracker.."
	echo "$rfccode"
	rfccode=rfc$1
	url=https://datatracker.ietf.org/doc/html/$rfccode.txt
	echo $url
	curl $url
}

function getRfcFromEditor(){
	echo "get rfc from editor.."
	# https://www.rfc-editor.org/rfc/rfc1.txt
	echo "$rfccode"
	rfccode=rfc$1
	url=https://www.rfc-editor.org/rfc/$rfccode.txt
	echo $url
	curl $url
}

function getAndSave(){
	echo "get and save.."
	fname=rfc$1.txt
	saveto=$dldir/$fname
	getRfcFromEditor $1 > $saveto
}

# https://linuxize.com/post/bash-check-if-file-exists/
function getIfNotExist(){
	fname=rfc$1.txt
	at=$dldir/$fname
	if [ -f "$at" ]; then
		echo "$at exists."
		vim $at
	else
		echo "$at not exists."
		touch $at
		getAndSave $1
		vim $at
	fi
}

mkdir $dldir
getIfNotExist $1

# usage: ./ietfrfc.sh <rfc-number>