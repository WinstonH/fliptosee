#!/bin/bash
echo "" > sakura_status.txt

# then check it over time
until [[ $(echo $(cat sakura_status.txt)) = "true" ]]
do
# restart the container
curl -n -X DELETE https://app.arukas.io/api/containers/382146ff-e06a-49ee-b9f9-5833cf7048e1/power \
  -H "Content-Type: application/vnd.api+json"  \
  -H "Accept: application/vnd.api+json"
sleep 60
curl -n -X POST https://app.arukas.io/api/containers/382146ff-e06a-49ee-b9f9-5833cf7048e1/power \
  -H "Content-Type: application/vnd.api+json"  \
  -H "Accept: application/vnd.api+json"
# over
sleep 300
# check the status
curl -n https://app.arukas.io/api/containers \
  -H "Content-Type: application/vnd.api+json"  \
  -H "Accept: application/vnd.api+json" >> /root/sakura_temp.txt
cat /root/sakura_temp.txt | awk -F '382146ff-e06a-49ee-b9f9-5833cf7048e1' ' {print $2}' >> /root/sakura.txt
rm /root/sakura_temp.txt
cat /root/sakura.txt | awk -F '"is_running":' ' {print $2}' >> /root/sakura_temp.txt
rm /root/sakura.txt
cat /root/sakura_temp.txt | awk -F ',' ' {print $1}' > /root/sakura_status.txt
rm /root/sakura_temp.txt
cat /root/sakura_status.txt
echo "Successfully get the status!"
done
date
