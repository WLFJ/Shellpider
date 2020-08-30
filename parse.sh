#!/bin/bash

# insert your website title here
INFO=""

if [[ $1 == "GET_INFO" ]]; then
	echo ${INFO}
	exit 0
fi

# website URL
URL=""
DOMAIN_URL=$(echo ${URL} | sed 's/\(http:\/\/[^/]*\/\).*/\1/')
SUB_URL=$(echo ${URL} | sed 's/\(http:\/\/[^/]*\/[^/]*\/\).*/\1/')

IS_OK=0

curl -s ${URL}| while read LINE 
# cat res.txt | while read LINE 
do
	# Change inorder to find exactly title HTML-expr.
	TMP_TITLE=$(grep -oE '<a class="demo".*>' <<< ${LINE})
	RES_CODE=${?}
	if [ $RES_CODE -eq 0 ];then
		LINK_URL=$(echo ${TMP_TITLE} | sed 's/.*href="\(.*\)" target="_blank" title="\(.*\)">$/\1/')
		TITLE=$(echo ${TMP_TITLE} | sed 's/.*href="\(.*\)" target="_blank" title="\(.*\)">$/\2/')
		if [[ ${LINK_URL:0:2} == ".." ]];then
			LINE_URL="${DOMAIN_URL}${LINK_URL:3}"
		else
			LINE_URL="${SUB_URL}${LINK_URL}"
		fi
		echo "[${LINE_URL}] [${TITLE}]"
		IS_OK=1
		break
	fi
done
if [ $IS_OK -eq 0 ]; then
	exit 0
else
	exit 1
fi

