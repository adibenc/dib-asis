# banner v1

separator="================================================================"
todofile=~/todo.md
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

# function dib-banner(){
# 	date
# 	date +%Y%m%d
# 	date +%Y-%m-%d-%H%M%S
# 	date "+%Y-%m-%d %H:%M:%S"
# 	echo $separator
# 	quote
# 	echo $separator
# 	todo
# 	echo $separator
# }

function dib-banner(){
	local o
	o+=$(date)"\n"
	o+=$(date +%Y%m%d)"\n"
	o+=$(date +%Y-%m-%d-%H%M%S)"\n"
	o+=$(date "+%Y-%m-%d %H:%M:%S")"\n"
	o+=$separator"\n"
	o+=$(quote)"\n"
	o+=$separator"\n"
	o+=$(todo)"\n"
	o+=$separator
	
	# echo -e "$output" | tte slide
	# echo -e "$o" | tte wipe
	echo -e "$o" 
}
