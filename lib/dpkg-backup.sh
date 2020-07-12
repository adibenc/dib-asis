# dpkg -l backup
# https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages

function dpkg-backup(){
	__backRes=$__result"/dpkg-backup"
	# if dir not exist
	if [ ! -d $__backRes ]; then
		mkdir $__backRes
	fi

	dpkg --get-selections > $__backRes/Package.list
	sudo cp -R /etc/apt/sources.list* $__backRes
	sudo apt-key exportall > $__backRes/Repo.keys
}

function dpkg-restore(){
	sudo apt-key add $__backRes/Repo.keys
	sudo cp -R $__backRes/sources.list* /etc/apt/
	sudo apt-get update
	sudo apt-get install dselect
	sudo dselect update
	sudo dpkg --set-selections < $__backRes/Package.list
	sudo apt-get dselect-upgrade -y
}
