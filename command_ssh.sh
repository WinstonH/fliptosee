#!/bin/bash
# step1 get the ip address
sh get_arukas_ip.sh
IP=`cat /root/sakura_ip.txt`
# step2 get the ssh port
sh get_arukas_port.sh
PORT=`cat /root/sakura_port.txt`
# step3 creat a new command line
COM="spawn ssh -p "${PORT}" root@"${IP}
echo "$COM" >> command.txt
# step4 reset all
rm /root/sakura_ip.txt /root/sakura_port.txt
unset IP PORT COM
cat command.txt