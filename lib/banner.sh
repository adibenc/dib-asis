# banner v1

separator="================================================================"
todofile=~/todo
function todo(){
	if [ ! -f $todofile ] ; then
		echo \todo today  > $todofile
	fi
	
	echo "todo today ("$(wc -l $todofile)")"
	cat $todofile
}

function todo-edit(){
	gedit $todofile
}

function dib-banner(){
	date
	echo $separator
	echo "buss lang buss resr buss lang buss"
	echo $separator
	todo
	echo $separator
}
