#!/bin/bash
curl -n https://app.arukas.io/api/containers \
  -H "Content-Type: application/vnd.api+json"  \
  -H "Accept: application/vnd.api+json" >> /root/sakura_temp.txt
cat /root/sakura_temp.txt | awk -F '382146ff-e06a-49ee-b9f9-5833cf7048e1' ' {print $2}' >> /root/sakura.txt
rm /root/sakura_temp.txt
cat /root/sakura.txt | awk -F 'service_port":' ' {print $2}' >> /root/sakura_temp.txt
rm /root/sakura.txt
cat /root/sakura_temp.txt | awk -F ',' ' {print $1}' >> /root/sakura_ssh_port.txt
rm /root/sakura_temp.txt
cat /root/sakura_ssh_port.txt
echo "Successful get the ssh port!"
