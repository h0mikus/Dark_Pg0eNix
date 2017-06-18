#!/bin/bash
count=5
log_file=/root/ping.log

ping 8.8.8.8 -c $count -q -w $count > $log_file

#PING 8.8.8.8 (8.8.8.8): 56 data bytes
#
#--- 8.8.8.8 ping statistics ---
#5 packets transmitted, 5 packets received, 0% packet loss
#round-trip min/avg/max = 53.913/54.257/54.527 ms

sed -i "/PING /d" $log_file                             #clear text
sed -i "/--- /d" $log_file                              #clear text
sed -i "/round-trip/d" $log_file                        #clear text
sed -i "/^$/d" $log_file                                #clear text

sed -i "s/ packets transmitted, /\n/" $log_file         #change text
sed -i "/ packets received, /d" $log_file               #change text

result=$(cat $log_file)

#echo $count
#echo $result
#echo
#echo

if [[ "$count" = "$result" ]]
then
echo "Internet work";
else
echo "Internet not work";
fi
