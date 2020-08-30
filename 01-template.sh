#!/bin/bash

INFO=""
URL="http://domain.com/info.html"
FIRST_PARSE='<span class="test">.*</a></span>'
SECOND_LINK_PARSE='s/.*href='\''\/\([^'\'']*\)'\''.*title='\''.*'\''>.*/\1/'
SECOND_TITLE_PARSE='s/.*href='\''[^'\'']*'\''.*title='\''\(.*\)'\''>.*/\1/'

if [ -e "parse.sh" ]; then
	source "parse.sh"
else
	source "../parse.sh"
fi
