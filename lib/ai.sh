# https://simonwillison.net/2023/May/18/cli-tools-for-llms/
# curl -s https://www.nytimes.com/ \
#   strip-tags .story-wrapper \
#   | ttok -t 4000 \
#   | llm --system 'summary bullet points'

cl-dsp(){
	claude --dangerously-skip-permissions
}

# llm -m gemini-1.5-flash-latest 'explain ttx'
llm-gm1(){
	# wip fix
	quest=$1
	# llm -m gemini-1.5-flash-latest --key $GEMINI_API_KEY $quest
	# llm -m gemini-1.5-flash-latest --key $GEMINI_API_KEY $quest
	# llm -m gemini-2.0-flash --key $GEMINI_API_KEY $quest
	llm -m gemini-flash-latest --key $GEMINI_API_KEY $quest
	# llm -m gemini-2.0-flash-001 --key $GEMINI_API_KEY $quest
}

llm-an1(){
	# wip fix
	quest=$1
	# llm -m gemini-1.5-flash-latest --key $GEMINI_API_KEY $quest
	# llm -m gemini-1.5-flash-latest --key $GEMINI_API_KEY $quest
	# llm -m gemini-2.0-flash --key $GEMINI_API_KEY $quest
	llm -m claude-sonnet-4.5 --key $ANT_API_KEY $quest
	# llm -m gemini-2.0-flash-001 --key $GEMINI_API_KEY $quest
}

llm-ds(){
	quest=$1
	llm -m deepseek --key $DEEPSEEK_API_KEY $quest
}

: "
llm -m deepseek-chat 'five great names for a pet ocelot'
llm -m deepseek-reasoner 'solve \\int \\frac{\\ln(x)\\arctan(x)}{x^2+1} dx'
llm -m deepseek-coder 'how to reverse a linked list in python'
"
# llm -m gemini-1.5-flash-latest 'explain ttx'
llm-dsc(){
	quest=$1
	llm -m deepseek-chat --key $DEEPSEEK_API_KEY $quest
}

llm-dsr(){
	quest=$1
	llm -m deepseek-reasoner --key $DEEPSEEK_API_KEY $quest
}

llm-dscoder(){
	quest=$1
	llm -m deepseek-coder --key $DEEPSEEK_API_KEY $quest
}

llm-gmx(){
	dx=$(date +%Y%m%d-%H%M%S)
	printf "%s" "$x" | llm-gm1 | tee gm1-$dx.md
}

llm-anx(){
	dx=$(date +%Y%m%d-%H%M%S)
	printf "%s" "$x" | llm-an1 | tee an1-$dx.md
}

llm-gmc(){
	dx=$(date +%Y%m%d-%H%M%S)
	printf "%s" "$x" | llm-gm1 -c | tee gm1-$dx.md
}

llm-gmch(){
	llm chat -m gemini-1.5-flash-latest --key $GEMINI_API_KEY -c
}

vimx(){
	vim ~/x
	x=$(cat ~/x)
}

vimxr(){
	echo > ~/x
	vim ~/x
	x=$(cat ~/x)
}

vimxsh(){
	vim ~/x.sh
	source ~/x.sh
}

vimxshr(){
	echo > ~/x.sh
	vim ~/x.sh
	source ~/x.sh
}