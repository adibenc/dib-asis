# https://simonwillison.net/2023/May/18/cli-tools-for-llms/
# curl -s https://www.nytimes.com/ \
#   strip-tags .story-wrapper \
#   | ttok -t 4000 \
#   | llm --system 'summary bullet points'

# llm -m gemini-1.5-flash-latest 'explain ttx'
llm-gm1(){
	quest=$1
	llm -m gemini-1.5-flash-latest --key $GEMINI_API_KEY $quest
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

