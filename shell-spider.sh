#!/bin/bash

DELAY=$((10 * 60))

MAIL_FROM=""
MAIL_TO=""

MAIL_HEAD="From:${MAIL_FROM}\nTo:${MAIL_TO}\nSubject:"

if [ ! -d "db" ];then
	mkdir db
fi

if [ ! -d "website_shell" ];then
	mkdir website_shell
fi

function check_job(){
	readarray -t SHELL_ARR <<< $(ls -1 "website_shell")

	INC=0
	for SH in "${SHELL_ARR[@]}";do
		echo "$(date +%H:%M:%S)--正在运行--${SH}"
		BACK=$(bash "website_shell/${SH}")
		if [ $? -ne 0 ];then
			echo "$(date +%H:%M:%S)--运行错误"
			continue
		fi
		
		TITLE=$(sed 's/\[.*\] \[\(.*\)\]/\1/' <<< $BACK)
		LINK=$(sed 's/\[\(.*\)\] \[.*\]/\1/' <<< $BACK)
		RECORD_FILENAME="db/${SH/\.*/}"
		EMAIL_CONTENT=""
		if [ ! -e ${RECORD_FILENAME} ]; then
			echo "$TITLE" > "${RECORD_FILENAME}"
			EMAIL_CONTENT="${MAIL_HEAD}新添加信息获取成功\n\n这是当前最新内容\n${TITLE}\n${LINK}"
		else
			read RECORD < "$RECORD_FILENAME"
			if [[ ${TITLE} == ${RECORD} ]]; then
				echo "没有更新"
			else
				INFO=$(bash "website_shell/${SH}" "GET_INFO")
				EMAIL_CONTENT="${MAIL_HEAD}[最新]${INFO}\n\n这是当前最新内容\n${TITLE}\n${LINK}"
				echo "$TITLE" > "${RECORD_FILENAME}"
			fi
		fi
		if [[ -n $EMAIL_CONTENT ]]; then
			echo -e $EMAIL_CONTENT > "mail.txt"
			bash "mailit.sh"
			if [ $? -ne 0 ]; then
				echo "发送邮件失败"	
			fi
		fi
		
		sleep $DELAY
		INC=$[$INC+1]
	done
}

while :
do
	check_job
	sleep $DELAY
done

