#!/bin/bash
sudo chmod 777 /etc/default
env >> /etc/default/locale
sudo /usr/sbin/service cron start &>> /var/lib/mysql/cron-start.log
sudo chmod 777 -R /cron-shell
# for f in /cron-shell/*; do
        # sudo dos2unix "$f"
# done
echo "" >> /cron-shell/crontab.bak
crontab /cron-shell/crontab.bak
