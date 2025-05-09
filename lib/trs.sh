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