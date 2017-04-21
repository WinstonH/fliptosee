#!/bin/bash
# step1 get the ip address
sh get_arukas_ip.sh
IP=`cat /root/sakura_ip.txt`
# step2 get the ssh port
sh get_arukas_ssh_port.sh
PORT=`cat /root/sakura_ssh_port.txt`
# step3 creat a new command line
COM="spawn ssh -p "${PORT}" root@"${IP}
echo "$COM" >> command.txt
# step4 reset all var
rm /root/sakura_ip.txt /root/sakura_ssh_port.txt
unset IP PORT COM
cat command.txt
# step5 replace the command
sed -i '5d' /root/autologin_arukas.sh
sed -i "5 s/^/$(echo $(cat command.txt))\n/" /root/autologin_arukas.sh
rm  command.txt
sh autologin_arukas.sh
