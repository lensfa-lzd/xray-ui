#!/bin/bash

# 下载
wget -N --no-check-certificate -O /usr/local/xray-ui-linux-amd64.tar.gz https://github.com/lensfa-lzd/xray-ui/releases/latest/download/xray-ui-linux-amd64.tar.gz

# 解压
cd /usr/local/
tar -xvf xray-ui-linux-amd64.tar.gz
rm xray-ui-linux-amd64.tar.gz -f
cd xray-ui
chmod +x xray-ui bin/xray-linux-amd64
cp -f xray-ui.service /etc/systemd/system/
wget --no-check-certificate -O /usr/bin/xray-ui https://raw.githubusercontent.com/qist/xray-ui/main/xray-ui.sh
chmod +x /usr/bin/xray-ui
systemctl daemon-reload
systemctl enable xray-ui
systemctl start xray-ui
# 设置账号密码：
/usr/local/xray-ui/xray-ui setting -username lensfa -password 123456
# 设置端口
/usr/local/xray-ui/xray-ui setting -port  8080
systemctl restart xray-ui