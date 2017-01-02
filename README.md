# sync-and-mail

For sftp-servers that does not allow ssh-shell access. Mounts the remote file system locally, then runs `rsync` and emails the newly added files as email attachments.

`mutt` needs to be setup to be able to send email. 

configure the `credentials.sh` file and then run the script with `./sync.sh` (or use crontab).
