#!/bin/bash
set -e
cd /home/isucon/private_isu/webapp
git pull

# niginx
sudo cp -r etc/nginx/conf.d/ /etc/nginx/conf.d/
sudo /usr/sbin/nginx -t  # nginxの設定ファイルの構文チェック

# mysql
sudo cp etc/my.cnf /etc/mysql/my.cnf

# build
cd golang
/home/isucon/.local/go/bin/go build -o app

# restart
sudo systemctl reload nginx
sudo systemctl restart isu-go
