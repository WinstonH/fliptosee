#!/bin/bash
yum -y install wget
yum -y install git
git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git
cd /root/shadowsocksr/shadowsocks
python server.py -p 443 -k kcpbeta -m aes-256-cfb -O origin -o plain -d start
mkdir /root/kcptun
cd /root/kcptun
wget https://github.com/xtaci/kcptun/releases/download/v20161222/kcptun-linux-amd64-20161222.tar.gz
tar -zxvf kcptun-linux-amd64-20161222.tar.gz
touch /root/kcptun/start.sh
echo "" > /root/kcptun/start.sh
echo "
cd /root/kcptun/
./server_linux_amd64 -c /root/kcptun/server-config.json 2>&1 &
echo "Kcptun started."" >> /root/kcptun/start.sh
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
touch /root/kcptun/stop.sh
echo "" > /root/kcptun/stop.sh
echo "PID=`ps -ef | grep server_linux_amd64 | grep -v grep | awk '{print $2}'`
if [ "" != "$PID" ]; then
 echo "killing $PID"
 kill -9 $PID
fi" >> /root/kcptun/stop.sh
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
echo "Everything worked fine!"
