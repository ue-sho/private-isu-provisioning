#!/bin/bash
set -e
cd /home/isucon/private_isu/webapp
git pull

# niginx
sudo cp nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp nginx/sites-available/isucon.conf /etc/nginx/sites-available/isucon.conf

sudo /usr/sbin/nginx -t  # nginxの設定ファイルの構文チェック

# mysql
sudo cp mysql/my.cnf /etc/mysql/my.cnf
sudo systemctl restart mysql

# build
cd golang
/home/isucon/.local/go/bin/go build -o app

# restart
sudo systemctl restart nginx
sudo systemctl restart isu-go

