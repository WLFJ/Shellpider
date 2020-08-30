#!/bin/bash

INFO="中北大学-教务动态"
URL="http://jwc.nuc.edu.cn/index/jwdt.htm"
FIRST_PARSE='<a class="c54561".*>'
SECOND_LINK_PARSE='s/.*href="\(.*\)" target="_blank" title="\(.*\)">$/\1/'
SECOND_TITLE_PARSE='s/.*href="\(.*\)" target="_blank" title="\(.*\)">$/\2/'

source "../parse.sh"
