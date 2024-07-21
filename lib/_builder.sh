function gcc-fnnp(){
	echo "gcc -m32  -fno-stack-protector -no-pie $1 -o $2"
	# gcc -m32  -fno-stack-protector -no-pie $1 -o $2
	gcc -fno-stack-protector -no-pie $1 -o $2
}