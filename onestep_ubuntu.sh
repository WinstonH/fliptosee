apt-get -y install wget
apt-get -y install git
apt-get install -y unzip zip
git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git
cd /root/shadowsocksr/shadowsocks
python server.py -p 443 -k kcpbeta -m aes-256-cfb -O origin -o http_simple -d start
echo "SSR已启动！"
# Now install Kcptun
mkdir /root/kcptun
cd /root/kcptun
wget --no-check-certificate  https://github.com/xtaci/kcptun/releases/download/v20161222/kcptun-linux-amd64-20161222.tar.gz
tar -zxvf kcptun-linux-amd64-20161222.tar.gz
# 创建 执行脚本
rm /root/kcptun/start.sh
rm /root/kcptun/stop.sh
rm /root/kcptun/restart.sh
wget --no-check-certificate https://github.com/WinstonH/fliptosee/raw/master/packup.zip
unzip packup.zip
rm /root/kcptun/packup.zip
chmod +x /root/kcptun/*.sh
sh /root/kcptun/start.sh
echo "恭喜，ShadowsocksR+Kcptun安装已完成"
