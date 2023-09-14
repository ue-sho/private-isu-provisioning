#!/bin/bash

# nginx
NGINX_LOGFILE="`date +"%Y%m%d%H%M%S"`_access.log"
sudo -S cat /var/log/nginx/access.log | alp --sort sum -r json  --matching-groups="/posts/[0-9]+,/image/\d+,/@\w+" | tee log/nginx/alp_$(date +%Y%m%d-%H%M%S).txt
sudo -S mv "/var/log/nginx/access.log" "/var/log/nginx/$NGINX_LOGFILE"
sudo -S cp "/var/log/nginx/$NGINX_LOGFILE" "log/nginx/$NGINX_LOGFILE"
sudo -S chown isucon:isucon "log/nginx/$NGINX_LOGFILE"
sudo -S systemctl reload nginx

# mysql
MYSQL_LOGFILE="`date +"%Y%m%d%H%M%S"`_mysqlslow.log"
sudo -S pt-query-digest /var/log/mysql/mysqlslow.log | tee log/mysql/digest_$(date +%Y%m%d-%H%M%S).txt
sudo -S mv "/var/log/mysql/mysqlslow.log" "/var/log/mysql/$MYSQL_LOGFILE"
sudo -S cp "/var/log/mysql/$MYSQL_LOGFILE" "log/mysql/$MYSQL_LOGFILE"
sudo -S chown isucon:isucon "log/mysql/$MYSQL_LOGFILE"
sudo -S mysqladmin flush-logs
