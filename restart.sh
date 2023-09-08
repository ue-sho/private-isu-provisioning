#!/bin/bash
set -e
cd /home/isucon/private_isu/webapp
git pull

# niginx
sudo cp -r etc/conf.d/ /etc/nginx/conf.d/
sudo /usr/sbin/nginx -t  # nginxの設定ファイルの構文チェック

# mysql
sudo cp etc/my.cnf /etc/mysql/my.cnf

# build
cd golang
go build -o app

# restart
sudo systemctl reload nginx
sudo systemctl restart isu-go
