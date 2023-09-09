#!/bin/bash

sudo apt update
sudo apt upgrade
# percona-toolkitにpt-query-digestが含まれている
sudo apt install -y percona-toolkit dstat git unzip snapd graphviz tree

# alpのインストール
wget https://github.com/tkuchiki/alp/releases/download/v1.0.11/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo install alp /usr/local/bin/alp
rm alp_linux_amd64.zip alp
