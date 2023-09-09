#!/bin/bash

sudo -S mv "/var/log/nginx/access.log" "/var/log/nginx/`date +"%Y%m%d%H%M%S"`_access.log"
sudo -S systemctl restart nginx
