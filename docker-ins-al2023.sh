#!/bin/sh


sudo dnf install --allowerasing -y dnf-plugins-core dnf-utils grubby audit dbus \
    polkit systemd-container nss-util nss-tools udisks2 lvm2 dosfstools e2fsprogs \
    xfsprogs xfsprogs-xfs_scrub attr acl nfs4-acl-tools nfsv4-client-utils  \
    cifs-utils fuse3 gzip pigz bzip2 xz zstd star shadow-utils shadow-utils-subid \
    numactl libseccomp iproute-tc iptables-nft nftables conntrack-tools ipset \
    ethtool psutils python3 python3-pip policycoreutils-python-utils bash-completion \
    vim-minimal vim-default-editor wget git jq bind-utils mtr traceroute inotify-tools \
    docker containerd runc container-selinux cni-plugins oci-add-hooks \
    amazon-ecr-credential-helper udica

sudo yum install htop -y

sudo usermod -aG docker ec2-user

sudo systemctl enable --now docker

sudo chmod a+rw /var/run/docker.sock

# docker compose
# Install for all users
sudo mkdir -p /usr/local/lib/docker/cli-plugins

sudo curl -sL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) \
  -o /usr/local/lib/docker/cli-plugins/docker-compose

 # Set ownership to root and make executable
sudo chown root:root /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose