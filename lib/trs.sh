# translators

etrans-en() {
  local wdir=$DR_EN_WORDS
  local word="$1"
  word=$(echo $word | tr '[:upper:]' '[:lower:]')
  local file="$wdir$word.md"

  if [[ -f "$file" ]]; then
    echo $file
    cat "$file"
  else
    trans :en "$word" | tee "$file"
  fi
}

eten(){
  etrans-en $1
}

etenid(){
  trans en:id "$1"
}

etrans-la() {
  local wdir=$2
  local word=$3
  word=$(echo $word | tr '[:upper:]' '[:lower:]')
  local file="$wdir$word.md"

  if [[ -f "$file" ]]; then
    echo $file
    cat "$file"
  else
    trans :$1 "$word" | tee "$file"
  fi
}

etrans-id(){
  etrans-la id $DR_ID_WORDS $1
}

etrans-jp(){
  etrans-la jpn $DR_ID_WORDS $1
}

etrans-zh(){
	# trans zh:en 国有企业
	etrans-la zh:en $DR_ZH_WORDS $1
}