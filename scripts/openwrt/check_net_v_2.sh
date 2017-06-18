#!/bin/bash
cur_time=$(date '+%H_%M_%S')

ping 8.8.8.8 -c 5 &>/dev/null
if [ $? != 0 ]
then
echo "Internet not work"
echo "Restarting Wi-Fi connections"
touch /root/$cur_time
wifi down
sleep 10
wifi up
echo "Wi-Fi connections restarted"
else
echo "Internet work"
fi
