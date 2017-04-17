#!/bin/bash
yum -y install wget
yum -y install git
git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git
cd /root/shadowsocksr/shadowsocks
python server.py -p 443 -k kcpbeta -m aes-256-cfb -O origin -o plain -d start
# Now install Kcptun
mkdir /root/kcptun
cd /root/kcptun
wget --no-check-certificate  https://github.com/xtaci/kcptun/releases/download/v20161222/kcptun-linux-amd64-20161222.tar.gz
tar -zxvf kcptun-linux-amd64-20161222.tar.gz
# 创建 执行脚本
rm /root/kcptun/start.sh
rm /root/kcptun/stop.sh
rm /root/kcptun/restart.sh
wget --no-check-certificate 
# 创建Kcptun配置
touch /root/kcptun/server-config.json
echo "" > /root/kcptun/server-config.json
echo "{
    "listen": ":4000",
    "target": "127.0.0.1:443",
    "key": "kcptest",
    "crypt": "aes-192",
    "mode": "fast2",
    "mtu": 1400,
    "sndwnd": 512,
    "rcvwnd": 512,
    "datashard": 70,
    "parityshard": 30,
    "dscp": 46,
    "nocomp": false,
    "acknodelay": false,
    "nodelay": 0,
    "interval": 40,
    "resend": 0,
    "nc": 0,
    "sockbuf": 4194304,
    "keepalive": 10,
    "log": "/root/kcptun/kcptun.log"
}" >> /root/kcptun/server-config.json
# 创建 stop.sh
touch /root/kcptun/stop.sh
echo "" > /root/kcptun/stop.sh
echo "PID=`ps -ef | grep server_linux_amd64 | grep -v grep | awk '{print $2}'`
if [ "" != "$PID" ]; then
 echo "killing $PID"
 kill -9 $PID
fi" >> /root/kcptun/stop.sh
# 创建 restart.sh
touch /root/kcptun/stop.sh
echo "" > /root/kcptun/restart.sh
echo "cd /root/kcptun/
echo "Stopping Kcptun..."
bash stop.sh
bash start.sh
echo "Kcptun started."" >> /root/kcptun/restart.sh
chmod +x /root/kcptun/*.sh
sh /root/kcptun/start.sh
chmod +x /etc/rc.d/rc.local && echo "sh /root/kcptun/start.sh" >> /etc/rc.d/rc.local
echo "恭喜，安装完成"
