#!/bin/bash
bash <(curl -fsSL https://gh.lensfa.cn/https://github.com/lensfa-lzd/xray-ui/raw/main/docker-ins-al2023.sh)
docker pull public.ecr.aws/lensfa/workos-kasm:workos-controller

# 复制控制文件
mkdir -p /home/ec2-user/controller
docker create --name temp-container public.ecr.aws/lensfa/workos-kasm:workos-controller
docker cp temp-container:/home/ec2-user/controller /home/ec2-user
docker rm temp-container

mkdir -p /home/ec2-user/work/xray
mkdir -p /home/ec2-user/docker
curl -o /home/ec2-user/work/data.zip https://gh.lensfa.cn/https://raw.githubusercontent.com/lensfa-lzd/xray-ui/main/upload-data-2024-05-29.zip
curl -o /home/ec2-user/docker/docker-compose.yml https://gh.lensfa.cn/https://raw.githubusercontent.com/lensfa-lzd/xray-ui/main/docker-compose.yml
# shellcheck disable=SC2164
cd /home/ec2-user/work
unzip data.zip
rm data.zip
# shellcheck disable=SC2164
cd /home/ec2-user/docker
docker compose up -d