#!/bin/bash

function setup_sniproxy() {
      case $(uname -m) in \
      "x86_64")   export TAG="amd64" ;; \
      "aarch64")   export TAG="arm64" ;; \
      *) echo "Unsupported TARGETPLATFORM: $(uname -m)" && exit 1 ;; \
    esac;

sudo mkdir /tmp/sniproxy
sudo mkdir /etc/sniproxy
sudo wget https://github.com/XIU2/SNIProxy/releases/latest/download/sniproxy_linux_${TAG}.tar.gz -O /tmp/sniproxy/sniproxy_linux_${TAG}.tar.gz
sudo tar -zxvf /tmp/sniproxy/sniproxy_linux_${TAG}.tar.gz -C /tmp/sniproxy
sudo mv /tmp/sniproxy/sniproxy /etc/sniproxy
sudo rm -rf /tmp/sniproxy
sudo chmod +x /etc/sniproxy/sniproxy

echo "listen_addr: \":443\"
allow_all_hosts: true" | sudo tee /etc/sniproxy/config.yaml

echo "[Unit]
Description=SNI Proxy
After=network.target

[Service]
ExecStart=/etc/sniproxy/sniproxy -c /etc/sniproxy/config.yaml -l /etc/sniproxy/sni.log
Restart=on-failure

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/sniproxy.service
}

setup_sniproxy


sudo systemctl daemon-reload

# 启用该系统服务 并 允许开机启动
sudo systemctl enable sniproxy

# 立即启动
sudo systemctl start sniproxy