#!/bin/bash
# step1 get the ip address
sh get_arukas_ip.sh
IP=`cat /root/sakura_ip.txt`
# step2 get the kcp port
sh get_arukas_kcp_port.sh
PORT=`cat /root/sakura_kcp_port.txt`
# step3 creat a new command line
COM=${IP}":"${PORT}
echo "$COM" >> command.txt
# step4 reset all var
rm /root/sakura_ip.txt /root/sakura_kcp_port.txt
unset IP PORT COM
cat command.txt
# step5 replace the command
sed -i 's/10.10.10.10:4000/$(echo $(cat command.txt))/g' /root/kcptun/client-config.json
rm  command.txt
sh /root/kcptun/start.sh
