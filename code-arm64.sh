#!/bin/bash

# 下载
wget -N --no-check-certificate -O code.deb https://github.com/lensfa-lzd/xray-ui/releases/latest/download/code_arm64.deb

# 安装
sudo dpkg -i code.deb

rm code.deb
