# banner v1

separator="================================================================"
todofile=~/todo
function todo(){
	if [ ! -f $todofile ] ; then
		echo \todo today  > $todofile
	fi
	#echo "f0:03:8c:76:5e:cb"
	echo "this is the todo list, sir.."
	echo 
	echo "todo today ("$(wc -l $todofile)")"
	cat $todofile
	#python3 ~/dib-asis/python/indo.py
}

function quote(){
	echo "We work at the dark to serve the light"
	#Watashitachiha kurayaminonakade hataraki, hikari o teikyō shimasu
}

function todo-edit(){
	gedit $todofile
}

function dib-banner(){
	date
	date +%Y%m%d
	echo $separator
	quote
	echo $separator
	todo
	echo $separator
}
