# banner v1

separator="================================================================"
todofile=~/todo
function todo(){
	if [ ! -f $todofile ] ; then
		echo \todo today  > $todofile
	fi
	echo
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
	echo $separator
	quote
	echo $separator
	todo
	echo $separator
}
