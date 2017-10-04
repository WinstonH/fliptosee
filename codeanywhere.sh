#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
apt-get update
apt-get install -y --no-install-recommends ubuntu-desktop
apt-get clean && apt-get update
apt-get install -y gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal ttf-wqy-microhei
apt-get install -y tightvncserver
apt-get install -y guacamole-tomcat
apt-get clean

mkdir /root/.vnc
cd /root/.vnc
wget https://raw.githubusercontent.com/queeno/docker-ubuntu-desktop/master/xstartup
wget https://raw.githubusercontent.com/queeno/docker-ubuntu-desktop/master/passwd
chmod 600 /root/.vnc/passwd
chmod +x /root/.vnc/xstartup
/usr/bin/vncserver :1 -geometry 1280x800 -depth 24

cd
ln -s /var/lib/guacamole/guacamole.war /var/lib/tomcat6/webapps
mkdir /usr/share/tomcat6/.guacamole/
ln -s /etc/guacamole/guacamole.properties /usr/share/tomcat6/.guacamole/
cat /etc/guacamole/user-mapping.xml

/etc/init.d/tomcat6 restart
