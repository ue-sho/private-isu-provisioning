#!/bin/bash

LOGFILE="`date +"%Y%m%d%H%M%S"`_access.log"
sudo -S mv "/var/log/nginx/access.log" "/var/log/nginx/$LOGFILE"
sudo -S cp "/var/log/nginx/$LOGFILE" "log/$LOGFILE"
sudo -S chown isucon:isucon "log/$LOGFILE"
sudo -S systemctl restart nginx
