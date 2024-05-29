#!/bin/bash
bash <(curl -fsSL https://gh.aws-shop.uk/https://github.com/lensfa-lzd/xray-ui/raw/main/docker-ins-al2023.sh)
docker pull public.ecr.aws/lensfa/workos-kasm:ub22
mkdir -p /home/ec2-user/work/xray
mkdir -p /home/ec2-user/kasm
curl -o /home/ec2-user/work/data.zip https://raw.githubusercontent.com/lensfa-lzd/xray-ui/main/upload-data-2024-05-29.zip
curl -o /home/ec2-user/kasm/docker-compose.yml https://raw.githubusercontent.com/lensfa-lzd/xray-ui/main/docker-compose.yml
cd /home/ec2-user/work
unzip data.zip
rm data.zip