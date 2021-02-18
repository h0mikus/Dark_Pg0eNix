#!/bin/sh
opkg update > /root/zai.log

opkg install zabbix-agentd  >> /root/zai.log

cat > /etc/zabbix_agentd.conf <<EOL
# PidFile=/var/run/zabbix_agentd.pid
LogType=system
AllowRoot=1
EnableRemoteCommands=1
Server=0.0.0.0/0
ServerActive=127.0.0.1
StartAgents=1
Include=/etc/zabbix_agentd.conf.d/
#TLSConnect=psk
#TLSAccept=psk
#TLSPSKFile=/etc/zabbix_agentd.psk
#TLSPSKIdentity=megacam
EOL

/etc/init.d/zabbix_agentd restart >> /root/zai.log
echo "install complite"  >> /root/zai.log
