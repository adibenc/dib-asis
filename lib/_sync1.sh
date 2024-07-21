function sync1(){
	sv1=`get-sv`
	pk=/media/data1/project1/server-things/dib01/176/d176.pem
	dir1=$HOME/drop/public/68616c6f/
	updated_at=$(date +%Y%m%d-%H-%M-%S)
	echo $sv1
	sv1=${sv1// /\-}
	
	rm -f $dir1/last*
	rm -f $dir1/updated*

	touch $dir1/last-$sv1
	touch $dir1/updated_at-$updated_at
	ssv1=$sv1
	cp $dir1/x_edatun\ node.postman_collection.json $dir1/$ssv1-edatun\ node.postman_collection.json
	ls -lah $dir1
	# 
	ssh root@103.13.206.222 "rm -f /home/adib/drop/public/68616c6f/*"
	rsync -a -logt --info=progress2 -e "ssh -i $pk" /home/zam/drop/public/68616c6f/ root@103.13.206.222:/home/adib/drop/public/68616c6f/
}