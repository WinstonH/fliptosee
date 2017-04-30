# Flip to see a greater world
SSR 默认参数： \
服务器地址：你的服务器ip \
远程端口：443 \
本地端口：1080 \
密码：kcpbeta \
加密方式：aes-256-cfb \
协议：origin \
混淆：plain
## For centOS
yum -y install wget \
wget --no-check-certificate https://raw.githubusercontent.com/WinstonH/fliptosee/master/onestep_centos.sh && chmod +x /root/onestep.sh && sh onestep.sh

## For ubuntu
apt-get -y install wget \
wget --no-check-certificate https://raw.githubusercontent.com/WinstonH/fliptosee/master/onestep_ubuntu.sh && chmod +x /root/onestep_ubuntu.sh && sh onestep_ubuntu.sh
