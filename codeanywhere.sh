#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
apt-get update
export LANG=zh_CN.UTF-8
apt-get update
apt-get install -y xfce4 xfce4-goodies 
apt-get install -y supervisor python ttf-wqy-microhei autocutsel
apt-get install -y tightvncserver 
apt-get clean

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt-get update
apt-get install google-chrome-stable firefox-locale-zh-hans firefox -y
apt-get clean

mkdir /root/.vnc
cd /root/.vnc
wget https://raw.githubusercontent.com/queeno/docker-ubuntu-desktop/master/xstartup
wget https://raw.githubusercontent.com/queeno/docker-ubuntu-desktop/master/passwd
chmod 600 /root/.vnc/passwd
chmod +x /root/.vnc/xstartup
cat /root/.vnc/xstartup
cd /root
/usr/bin/vncserver :1 -geometry 1280x800 -depth 24

git clone https://github.com/shadowsocksr-rm/shadowsocksr.git
git clone https://github.com/novnc/noVNC.git /noVNC
ln -s /noVNC/vnc.html /noVNC/index.html
touch /etc/supervisor/conf.d/vnc.conf
touch /etc/supervisor/conf.d/ssr.conf
echo "[program:noVNC]
command=/noVNC/utils/launch.sh --vnc localhost:5901 --listen 3000
user=root
autorestart=true
priority=200" >> /etc/supervisor/conf.d/vnc.conf
echo "[program:noVNC]
command=python server.py
directory=/root/shadowsocksr/shadowsocks
user=root
autorestart=true
priority=200" >> /etc/supervisor/conf.d/ssr.conf

service supervisor restart
apt-get clean
rm -rf /var/lib/apt/lists/*
