#Auto init env for ubuntu 16.04
sudo apt-get upgrade
sudo apt-get -y update
sudo apt-get -y install python-pip python3-pip 

#update python
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
sudo apt-get install python3.6
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
sudo apt-get install python3-pip
#sudo pip3 install --upgrade pip
wget https://bootstrap.pypa.io/get-pip.py  --no-check-certificate
sudo python3 get-pip.py

#pip change resource
mkdir -p ~/.pip/
cat>~/.pip/pip.conf<<EOF
[global]
trusted-host = mirrors.aliyun.com
index-url = http://mirrors.aliyun.com/pypi/simple
EOF
sudo pip3 install flyai-gpu 

#chrome
sudo wget https://repo.fdzh.org/chrome/google-chrome.list -P /etc/apt/sources.list.d/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub  | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

#nvidia driver + cuda + cudnn
#see https://blog.csdn.net/qq_33200967/article/details/80689543
sudo dpkg -i cuda-repo-ubuntu1604_10.1.168-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt-get update
sudo apt-get install cuda

#manual download https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.6.1.34/prod/10.1_20190620/cudnn-10.1-linux-x64-v7.6.1.34.tgz
sudo cp cuda/lib64/* /usr/local/cuda-10.1/lib64/
sudo cp cuda/include/* /usr/local/cuda-10.1/include/

cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2

#sougou pinyin
wget http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb
dpkg -i sogoupinyin_2.2.0.0108_amd64.deb

#wine
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main'
sudo apt install --install-recommends winehq-stable
