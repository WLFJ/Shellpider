#!/bin/bash

if [[ $1 == "GET_INFO" ]]; then
	echo ${INFO}
	exit 0
fi

DOMAIN_URL=$(echo ${URL} | rev | sed -r 's/^([^/]*){1}\/([^/]*){1}(.*)/\3/' | rev )
SUB_URL=$(echo ${URL} | sed 's/\(^.*\/\).*/\1/')

IS_OK=0

PAGE=$(curl -s ${URL})
if [ $? -ne 0 ]; then
	exit 1
fi

echo "${PAGE}" | while read LINE 

do
	TMP_TITLE=$(grep -oE "${FIRST_PARSE}" <<< ${LINE})
	RES_CODE=${?}
	if [ $RES_CODE -eq 0 ];then
		LINK_URL=$(echo ${TMP_TITLE} | sed "${SECOND_LINK_PARSE}")
		TITLE=$(echo ${TMP_TITLE} | sed "${SECOND_TITLE_PARSE}")
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

