# pull docker from docker hub
#docker pull nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04
# docker run -it nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04 /bin/bash

apt update && apt install vim git python python-pip -y
pip install --upgrade pip
pip install --upgrade setuptools
pip install tensorflow==1.13.1
git clone https://github.com/learning1234embed/SubFlow.git
cd SubFlow/subflow_op
bash build_all.sh

