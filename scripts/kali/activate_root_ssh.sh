#!/bin/bash
echo "Enable SSH Kali Linux"
echo
echo "Stopping SSH"
echo
service ssh stop
# Script stop ssh daemon

grep -r "#PermitRootLogin prohibit-password" /etc/ssh/sshd_config &> /dev/null
# Check if there is a record in config file

if [ $? == 0 ]; then
# Compare resul. If result = 0 then config file have record "#PermitRootLogin prohibit-password" and script change it. If resul = 1,
# script skip change

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.old
# Make config backup!!! Every time make backup config, it easy way to live withou problems

sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# Script replace record to activate ssh session with "root" login!!! Do it if use great password at root account or you use linux at VM

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
# Script checking start ssh with system. If no then change value to start
if [ $? == 0 ]; then
echo "Service is already activated"
else
systemctl enable ssh
echo "Service activated"
fi

service ssh start
# Script start ssh daemon
