#!/bin/bash
bash <(curl -fsSL https://gh.aws-shop.uk/https://github.com/lensfa-lzd/xray-ui/raw/main/docker-ins-al2023.sh)
docker pull public.ecr.aws/lensfa/workos-kasm:workos-controller
mkdir -p /home/ec2-user/work/xray
mkdir -p /home/ec2-user/docker
curl -o /home/ec2-user/work/data.zip https://gh.aws-shop.uk/https://raw.githubusercontent.com/lensfa-lzd/xray-ui/main/upload-data-2024-05-29.zip
curl -o /home/ec2-user/docker/docker-compose.yml https://gh.aws-shop.uk/https://raw.githubusercontent.com/lensfa-lzd/xray-ui/main/docker-compose.yml
# shellcheck disable=SC2164
cd /home/ec2-user/work
unzip data.zip
rm data.zip
# shellcheck disable=SC2164
cd /home/ec2-user/docker
docker compose up -d