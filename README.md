# Shellpider
A simple implemented website update monitor by shell.

# Usage

First rename `mailit.example.sh` to `mailit.sh`, edit it with necessary info.

Then run following command make sure you can receieve email from script(due to your internet connection, it may take time.):

```shell
echo -e "From:mail1@yourdomain.com\nTo:mail2@yourdomain.com\nSubject:It works!\n\nCongratulations!" > mail.txt && bash mailit.sh && rm -f mail.txt
```

Then modify `website_shell/00-template.sh`(I know, a bad name.). You need to add URL and crucial regex make sure it can fetch every thing you want.

Just copy same `sh` file into `website_shell`, spider will automatically invoke it in period of time.

In `shell-spider.sh` you need add *email* *revoking delay time*.

One last step, run following command:

```shell
nohup bash shell-spider.sh &
```

It will run in background.

Anyway you can kill the task:

```shell
kill $(ps aux | grep shell-spider.sh | cut -d " " -f 2-3 | head -1)
```
