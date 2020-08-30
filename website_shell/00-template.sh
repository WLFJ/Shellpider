#!/bin/bash

# 当有信息更新时的邮件标题
INFO="manjaro 更新了"
# 要监控的网址
URL="https://manjaro.org/download/"
# 例如我们关心如下字段:
# <a class="exapmle" herf="/foo/bar.html" target="_blank" title="foobar">foobar</a> 
# 则FIRST_PARSE将如上整行取出来,下面两行正则将引号中内容取出，用于邮件提示
# <a class="exapmle" herf="$SECOND_LINK_PARSE" target="_blank" title="$SECOND_TITLE_PARSE">foobar</a> 
FIRST_PARSE='<a class="dropdown-item".*</a>'
SECOND_LINK_PARSE='s/.*//'
SECOND_TITLE_PARSE='s/.*Architect&nbsp;&nbsp;&nbsp;\([^<]*\)<\/a>/\1/'
# 修改完毕后, 直接运行本脚本检查输出是否类似于
# [http://domain.com/foo/bar.html] [foobar]

if [ -e "parse.sh" ]; then
	source "parse.sh"
else
	source "../parse.sh"
fi
