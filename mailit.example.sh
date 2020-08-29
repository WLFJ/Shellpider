#!/bin/bash

curl -s --url "smtps://smtp.yourserver.com" --mail-from "email1@yourdomain.com" --mail-rcpt "mail2@yourdomain.com" --upload-file mail.txt --user "uS3RnAmE@yourdomain.com:pAsSwOrD" > /dev/null

exit ${?}
