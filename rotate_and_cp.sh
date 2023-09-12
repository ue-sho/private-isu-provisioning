#!/bin/bash

# nginx
NGINX_LOGFILE="`date +"%Y%m%d%H%M%S"`_access.log"
sudo -S mv "/var/log/nginx/access.log" "/var/log/nginx/$NGINX_LOGFILE"
sudo -S cp "/var/log/nginx/$NGINX_LOGFILE" "log/nginx/$NGINX_LOGFILE"
sudo -S chown isucon:isucon "log/nginx/$NGINX_LOGFILE"
sudo -S systemctl restart nginx

# mysql
MYSQL_LOGFILE="`date +"%Y%m%d%H%M%S"`_mysqlslow.log"
sudo -S mv "/var/log/mysql/mysqlslow.log" "/var/log/mysql/$MYSQL_LOGFILE"
sudo -S cp "/var/log/mysql/$MYSQL_LOGFILE" "log/mysql/$MYSQL_LOGFILE"
sudo -S chown isucon:isucon "log/mysql/$MYSQL_LOGFILE"
sudo -S systemctl restart mysql
