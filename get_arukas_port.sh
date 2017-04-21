#!/bin/bash
curl -n https://app.arukas.io/api/containers \
  -H "Content-Type: application/vnd.api+json"  \
  -H "Accept: application/vnd.api+json" >> /root/sakura_temp.txt
cat /root/sakura_temp.txt | awk -F '19606bff-3875-4d7d-b253-f755d1863ddc' ' {print $2}' >> /root/sakura.txt
rm /root/sakura_temp.txt
cat /root/sakura.txt | awk -F 'service_port":' ' {print $2}' >> /root/sakura_temp.txt
rm /root/sakura.txt
cat /root/sakura_temp.txt | awk -F ',' ' {print $1}' >> /root/sakura_port.txt
rm /root/sakura_temp.txt
cat /root/sakura_port.txt
echo "Successful get the port!"
