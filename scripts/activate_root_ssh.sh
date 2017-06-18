#!/bin/bash
echo "Enable SSH Kali Linux"
echo
echo "Stopping SSH"
echo
service ssh stop

grep -r "#PermitRootLogin prohibit-password" /etc/ssh/sshd_config &> /dev/null

if [ $? == 0 ]; then
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.old
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
echo "Permition changed. Now try connect to 22 port"
echo
else
echo "Script not found Permit value or permit was changed earlier"
echo "Please check manually /etc/ssh/sshd_config"
echo
echo "Now SSH working and you can try connect to server"
fi

echo "Activating SSH Service"
echo
systemctl is-enable ssh &> /dev/null
if [ $? == 0 ]; then
echo "Service is already activated"
else
systemctl enable ssh
echo "Service activated"
fi

service ssh start
