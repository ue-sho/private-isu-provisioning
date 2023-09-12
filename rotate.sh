#!/bin/bash

# nginx
sudo -S mv "/var/log/nginx/access.log" "/var/log/nginx/`date +"%Y%m%d%H%M%S"`_access.log"
sudo -S systemctl restart nginx

# mysql
sudo -S mv "/var/log/mysql/mysqlslow.log" "/var/log/nginx/`date +"%Y%m%d%H%M%S"`_mysqlslow.log"
sudo -S systemctl restart mysql
