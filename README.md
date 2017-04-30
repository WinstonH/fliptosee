# Flip to see a greater world
SSR 默认参数： \
服务器地址：你的服务器ip \
远程端口：443 \
本地端口：1080 \
密码：kcpbeta \
加密方式：aes-256-cfb \
协议：origin \
混淆：plain
## 如果ssr不幸崩溃，无法连接
登录服务器，复制粘贴，执行如下命令： 

reboot #重启服务器，稍后需要重新登录 \
python /root/shadowsocksr/shadowsocksserver.py -p 443 -k kcpbeta -m aes-256-cfb -O origin -o plain -d start #重新开启ssr 

即可
## For centOS
yum -y install wget \
wget --no-check-certificate https://raw.githubusercontent.com/WinstonH/fliptosee/master/onestep_centos.sh && chmod +x /root/onestep.sh && sh onestep.sh

## For ubuntu
apt-get -y install wget \
wget --no-check-certificate https://raw.githubusercontent.com/WinstonH/fliptosee/master/onestep_ubuntu.sh && chmod +x /root/onestep_ubuntu.sh && sh onestep_ubuntu.sh
