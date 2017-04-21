#!/bin/bash
cd /root/kcptun/
./client_linux_amd64 -c /root/kcptun/client-config.json 2>&1 &
echo "Kcptun 启动."
