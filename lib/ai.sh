# https://simonwillison.net/2023/May/18/cli-tools-for-llms/
# curl -s https://www.nytimes.com/ \
#   strip-tags .story-wrapper \
#   | ttok -t 4000 \
#   | llm --system 'summary bullet points'

# llm -m gemini-1.5-flash-latest 'explain ttx'
llm-gm1(){
	quest=$1
	llm -m gemini-1.5-flash-latest $quest
}

