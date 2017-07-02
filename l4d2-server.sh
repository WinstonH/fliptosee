#!/bin/sh
apt-get update && apt-get install -y lib32gcc1 wget
mkdir steamcmd && cd steamcmd
wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
tar -zxvf steamcmd_linux.tar.gz
cd steamcmd
./steamcmd.sh +login anonymous +force_install_dir /l4d2 +app_update 222860 validate +quit
touch run.sh
chmod +x run.sh
echo "#!/bin/sh
nohub ./srcds_run -game left4dead2 +exec config.cfg"
echo "L4D2服务器已安装完成，请编辑配置文件/l4d2/left4dead2/cfg/server.cfg后再运行本目录下的run.sh"
