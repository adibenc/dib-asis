# functions


#functions / oneliner
random(){
	tr -cd \"[:digit:]\" < /dev/urandom | head -c 16
}

randint(){
	echo $(($(random) % $1))
}

fileline(){
	cat $1 | head -n $2 | tail -n 1
}

linerange(){
	cat $1 | head -$2 | tail +$3
}

getTodo(){
	for i in $(find .) ; do echo $i; cat $i | grep -in "to do" ; done;
}

getFuncs(){
	for i in $(find .) ; do echo $i; cat $i | grep -in ; done;
}

getCiFuncs(){
	for i in $(find .) ; do echo $i; cat $i | grep -in | grep -i "controllers\|model"; done;
}

getImplement(){
	for i in $(find .) ; do echo $i; cat $i | grep -in implement ; done;
}

gitgetchange(){
	#cp to dummy then upload
	git diff --name-only HEAD $1
}

gitdummy(){
	#cp to dummy then upload
	for i in $(cat $1);do mkdir -p "dummy/`dirname $i`"; cp -v $i dummy/$i; done
}

# 4 master
gsys(){
	git checkout staging
	git merge master
	git push
	git checkout master
}

gdys(){
	git checkout staging
	git merge dev
	git push
	git checkout dev
}

# 4 main
gsym(){
	git checkout staging
	git merge main
	git push
	git checkout main
}

# main to staging
# gmr main staging
# dev to main 
# gmr dev main
gmr(){
	git checkout $2
	git merge $1
	git push
	git checkout $1
}

# cmds bookmark file access n run
xBook(){
	cat -n $1
	# echo -ne "input >"
	echo 
	echo -e "input >"
	read in1
	cmd1=`cat $1 | head -n $in1 | tail -n 1`
	echo $in1" - "$cmd1
	# $(cat $1 | head -n $in1 | tail -n 1)
	$cmd1
}

# hcd(){
	
# }

nmclis(){
	nmcli device show wlp1s0
}

sep(){
	n=$1
	python3 -c "print('='*$n)"
}

dsep(){
	n=$1
	dx=$(date +%Y-%m-%d)
	echo -ne "$dx "; sep $n
}

baseStat(){
	echo "================================================================"
	logfile=$1
	echo $logfile
	echo "base log"
	cat $logfile | wc
	#return logfile
}

findx(){
	echo "for f in \$\(find); do baseStat $f;done"
}

initConda(){
__conda_setup="$('/home/zam/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zam/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/zam/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/zam/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
}

initMconda(){
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/home/zam/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/home/zam/miniconda3/etc/profile.d/conda.sh" ]; then
			. "/home/zam/miniconda3/etc/profile.d/conda.sh"
		else
			export PATH="/home/zam/miniconda3/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
}

# https://prefetch.net/blog/2020/07/14/decoding-json-web-tokens-jwts-from-the-linux-command-line/
jwtd() {
    if [[ -x $(command -v jq) ]]; then
         jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "${1}"
         echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
    fi
}

tmx-killall(){
	while true;do tmux kill-session;echo kill;sleep 1;done
}

# dg1 mail.sysindo.com
# dg1 sysindo.com
dg1(){
	url=$1
	dig a $url
	dig mx $url
	dig txt $url
}

git-sync-d1(){
	git checkout dev
	git merge prod
}

git-sync-p1(){
	git checkout prod
	git merge dev
}

ext-proc(){
	ps aux --sort -%mem | paste -d ' ' > running_processes.csv
}

omm(){
	while true;do docker logs -f --tail 100 o-web;sleep 1;done
}

rlog(){
	truncate -s 0 odoo-web-data/log
	truncate -s 0 app/logs/main.log
	truncate -s 0 application/logs/general.log
	truncate -s 0 storage/logs/access.log
	truncate -s 0 storage/logs/laravel.log
}

trlog(){
	truncate -s 0 var/log/nginx/*.log
	truncate -s 0 writable/logs/*.log
	truncate -s 0 storage/logs/laravel.log
}

rmdist(){
	find app -type d -name dist -exec rm -rf {} +
}

mkmd(){
	dx=$(date +%Y-%m-%d)
	touch $dx-$1.md
}

mkdmy(){
	dx=$(date +%Y-%m-%d)
	touch dmy-$dx-$1.md
}

# mkirma `pwd`
mkirma(){
    current_dir=$(pwd)
    last_dir="${current_dir##*/}"

    module="$last_dir"
    model="$1"
    echo "access_${module}_${model},${module}.${model},model_${module}_${model},base.group_user,1,1,1,1"
}

res-sync(){
	rsync -a --no-perms --no-owner --no-group -logtD --info=progress2 $DRES_SRC $DRES_TMP
	rsync -a -logt --info=progress2 $DRES_TMP $DRES_DST
}

tkill(){
	while true;do tmux kill-session;sleep 1;done
}

sy-tool(){
	find . -type f -exec mv {} . \;
}

# xtended flatted html n family to pure plain text md
xmd(){
	dx=$(date +%Y%m%d-%H%M%S)
	f=$1
	# cat $f | strip-tags | tee xmd-$dx.md
	strip-tags | sed -f ~/dib-asis/lib/seds/s1 | tee xmd-$dx.md
}

xmdt(){
	dx=$(date +%Y%m%d-%H%M%S)
	f=$1
	# cat $f | strip-tags | tee xmd-$dx.md
	strip-tags | sed -f ~/dib-asis/lib/seds/s1 | tee xmd-$dx.md
}

xcurl(){
	url=$1
	dx=$(date +%Y%m%d-%H%M%S)
	curl $url | xmd
}

# extract_notes file
extract_notes() {
	local input="$1"
	local base="${input%.*}"
	local mono_wav="${base}_mono.wav"
	local pitch_txt="${base}_pitch.txt"

	# Step 1: Convert to mono WAV with 16kHz sampling rate
	echo "Converting to mono, 16kHz WAV..."
	ffmpeg -y -i "$input" -ac 1 -ar 16000 "$mono_wav"

	# Step 2: Extract pitch using aubio
	echo "Extracting pitch with aubio..."
	aubio pitch "$mono_wav" > "$pitch_txt"

	echo "Pitch extraction complete. Output saved to: $pitch_txt"
}

midi_to_mp3() {
	local midi_file="$1"
	local out_file="${2:-${midi_file%.mid}.mp3}"
	local wav_file="${midi_file%.mid}.wav"
	local soundfont="${3:-/usr/share/sounds/sf2/FluidR3_GM.sf2}"

	if [[ ! -f "$midi_file" ]]; then
		echo "❌ MIDI file not found: $midi_file"
		return 1
	fi

	if [[ ! -f "$soundfont" ]]; then
		echo "❌ SoundFont not found: $soundfont"
		return 1
	fi

	echo "🎹 Converting $midi_file to WAV..."
	fluidsynth -ni "$soundfont" "$midi_file" -F "$wav_file" -r 44100

	echo "🎧 Encoding to MP3..."
	ffmpeg -y -i "$wav_file" -codec:a libmp3lame -qscale:a 2 "$out_file"

	echo "✅ Saved: $out_file"
}

fcco() {
	dx=$(date +%Y%m%d-%H%M%S)
	fo="$dx-cur.log"
	for f in $(find -type f); do
		echo >> "$fo"
		echo "$f" >> "$fo"
		echo "Modified: $(stat -c %y "$f")" >> "$fo"
		echo >> "$fo"
		cat "$f" >> "$fo"
	done
}

lo-pdf(){
	libreoffice --headless --convert-to pdf $1
}

pa-clear(){
	php artisan config:clear
	php artisan cache:clear
	php artisan route:clear # if it's a route-related issue
	php artisan view:clear  # if it's a view-related issue
}

#!/bin/bash

# Function to get the sink input ID for a given application name
get_app_sink_id() {
    local app_name="$1"
    pactl list sink-inputs | awk -v app="$app_name" '
    /Sink Input #/ { current_id = $3 }
    /application.name =/ {
        gsub(/"/, "", $3); # Remove quotes
        if ($3 == app) {
            print current_id;
            exit;
        }
    }'
}

# read files recursively and put into a var
# sample: x=$(readrx)
readrx() {
  local src_dir="$1"

  find "$src_dir" -type f | while read -r file; do
    if file --mime "$file" | grep -q text/; then
      echo ">>> $file"
      cat "$file"
      echo
    fi
  done
}


# Usage:
# set_app_volume "Firefox" "50%"
# set_app_volume "mpv" "+10%"
set_app_volume() {
    local app_name="$1"
    local volume="$2"
    local sink_id=$(get_app_sink_id "$app_name")

    if [ -n "$sink_id" ]; then
        echo "Setting volume for '$app_name' (Sink ID: $sink_id) to $volume..."
        pactl set-sink-input-volume "$sink_id" "$volume"
    else
        echo "Error: Application '$app_name' not found or not playing audio."
    fi
}

# Example usage:
# Adjust Firefox volume to 50%
# set_app_volume "Firefox" "50%"

# Increase mpv volume by 5%
# set_app_volume "mpv" "+5%"

# Mute Spotify
# To mute, you'd need a separate function as pactl set-sink-input-mute is different
# set_app_mute() {
#     local app_name="$1"
#     local action="$2" # "toggle", "1" (mute), "0" (unmute)
#     local sink_id=$(get_app_sink_id "$app_name")
#
#     if [ -n "$sink_id" ]; then
#         echo "Setting mute status for '$app_name' (Sink ID: $sink_id) to $action..."
#         pactl set-sink-input-mute "$sink_id" "$action"
#     else
#         echo "Error: Application '$app_name' not found or not playing audio."
#     fi
# }
# set_app_mute "Spotify" "toggle"

#!/usr/bin/env bash

# sp2find file.md
sp2find(){
	# input_file="xmd-20250711-172549.md"
	input_file=$1
	# initialize stack
	declare -a stack

	while IFS= read -r line; do
	# count leading tabs (real tabs, not spaces)
	indent=$(echo "$line" | sed -E 's/^(\t*).*/\1/' | awk '{ print length }')

	# extract the actual name (remove tabs/spaces from start)
	name=$(echo "$line" | sed 's/^[[:space:]]*//')

	[[ -z "$name" ]] && continue

	# update path stack
	stack[$indent]="$name"

	# clear deeper levels
	for ((i=indent+1; i<${#stack[@]}; i++)); do
		unset "stack[i]"
	done

	# join parts
	printf "./%s\n" "$(IFS=/; echo "${stack[*]}")"

	done < "$input_file"
}
