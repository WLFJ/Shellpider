#!/bin/bash

INFO="浙大软院-招生信息"
URL="http://www.cst.zju.edu.cn/32178/list.htm"
FIRST_PARSE='<span class="lm_new_zk">.*</a></span>'
SECOND_LINK_PARSE='s/.*href='\''\/\([^'\'']*\)'\''.*title='\''.*'\''>.*/\1/'
SECOND_TITLE_PARSE='s/.*href='\''[^'\'']*'\''.*title='\''\(.*\)'\''>.*/\1/'

source "../parse.sh"
