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
cd ..


python subflow.py -mode=c -layers='28*28*1,5*5*1*6,5*5*6*16,400,84,10'
python subflow.py -mode=t -network_no=1 -data=mnist_data

python subflow.py -mode=ci -network_no=1 -data=mnist_data

python subflow.py -mode=sc -network_no=1
python subflow.py -mode=st -subflow_network_no=1 -utilization=0 -data=mnist_data
python subflow.py -mode=si -subflow_network_no=1 -utilization=0 -data=mnist_data
