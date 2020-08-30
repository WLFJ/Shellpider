# Shellpider
A simple implemented website update monitor by shell.

# Usage

First rename `mailit.example.sh` to `mailit.sh`, edit it with necessary info. And also for shell-spider.sh, add both sender and receiver email address.

Then run following command make sure you can receieve email from script(due to your internet connection, it may take time. ):

```shell
echo -e "From:mail1@yourdomain.com\nTo:mail2@yourdomain.com\nSubject:It works!\n\nCongratulations!" > mail.txt && bash mailit.sh && rm -f mail.txt
```

Then look at `**-template.sh` modify it make sure it can get correct infomation back.

One last step, move all your modified `sh` script to `website_shell/` folder (I know, a bad name) and run following command to make it run at background. (or just `bash shell-spider.sh` make sure everything works well. )

```shell
nohup bash shell-spider.sh &
```

It will run in background.

Anyway you can kill the task:

```shell
kill $(ps aux | grep shell-spider.sh | cut -d " " -f 2-3 | head -1)
```
