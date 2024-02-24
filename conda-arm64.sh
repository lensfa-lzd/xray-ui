#!/bin/bash

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh
bash Miniconda3-latest-Linux-aarch64.sh -b
/home/ubuntu/miniconda3/bin/conda init
rm Miniconda3-latest-Linux-aarch64.sh
